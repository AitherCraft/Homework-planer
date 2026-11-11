# Period Planner

A single-page homework planner with a tab for each of 8 class periods. Add assignments, set due dates, check them off.

Everything is in `index.html`. No build step.

## Put it online with GitHub Pages

1. Open the repository's **Settings > Pages**.
2. Under **Build and deployment**, pick **Deploy from a branch**, choose `main` and `/ (root)`, then save.
3. After a minute the site is live at `https://<your-username>.github.io/<repository-name>/`.

## Turn on accounts (Supabase)

Without this step the planner saves in the browser on one device. With it, people create an account with an email and password, and their homework follows them to any device.

1. Create a free project at [supabase.com](https://supabase.com).
2. In the project, open **SQL Editor**, paste the contents of `supabase-setup.sql`, and run it. This creates one private row per account.
3. Open **Project Settings > API**. Copy the **Project URL** and the **anon public** key.
4. In `index.html`, find these two lines near the top of the script and paste the values between the quotes:

   ```js
   var SUPABASE_URL = "", SUPABASE_KEY = "";
   ```

5. Commit the change. The page now shows a "Sign in or create account" bar.

The anon key is meant to be public. The security comes from the row rules in `supabase-setup.sql`, which let each account read and write only its own homework. Never paste the `service_role` key into this page.

By default Supabase emails a confirmation link when someone creates an account. To skip that, turn off **Confirm email** under **Authentication > Providers > Email**.
