---
description: Auto commit all changes, push to a new branch, and checkout main
---

Follow these steps to automatically commit the current workspace changes, push them to a systematically generated branch, and return to the main branch.

1. Review the current changes to understand the context. This will help you determine the appropriate branch name and commit message.
// turbo
```bash
git status
git diff --cached
git diff
```

2. Analyze the changes and generate:
   - A short, descriptive branch name (e.g., `feature/add-login`, `fix/header-padding`, `refactor/api-layer`).
   - A concise and meaningful commit message following conventional commits.

3. Create and switch to the new branch, stage all changes, and commit them.
```bash
git checkout -b <generated_branch_name>
git add .
git commit -m "<generated_commit_message>"
```

4. Push the newly created branch to the remote repository.
```bash
git push -u origin <generated_branch_name>
```

5. Check out the `main` branch again to restore the workspace.
```bash
git checkout main
```
