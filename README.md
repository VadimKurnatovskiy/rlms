# RLMS
## Remote Learning Management System

## Getting started

Current production URL is https://rlms.online

### Prepare dependencies

Make sure you have installed application dependencies:

- Ruby 2.3.4
- Rails 5.1.2
- Yarn package manager
- Postgresql 9.6

### Bootstrap application

Clone application repository

```bash
git clone git@github.com:vladimirbazhanov/rlms.git
cd rlms
```

Run setup script to install all required gems

```bash
bin/setup
```

Run tests and code quality checking tools to make sure all dependencies are satisfied and application works correctly

```bash
bin/ci
```

Run application and navigate at https://localhost:5000 using web browser to open application

```bash
bin/server
```

## Resources

- Task manager: [PivotalTracker](https://www.pivotaltracker.com/n/projects/2098243)
- Errors catching: [Rollbar](https://rollbar.com/VladimirBazhanov/rlms)
- Team communications: [Slack](https://flatstack-school.slack.com)
