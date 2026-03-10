---
description: 현재 변경 사항을 모두 스테이징하고 커밋한 후 새 브랜치로 PR을 자동 생성합니다.
---

이 워크플로우는 현재 Git 변경 사항을 파악하여 적합한 브랜치, 커밋 메시지 및 PR을 자동으로 생성하고, 다시 main 브랜치로 돌아오는 과정을 자동화합니다.

1. `git status` 및 `git diff` 등을 통해 현재 변경 사항을 분석하여 적절한 **브랜치 이름**, **커밋 메시지(Conventional Commits 구조적용)**, **PR 제목**, **PR 본문(한국어)**을 생성합니다.
2. 분석된 정보를 바탕으로 새 브랜치를 생성하고 체크아웃합니다:
```bash
git checkout -b <브랜치_이름>
```
// turbo
3. 모든 변경 사항을 스테이징합니다:
```bash
git add .
```
// turbo
4. 커밋을 작성합니다:
```bash
git commit -m "<커밋_메시지>"
```
// turbo
5. 생성한 브랜치를 원격 저장소에 푸시합니다:
```bash
git push -u origin <브랜치_이름>
```
// turbo
6. GitHub CLI(`gh`)를 활용하여 PR을 생성합니다:
```bash
gh pr create --title "<PR_제목>" --body "<PR_본문>" --base main
```
// turbo
7. 다시 main 브랜치로 체크아웃합니다:
```bash
git checkout main
```
