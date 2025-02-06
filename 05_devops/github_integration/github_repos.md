### Repository Management
- Use **GitHub Flow**:
  - Create branches for each feature.
  - Open Pull Requests (PRs) for merging.
  - Merge only after approvals and successful checks.

### Working with Releases
- **Tagging versions:**
  ```sh
  git tag -a v1.2.1 -m "Release v1.2.1"
  git push origin v1.2.1
  ```
- **Creating releases using CLI:**
  ```sh
  gh release create v1.2.1 --title "Release v1.2.1"
  ```

### Automating Changelogs
- **Generate release notes automatically:**
  ```sh
  github_changelog_generator -u github-changelog-generator -p TimerTrend-3.0
  ```
- Customize **release notes** using `.github/release.yml`:
  ```yaml
  changelog:
    exclude:
      labels:
      - ignore-for-release
    categories:
      - title: Breaking Changes 🛠
        labels:
          - Semver-Major
          - breaking-change
  ```

### Managing API Documentation in GitHub
- **Use OpenAPI or Markdown for API docs.**
- **Host docs using GitHub Pages:**
  ```sh
  mkdocs build
  mkdocs gh-deploy
  ```
- **Automate API docs using GitHub Actions.**

### GitHub Repository Permissions
- Use **role-based access**:
  - `Read` for reviewers.
  - `Triage` for issue management.
  - `Write` for contributors.
  - `Maintain` for managers.
  - `Admin` for full control.
- Protect branches by requiring PR approvals and status checks.

### Managing Tags and Releases
- **Tagging and protecting releases:**
  ```sh
  git tag v1.0.0
  git push origin v1.0.0
  ```
- Protect specific tags to prevent deletion (beta feature in GitHub).
