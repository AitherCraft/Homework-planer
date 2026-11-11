-- Run this once in your Supabase project: SQL Editor > New query > paste > Run.

create table if not exists public.planners (
  user_id uuid primary key references auth.users (id) on delete cascade,
  data    jsonb  not null,
  updated bigint not null default 0
);

alter table public.planners enable row level security;

-- Each signed-in person can read and write only their own row.
create policy "read own planner"   on public.planners for select using (auth.uid() = user_id);
create policy "insert own planner" on public.planners for insert with check (auth.uid() = user_id);
create policy "update own planner" on public.planners for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
