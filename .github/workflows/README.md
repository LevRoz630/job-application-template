# GitHub Actions Workflow Setup

## Overview

This workflow automatically compiles LaTeX CVs and optionally deploys them to a separate public repository.

## Architecture

- **This repo** (private) - Contains LaTeX source files and application materials
- **Public CV repo** (optional) - Receives compiled PDFs only

## Setup Instructions

### 1. Create Personal Access Token

1. Go to GitHub Settings -> Developer settings -> Personal access tokens -> Tokens (classic)
2. Click "Generate new token (classic)"
3. Configure:
   - **Note**: `CV Repo Deploy Token`
   - **Expiration**: No expiration (or set based on preference)
   - **Scopes**:
     - `repo` (Full control of private repositories)
4. Click "Generate token" and copy it immediately

### 2. Add Token to Repository Secret

1. Go to your repo -> Settings -> Secrets and variables -> Actions
2. Click "New repository secret"
3. Configure:
   - **Name**: `CV_REPO_TOKEN`
   - **Value**: Paste the personal access token from step 1
4. Click "Add secret"

### 3. Workflow Triggers

The workflow runs when:
- Push to `main` branch modifies files in `curriculum_vitae/**/*.tex` or `curriculum_vitae/**/*.cls`
- Pull request to `main` (compiles but doesn't deploy)

### 4. What Happens

1. Checkout source code
2. Compile each `resume.tex` variant using XeLaTeX
3. (Optional) Checkout public CV repo
4. (Optional) Copy compiled PDFs to public repo
5. (Optional) Commit and push PDFs

## Customizing the Workflow

Create a `.github/workflows/compile-latex.yml` file. A basic workflow:

```yaml
name: Compile LaTeX CVs

on:
  push:
    branches: [main]
    paths:
      - 'curriculum_vitae/**/*.tex'
      - 'curriculum_vitae/**/*.cls'

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Install LaTeX
        run: bash install_deps.sh

      - name: Compile SWE Resume
        run: cd curriculum_vitae/swe && xelatex resume.tex

      - name: Compile Quant Resume
        run: cd curriculum_vitae/quant && xelatex resume.tex

      - name: Compile IB Resume
        run: cd curriculum_vitae/ib-sales-consulting && xelatex resume.tex

      - name: Upload PDFs
        uses: actions/upload-artifact@v4
        with:
          name: compiled-cvs
          path: curriculum_vitae/*/resume.pdf
```

## Troubleshooting

### LaTeX Compilation Errors

Check the Actions log for LaTeX errors. Common issues:
- Missing packages
- Syntax errors in .tex files
- Font issues

### Push Failures

If the workflow can't push to a public repo:
- Verify `CV_REPO_TOKEN` secret exists
- Verify token has `repo` scope
- Verify token hasn't expired
- Verify the target repository exists

### Skip CI

Commits from the workflow include standard commit messages. To skip CI in the target repo, the workflow would need to add `[skip ci]` to the commit message.
