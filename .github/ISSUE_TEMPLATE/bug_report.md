---
name: Bug report
about: These information snippets are essential parts of project communication. A well-written bug ticket can help fix the issue and reduce the possibility of breaking an existing feature.
title: ''
labels: ''
assignees: ''

---

### Ticket Title
The title should describe the action that the ticket is to fulfill.

### Ticket Description

## Actual behavior
Describe what currently happens when the bug is present.

## Expected behavior
Describe what should happen if the bug is fixed.

## Operating system + Browser
Name the operating system, browser and version you are using,

## Rake Task needed
Yes/No

### Severity

The severity of a bug is derived based on the effect of that bug on the system. It indicates the level of threat that a bug can affect the system.

```
Blocker - The bug prevents a user from running/opening the app
Critical - The bug prevents the user from performing the intended action and using a key feature of the app. The business logic of a key feature doesn't work, there is no workaround.
Major - The bug is highly disturbing for the user but doesn’t prevent them from performing the action. The bug prevents the user from using a non-key feature of the software. The business logic of a key feature works wrong, but there is a workaround.
Minor - A bug in the UI which doesn't prevent usage of the features of the application.
```

### Type

The type of bug is the nature of a bug. It helps us to categorize and prioritize issues.

```
Functional - A dynamic bug related to an action user is performing. You can only find it while performing an action on a product. The product’s reaction is not as expected.
Graphical bug (UI) - A static bug related to UI issues.
Wording bug - A bug related to the text content.
Ergonomics (UX) - An issue related to various user scenarios and proper placement of the UI elements.
Performance - An issue related to the performance of the software.
Layout bug - Everything related to display.
Plugins - Issues related to plugins framework
Development - Issues related to the code (although not functional issues), infrastructure or deployment
```

### Frequency

This category specifies whether the issue has been reported once or this is a frequent topic.

### Reproducibility

This category defines whether the issue could be reproduced in a particular scenario.

```
Always - The steps to reproduce are probably easy to identify and to write. A scenario is always expected.
Randomly - The issue occurs only sometimes meaning that the conditions to reproduce the bugs are not yet identified, or that the conditions can only be reproduced randomly.
Once - The bug happened once and even reporter cannot reproduce it again
```

### Steps to reproduce the bug

- A clear set of instructions that includes a numbered list that details each button press, or menu selection.
- Screencast recording

### Linked Ticket
It links other issues that are either dependent on this issue or vise Versa.

### State the due date
Expected date of completion of the task

### Add relevant attachments
Mockups and images should be linked (if applicable).

### Priority
The creator can set the priority to resolve the issue.
```
Critical - The issue must be fixed asap.This priority is used for the issues affecting development/deployment/infrastructure issues.
High - The issue should be fixed/implemented in the next release. These issues stop the release.
Medium - Nice to have this issue fixed/implemented in the next release. The issue won’t stop the release.
Low - The issue can be fixed/implemented, once previous are resolved. This is a Parking Lot category.
```
