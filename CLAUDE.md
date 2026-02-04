# Claude Development Guidelines for magic-stack

## Table of Contents
- [Project Commands](#project-commands)
- [Git & Branch Management](#git--branch-management)
- [Quality Gates & Testing](#quality-gates--testing)
- [Code Quality Standards](#code-quality-standards)
- [JavaScript/React Guidelines](#javascriptreact-guidelines)
- [Ruby/Rails Guidelines](#rubyrails-guidelines)
- [GraphQL Guidelines](#graphql-guidelines)

## Project Commands

### Development Commands
- `bin/dev` - Starts the development server
- `bin/check` - Runs all tests and quality checks

### Testing Commands
- `bundle exec rspec` - Run Ruby/Rails tests
- `yarn vitest run` - Run JavaScript/React tests
- `bundle exec cucumber` - Run integration tests
- `bundle exec rubocop` - Run Ruby linting
- `yarn lint` - Run JavaScript linting (if available)

## Git & Branch Management

### NEVER COMMIT DIRECTLY TO MAIN ⛔
- **ALWAYS** create a new branch for any changes
- **ALWAYS** create a pull request for review
- **NEVER** push commits directly to the main branch

### Branch Naming Convention:
- `fix/issue-number-description` for bug fixes
- `feature/issue-number-description` for new features
- `chore/description` for maintenance tasks

### Proper Workflow:
1. **Start from latest main**:
   ```bash
   git checkout main
   git fetch origin main
   git reset --hard origin/main
   git checkout -b feature/issue-name
   ```

2. **Make changes**: Implement the required functionality

3. **Run quality checks**: Use `bin/check` before committing

4. **Commit changes**: Only after all quality gates pass
   ```bash
   git add .
   git commit -m "Brief description of changes"
   ```

5. **Push the branch**: `git push -u origin feature/issue-name`

6. **Create pull request**: `gh pr create`

### Commit Message Format
```
Brief description

- Detailed explanation of changes
- Any breaking changes noted

🤖 Generated with [Claude Code](https://claude.ai/code)

Co-Authored-By: Claude <noreply@anthropic.com>
```

## Quality Gates & Testing

### ⚠️ BEFORE EVERY COMMIT CHECKLIST

**⛔ NEVER commit code that fails these checks:**

- [ ] All tests pass (`bundle exec rspec`, `yarn vitest run`, `bundle exec cucumber`)
- [ ] Linting passes (`bundle exec rubocop`, `yarn lint`)
- [ ] New features have appropriate tests
- [ ] No hardcoded secrets or sensitive data

**Use `bin/check` to run all quality gates at once**

### Testing Requirements
- All new Ruby code must have RSpec unit tests
- All new React components should have Vitest tests
- Integration tests (Cucumber) for user-facing features
- GraphQL queries/mutations should have request specs

### Test Failure Management
- When you detect failing tests, always fix them
- Do not ignore test failures
- If assets cause failures, try `rails assets:clobber` first

## Code Quality Standards

### General Principles
- Follow existing patterns and conventions in the codebase
- Use existing utilities and helper methods
- Keep code DRY (Don't Repeat Yourself)
- Write self-documenting code with clear naming

### Ruby/Rails Guidelines
- Follow Rails conventions and best practices
- Use RuboCop for style consistency
- **ALWAYS** run `bundle exec rubocop <file>` after editing Ruby files
- Use `described_class` in RSpec tests instead of hardcoding class names
- Prefer factories over fixtures for test data

### JavaScript/React Guidelines

#### Component Structure
Each React component should follow this structure:
```
ComponentName/
├── ComponentName.jsx            # Main React component
├── ComponentName.module.css     # Component-specific styles
├── ComponentName.test.jsx       # Vitest tests
└── index.js                     # Export point
```

#### React Best Practices
- Use functional components with hooks
- Keep components small and focused
- Extract reusable logic into custom hooks
- Use CSS modules for styling (`.module.css` files)
- Write Vitest tests for components

#### Directory Structure
```
app/javascript/
├── ui/
│   ├── components/          # Reusable React components
│   └── foundation/          # Core application structure
└── packs/                   # Webpack entry points
```

## GraphQL Guidelines

### File Organization
```
app/graphql/
├── types/                   # GraphQL type definitions
├── mutations/               # GraphQL mutations
├── root_types/              # Query and Mutation root types
└── magic_stack_schema.rb    # Main schema definition
```

### Testing GraphQL
- Write request specs for GraphQL endpoints
- Test both successful and error cases
- Verify proper authorization
- Check response structure matches schema

## Security Reminders
- Never commit secrets, API keys, or credentials
- Use Rails credentials for sensitive configuration
- Validate all user inputs
- Use parameterized queries to prevent SQL injection
- Implement proper authorization checks

## Performance Considerations
- Use eager loading to avoid N+1 queries
- Add database indexes for frequently queried columns
- Profile slow tests and optimize them
- Use caching where appropriate

## Code Review Checklist
Before submitting a PR:
- [ ] All tests pass
- [ ] Code follows project conventions
- [ ] No security vulnerabilities
- [ ] Documentation updated if needed
- [ ] PR description explains what and why
- [ ] Linked to relevant GitHub issue