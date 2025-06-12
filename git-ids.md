Gotcha — here’s a clear, no-fluff workflow summary for using your current setup **across every new terminal session**, supporting all three users (`personal`, `company`, `academic`):

---

# Daily Git Token + Clone Workflow (for 3 identities)

---

## 1. Open a new terminal

**Every time you open a terminal, do this:**

---

## 2. Load your token(s)

Run your token setup script *once per session* **for each identity you’ll use** (or at least the one you plan to clone/push with):

```bash
bash setup-git-token.sh
# > Choose identity: personal
# > Paste token (hidden)
# Token saved in GITHUB_PAT_PERSONAL
```

Repeat for:

* `personal`
* `company`
* `academic`

*Or just run it for the identity you’ll need now.*

---

## 3. Clone repos with identity and token

Use your clone script, passing the identity and repo:

```bash
bash git-clone.token.sh company UkubonaLLC/signal-noise-toolkit
# Clones repo using company token and sets git config user.name/email accordingly
```

---

## 4. Work inside the cloned repo

```bash
cd signal-noise-toolkit
# Check git identity
git config user.name
git config user.email
# Add, commit, push as usual
git add .
git commit -m "Your commit message"
git push origin main
```

---

## 5. Repeat or switch identity as needed

* For another identity, run `setup-git-token.sh` again to load the other token.
* Clone with the other identity using `git-clone.token.sh` as above.

---

# ⚠️ Important Notes

* Tokens are **session-only environment variables**; closing your terminal clears them.
* If you want persistent tokens, export them permanently in your `~/.bashrc` or use a `.env` loader.
* `user.name` is just a label — **make sure `user.email` matches your GitHub account** for commit attribution.
* You can clone multiple repos with different identities in different folders.

---

**That’s the workflow you need until you want to upgrade or automate more.** Want me to help you build a “one command to rule them all” CLI wrapper next?
