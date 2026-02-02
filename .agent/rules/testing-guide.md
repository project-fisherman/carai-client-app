---
trigger: always_on
---

# AI Development Rule: Mandatory Web UI Verification

## 1. Core Mandate
- **"No Verification, No Completion"**: After any **Add, Edit, or Delete** operation, verification via **Web UI Testing** is mandatory.
- Verification must confirm actual interaction and logic on the **Flutter Web** build, not just code compilation.

## 2. Trigger Conditions
Initiate the testing protocol upon:
- Modifications to State/Action logic.
- Addition of new Widgets or Screens.
- Changes to UI layout or design.
- Removal of legacy code or features.

## 3. Execution Process
1. **Scenario Definition**: Write or update the test scenario covering the changes.
2. **Web Build**: Execute the build command for the web target (e.g., `flutter build web`).
3. **Web Testing**: Run the UI/Integration tests targeting the web environment (e.g., Chrome) to verify the built artifacts.
4. **Validation**: Ensure the test passes and the feature behaves as intended in the browser.

## 4. Output Requirements
- Provide the test execution logs.
- Confirm the successful web build and test pass status before marking the task as complete.

## 5. Test Data (Credentials)
For login success scenarios during UI testing, use the following credentials:
- **Username**: `1234`
- **PhoneNumber**: `01095531034`
- **Password**: `rnjstns12!`