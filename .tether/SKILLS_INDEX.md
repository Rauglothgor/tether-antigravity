# TETHER Skills Index

> **Purpose**: Quick reference for cherry-picked skills from community repos. Say "Apply the [skill name] pattern" and your AI will implement it.

## How to Use

Say: "Apply the [skill name] pattern" and the AI will implement it according to the documented approach.

---

## Authentication & Authorization

### `auth-jwt-basic`
**Source**: antigravity-skills  
**Use When**: Building simple JWT authentication  
**Pattern**: Generate/verify JWT tokens, middleware for protected routes, refresh token flow  

### `auth-oauth2-pkce`
**Source**: antigravity-awesome-skills  
**Use When**: Implementing OAuth 2.0 with PKCE (mobile/SPA apps)  
**Pattern**: Authorization code flow, token exchange, secure storage  

### `auth-session-cookie`
**Source**: antigravity-skills  
**Use When**: Traditional server-side session auth  
**Pattern**: Secure cookie settings, session store, CSRF protection  

---

## Database Operations

### `db-migration-pattern`
**Source**: antigravity-skills  
**Use When**: Managing database schema changes  
**Pattern**: Up/down migrations, version tracking, rollback capability  

### `db-repository-pattern`
**Source**: antigravity-awesome-skills  
**Use When**: Abstracting database access  
**Pattern**: Repository interface, CRUD operations, query builders  

### `db-connection-pooling`
**Source**: antigravity-skills  
**Use When**: Optimizing database connections  
**Pattern**: Pool configuration, connection reuse, timeout handling  

---

## Error Handling

### `error-global-handler`
**Source**: antigravity-skills  
**Use When**: Centralizing error handling  
**Pattern**: Global error middleware, error classification, user-friendly messages  

### `error-retry-backoff`
**Source**: antigravity-awesome-skills  
**Use When**: Handling transient failures  
**Pattern**: Exponential backoff, max retries, jitter  

### `error-validation`
**Source**: antigravity-skills  
**Use When**: Input validation  
**Pattern**: Schema validation, sanitization, error aggregation  

---

## API Design

### `api-rest-crud`
**Source**: antigravity-skills  
**Use When**: Building standard REST endpoints  
**Pattern**: Resource routes, HTTP verbs, status codes, pagination  

### `api-rate-limiting`
**Source**: antigravity-awesome-skills  
**Use When**: Protecting APIs from abuse  
**Pattern**: Token bucket, sliding window, per-user limits  

### `api-versioning`
**Source**: antigravity-skills  
**Use When**: Evolving APIs without breaking clients  
**Pattern**: URL versioning, header versioning, deprecation notices  

---

## Frontend Patterns

### `ui-form-validation`
**Source**: antigravity-skills  
**Use When**: Building validated forms  
**Pattern**: Client-side validation, error display, submit handling  

### `ui-loading-states`
**Source**: antigravity-awesome-skills  
**Use When**: Managing async UI states  
**Pattern**: Loading, error, success states, skeleton screens  

### `ui-responsive-layout`
**Source**: antigravity-skills  
**Use When**: Building mobile-friendly layouts  
**Pattern**: Breakpoints, flexbox/grid, mobile-first approach  

---

## Testing

### `test-unit-isolation`
**Source**: antigravity-skills  
**Use When**: Writing unit tests  
**Pattern**: Mocking, fixtures, assertion patterns  

### `test-integration-api`
**Source**: antigravity-awesome-skills  
**Use When**: Testing API endpoints  
**Pattern**: Test client, database seeding, cleanup  

### `test-e2e-browser`
**Source**: antigravity-skills  
**Use When**: End-to-end browser testing  
**Pattern**: Page objects, selectors, wait strategies  

---

## DevOps & Deployment

### `deploy-docker-compose`
**Source**: antigravity-skills  
**Use When**: Containerizing applications  
**Pattern**: Multi-stage builds, compose files, health checks  

### `deploy-env-config`
**Source**: antigravity-awesome-skills  
**Use When**: Managing environment configuration  
**Pattern**: .env files, secrets management, config validation  

---

## Maintenance Notes

- Skills are patterns, not copy-paste code
- AI adapts the pattern to your specific tech stack
- Add new skills by documenting the pattern name, source, and use case
- Sources: [antigravity-skills](https://github.com/rmyndharis/antigravity-skills), [antigravity-awesome-skills](https://github.com/sickn33/antigravity-awesome-skills)
