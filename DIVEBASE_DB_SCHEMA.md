# DiveBase Database Schema (MVP Final)

## Project Scope

DiveBase is a diving log application supporting:

- Scuba diving logs
- Freediving logs
- Apple / Google authentication (Supabase Auth)
- KR-only (country_code = 'KR')
- City-level regional selection
- Global dive point autocomplete
- Gear normalization (N:M structure)
- User-private logs via RLS
- Max 10 media files per dive (DB enforced)

---

# 1. Authentication Model

- Authentication handled by `auth.users`
- Application user data stored in `public.profiles`
- All user-owned records reference `auth.users.id`

---

# 2. Tables Overview

## User Domain
- profiles
- user_stats

## Location Domain
- geo_regions
- dive_points

## Logs
- scuba_dives
- free_dives

## Gear (Normalized)
- gear_items
- scuba_dive_gear
- free_dive_gear

## Media
- scuba_dive_media
- free_dive_media

---

# 3. User Tables

## profiles

Primary Key:
- user_id (FK → auth.users.id)

Fields:

| Column | Type |
|---------|------|
| nickname | text (unique, required) |
| gender | enum (male/female/other/unknown) |
| birth_date | date |
| scuba_has_license | boolean |
| scuba_level | text |
| scuba_agency | text |
| is_scuba_instructor | boolean |
| free_has_license | boolean |
| free_level | text |
| free_agency | text |
| is_free_instructor | boolean |
| created_at | timestamptz |
| updated_at | timestamptz |

RLS:
- Users can only read/update their own profile.

---

## user_stats

Stores initial dive count offsets.

| Column | Type |
|--------|------|
| user_id | uuid (PK, FK) |
| initial_scuba_dive_count | int |
| initial_free_dive_count | int |

Total dives = initial_count + actual log count.

---

# 4. Location System

## geo_regions

KR city master table.

| Column | Type |
|--------|------|
| country_code | text ('KR') |
| city | text |
| is_active | boolean |
| sort_order | int |

Used only for dropdown selection.

---

## dive_points

Global autocomplete pool.

Purpose:
- City selected → existing dive points shown
- User may insert new dive point
- All users see newly inserted points

Fields:

| Column | Type |
|--------|------|
| id | uuid |
| country_code | text ('KR') |
| city | text |
| name | text |
| normalized_name | generated lower(trim(name)) |
| created_by | uuid (FK) |
| created_at | timestamptz |

Uniqueness:
(country_code, lower(city), normalized_name)

RLS:
- All authenticated users can read
- Authenticated users can insert
- No update/delete in MVP

---

# 5. Logs

## scuba_dives

Required:
- dive_date
- country_code ('KR')
- city
- in_time
- out_time
- max_depth_m
- start_bar
- end_bar

Auto-generated:
- duration_min
- used_bar

Structure:

| Column | Type |
|--------|------|
| user_id | uuid |
| dive_no | int (unique per user) |
| dive_date | date |
| country_code | text |
| city | text |
| dive_point_id | uuid (FK) |
| center_name | text |
| purpose | enum (fun/training) |
| entry | enum (boat/beach/skin) |
| water | enum (sea/fresh/pool) |
| weather | enum |
| visibility | enum |
| air_temp_c | numeric |
| water_temp_c | numeric |
| wave_m | numeric |
| wind_mps | numeric |
| in_time | timestamptz |
| out_time | timestamptz |
| duration_min | generated |
| max_depth_m | numeric |
| gas | enum |
| start_bar | int |
| end_bar | int |
| used_bar | generated |
| tank | enum |
| weight_kg | numeric |
| weight_feel | enum |
| suit | text |
| marine_life | text |
| buddy | text |
| leader | text |
| team | text |
| instructor | text |
| note | text |

RLS:
- Users can only access their own logs.

---

## free_dives

Required:
- dive_date
- max_depth_m

Time fields optional.

Structure similar to scuba_dives but without gas/pressure.

---

# 6. Gear Normalization

## gear_items

Master list of equipment.

| Column | Type |
|--------|------|
| code | text (unique) |
| name_ko | text |
| dive_kind | 'scuba' / 'free' / 'both' |
| sort_order | int |
| is_active | boolean |

Filtered via:
- scuba: dive_kind in ('scuba','both')
- free: dive_kind in ('free','both')

---

## scuba_dive_gear

Join table:

| dive_id | gear_item_id |

Primary key:
(dive_id, gear_item_id)

---

## free_dive_gear

Same structure as scuba_dive_gear.

---

# 7. Media

## scuba_dive_media
## free_dive_media

Fields:

| Column | Type |
|--------|------|
| dive_id | uuid |
| user_id | uuid |
| kind | enum (photo/video) |
| storage_bucket | text |
| storage_path | text |
| sort_order | int |

Constraint:
- Max 10 media rows per dive (trigger enforced)

---

# 8. RLS Summary

- profiles: own only
- user_stats: own only
- scuba_dives: own only
- free_dives: own only
- scuba_dive_gear / free_dive_gear: enforced via parent ownership
- scuba_dive_media / free_dive_media: own only
- geo_regions: read-only
- dive_points: read + insert

---

# 9. Design Decisions

1. KR-only MVP
2. City-level granularity
3. Global dive point pool without moderation
4. No point rename system
5. No snapshot of point names
6. Gear normalized (N:M)
7. Dive number managed in application layer
8. Media limit enforced at DB level
9. RLS ensures strict per-user isolation

---

# 10. Not Included in MVP

- Internationalization
- Public logs
- Social features
- Instructor signature verification
- Point moderation
- Alias system
- Gear inventory tracking

---

End of schema.