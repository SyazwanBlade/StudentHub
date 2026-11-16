# AI Usage Log – StudentHub (TMA3084 Lab 5)

This log records how our group used AI coding assistants, what they suggested,
what we accepted or rejected, and why. All AI output was reviewed, run and
tested by a group member before it was committed.

| Field | Value |
|---|---|
| Repository | https://github.com/SyazwanBlade/StudentHub |
| AI tools used | Claude (Claude Code in VS Code), ChatGPT Codex |
| Log maintained by | Syazwan Bin Salleh (102208) |

---

## Part A – General development (Syazwan, Claude)

| # | Date | Prompt (summary) | AI suggestion | Decision | Reason |
|---|---|---|---|---|---|
| 1 | 2026-11-06 | Create a starter Flutter project so teammates can pull it, reusing the Lab 4 CI file. | Project skeleton: `main.dart` app shell, `AppState` (Provider), bottom navigation, drawer, placeholder pages, `ci.yml`, widget test. | Accepted | Gave every member a separate file to work in, so branches would not overlap. Checked with `dart format`, `flutter analyze` and `flutter test`. |
| 2 | 2026-11-06 | (same task) | Add an AI co-author line to the commit message. | Rejected | Commits must show only the group member's own authorship. The commit was amended and the repo history cleaned. |
| 3 | 2026-11-06 | Explain the test failing after pages are replaced. | Widget test was checking placeholder text ("Home Page"); changed it to check the selected index in `AppState` instead. | Accepted | Test no longer breaks when a page's content changes. |
| 4 | 2026-11-08 | Build the Home page: banner, summary cards, a carousel of student photos that scrolls right, quick actions. Add section comments so I can edit it later. | `home_page.dart` with clearly commented sections and a horizontal `ListView`. | Accepted | Meets the Home Page requirement. Reviewed each section and ran the app in Chrome. |
| 5 | 2026-11-08 | Show that the carousel scrolls. | First: one "+7 other students" card. | Rejected | Did not demonstrate scrolling. Replaced with one "Unknown" card per remaining student. |
| 6 | 2026-11-08 | Carousel cannot be scrolled with the mouse in Chrome. | Custom `MaterialScrollBehavior` allowing mouse/trackpad drag. | Accepted | Flutter web ignores mouse drags by default; fix verified in the browser. |
| 7 | 2026-11-08 | Use Irasutoya-style pictures for the Unknown students. | Downloaded 7 Irasutoya student illustrations, resized for the app. | Accepted | Irasutoya allows free use in projects like this. Images were resized to keep the repo small. |
| 8 | 2026-11-08 | Add a "welcome, please wait" screen before Home. | `splash_page.dart` with a timer (cancelled in `dispose`, `mounted` checked) and `pushReplacement` to the main shell; test updated to wait for it. | Accepted | Null-safe and leak-free; back button does not return to the splash. |
| 9 | 2026-11-08 | Picture on the welcome screen. | First a bowing person, then a graduate. | Accepted (graduate) | Graduate fits a student app better; the unused bowing image was deleted. |
| 10 | 2026-11-16 | Check which requirements are done after teammates' PRs were merged. | Found: Home page not merged, CI failing on `dart format` in 6 files, no PR reviews, merge conflict not done. | Accepted | Used as the final-testing checklist. |
| 11 | 2026-11-16 | Re-do my Home page on top of the latest `main`. | New branch `homepage_102208`; Home page rewritten to use Ahmad's `Student` model (`matricNo`, `cgpa`), with team photos kept inside `home_page.dart`. My earlier `student.dart` and `programme_page.dart` were dropped. | Accepted | Avoided overwriting Ahmad's model and Samson's Programme page (which own those files under the final task split). |
| 12 | 2026-11-16 | Fix CI. | Ran `dart format` on the 6 failing files (formatting only, no logic changes). | Accepted | CI format check now passes. |

---

## Part B – Section 5 refactor: Claude vs ChatGPT Codex (Adib)

**Task:** move the selected navigation index (`currentIndex`) from a
`StatefulWidget` into a separate Provider state-management class.

**Prompt used (same for both tools):**

> _(paste the exact prompt here)_

### B1. ChatGPT Codex

| Item | Notes |
|---|---|
| Generated code (summary / link) | |
| Null safety issues | |
| Unnecessary widget rebuilds | |
| Naming / unused imports / structure | |
| `flutter analyze` result | |
| `flutter test` result | |
| Changes accepted | |
| Changes rejected (and why) | |

### B2. Claude

| Item | Notes |
|---|---|
| Generated code (summary / link) | |
| Null safety issues | |
| Unnecessary widget rebuilds | |
| Naming / unused imports / structure | |
| `flutter analyze` result | |
| `flutter test` result | |
| Changes accepted | |
| Changes rejected (and why) | |

### B3. Corrections made before merging

- _(list each fix and the reason)_

**Pull request:** _(link)_ — reviewed by _(name)_, comment: _(summary)_

---

## Part C – AI Comparison Report (max half a page)

| Criterion | ChatGPT Codex | Claude |
|---|---|---|
| Adherence to requirements | | |
| Readability and structure | | |
| Null safety | | |
| Unnecessary rebuilds | | |
| `flutter analyze` | | |
| `flutter test` | | |
| Corrections needed before merge | | |

**Strengths and weaknesses:** _(2–3 sentences per tool)_

**Chosen implementation and why:** _(1–2 sentences)_
