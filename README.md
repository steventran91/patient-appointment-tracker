# Patient Appointment Tracker

A Ruby on Rails REST API for managing patient appointments with healthcare providers. Built as Project 2 in a Rails learning series, introducing model associations, complex queries, and token-based authentication.

## Ruby Version

3.2.2

## System Dependencies

- Ruby 3.2.2
- PostgreSQL

## Setup

```bash
bundle install
rails db:create db:migrate
```

## Running the Server

```bash
rails server
```

## Authentication

All endpoints require a valid provider token in the Authorization header:

```
Authorization: Bearer <token>
```

A token is automatically generated when a Provider is created. Retrieve it via the Rails console:

```ruby
Provider.last.token
```

## API Endpoints

### Patients
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | /patients | List all patients |
| POST | /patients | Create a patient |
| GET | /patients/:id | Get a patient |
| PATCH | /patients/:id | Update a patient |
| GET | /patients/:id/appointments | List appointments for a patient |

### Providers
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | /providers | List all providers |
| POST | /providers | Create a provider |
| GET | /providers/:id | Get a provider |
| PATCH | /providers/:id | Update a provider |
| DELETE | /providers/:id | Delete a provider |
| GET | /providers/:id/appointments | List appointments for a provider |

### Appointments
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | /appointments | List all appointments |
| POST | /appointments | Create an appointment |
| GET | /appointments/:id | Get an appointment |
| PATCH | /appointments/:id | Update an appointment |
| DELETE | /appointments/:id | Cancel an appointment |

### Appointment Status Values
- `scheduled`
- `cancelled`
- `completed`

## Running Tests

```bash
rails test
```
