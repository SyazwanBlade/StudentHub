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

## Part B – Section 5 refactor: ChatGPT vs Claude (Syazwan)

**Task:** move the selected navigation index (`currentIndex`) from a
`StatefulWidget` into a separate Provider state-management class.

**Finding before starting:** our starter already kept `currentIndex` in
`AppState` (a `ChangeNotifier`) and no widget held it in local state, so both
tools could only improve the existing Provider design, not move state out of a
`StatefulWidget`.

**Prompt used (same text for both tools, with `main.dart`, `app_state.dart`,
`bottom_nav.dart` and `app_drawer.dart` pasted below it):**

> I have a Flutter app (Material 3) that uses the provider package. I need you
> to refactor its navigation state management.
> 1. The selected navigation index (currentIndex) must NOT be stored in any
>    StatefulWidget. It must live in a separate Provider state-management class
>    (ChangeNotifier) that is separated from the UI.
> 2. The BottomNavigationBar/NavigationBar and the Drawer must both read and
>    update the index through that Provider class, and stay in sync.
> 3. Follow Flutter best practices: sound null safety, no unnecessary widget
>    rebuilds (use context.select / context.read / Consumer where appropriate),
>    clear naming, no unused imports, clean code structure.
> 4. The code must pass `flutter analyze` with no issues and keep the existing
>    tests working.
>
> Please return the complete refactored code for every file you change, and
> briefly explain what you changed and why.

**Tools:** ChatGPT (free web version; Codex was not available on our account)
and Claude (Claude Code in VS Code). Note: Claude was run inside our project
with access to the code and had already seen ChatGPT's answer, so the
comparison is not blind.

### B1. ChatGPT – branch `chatgptrefractor`

| Item | Notes |
|---|---|
| Generated code | Rewrote all 4 files. `AppState` adds `static const destinationCount = 5` and a range check. Drawer highlights the selected item and adds a missing **Programmes** entry. `MainShell`/`BottomNav` use `context.select` for the index and `context.read` for updates. |
| Null safety issues | None. No `!` or nullable values. |
| Unnecessary widget rebuilds | None found: `select` for reading, `read` in callbacks. |
| Naming / unused imports / structure | Clear names, no unused imports. Hard-coded `destinationCount = 5` must be changed by hand whenever a tab is added, or navigation throws. Removed the existing doc comment explaining why state lives in the provider. |
| `dart format` | **Failed** on 3 files (would make CI red). |
| `flutter analyze` | No issues found. |
| `flutter test` | 10/10 passed. |
| Accepted | `context.select`/`context.read` usage, drawer highlighting, Programmes drawer item. |
| Rejected (and why) | Hard-coded `destinationCount` (fragile); removal of documentation; unformatted code. Settings snackbar still used the drawer's `context` after `Navigator.pop` (not caught). ChatGPT stated it had not run Flutter or the tests. |

### B2. Claude – branch `ClaudeRefractor`

| Item | Notes |
|---|---|
| Generated code | Added `enum AppSection { home, students, records, programmes, about }` in the state file (no UI types). `AppState` stores an `AppSection`, keeps `currentIndex`/`setIndex` for existing code, adds `select(AppSection)`. `setIndex` validates with `RangeError.checkValidIndex` against `AppSection.values`. `MainShell` uses an exhaustive `switch` for titles. Drawer uses named sections instead of numbers, highlights the selected item, adds Programmes, and gets the `ScaffoldMessenger` before closing the drawer. Added 2 tests. |
| Null safety issues | None. |
| Unnecessary widget rebuilds | None found: `select` for reading, `read` in callbacks. |
| Naming / unused imports / structure | Named sections replace magic numbers (`_go(context, 2)` → `AppSection.records`). Adding a section updates the valid range automatically; the compiler flags a missing title. No unused imports. |
| `dart format` | Passed. |
| `flutter analyze` | No issues found. |
| `flutter test` | 12/12 passed (2 new: out-of-range index, drawer ↔ bottom nav sync). |
| Accepted | Whole implementation. |
| Rejected (and why) | _(fill in after team review)_ |

### B3. Corrections made before merging

- _(list any fixes made after the team review, with reasons)_

**Pull request:** _(link)_ — reviewed by _(name)_, comment: _(summary)_

---

## Part C – AI Comparison Report (max half a page)

| Criterion | ChatGPT | Claude |
|---|---|---|
| Adherence to requirements | Met | Met |
| Readability and structure | Good; magic numbers and hard-coded count remain | Better; named sections, no magic numbers |
| Null safety | No issues | No issues |
| Unnecessary rebuilds | None | None |
| `dart format` | Failed (3 files) | Passed |
| `flutter analyze` | Passed | Passed |
| `flutter test` | 10/10 | 12/12 (2 tests added) |
| Corrections needed before merge | Format, remove hard-coded count, restore docs | None found |

**Strengths and weaknesses.** ChatGPT gave a clear, well-explained answer
that met every requirement and correctly used `context.select` and
`context.read`, and it improved the drawer. However, its code was not
formatted, it introduced a hard-coded tab count that can crash navigation
later, it removed useful documentation, and it had not been run. Claude
produced a safer design (an enum instead of index numbers), kept the
documentation, fixed the drawer `context` issue, and added tests; all checks
passed. Its weakness in our comparison is that it had project access and saw
ChatGPT's answer first, so it had an advantage, and it changed more code,
which takes longer to review.

**Chosen implementation and why.** We chose Claude's version (`ClaudeRefractor`)
because it passed format, analyze and all tests without corrections, removes
magic numbers, and adds tests for the new behaviour.
