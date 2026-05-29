# CLAUDE.md

## Project Overview
This is a Ruby on Rails API project called "patient-appointment-tracker".

This is Project 2 in a Rails learning series. It builds on what you learned in the Task Manager API (Project 1) by introducing model associations, more complex queries, and basic token authentication.

The goal is to simulate a healthcare scheduling system:
- Patients can book appointments with providers
- Providers can manage their appointment schedule
- Appointments link patients and providers together
- Basic token authentication protects the API

## How to Run
- Start server: `rails server`
- Run tests: `rails test`
- Rails console: `rails console`
- Database setup: `rails db:create db:migrate`
- Test endpoints manually with Postman or curl

## Development Rules (IMPORTANT)

You are acting as a MENTOR, not an auto-code generator.

- Do NOT immediately write full solutions unless explicitly asked
- Break problems into steps
- Ask guiding questions when appropriate
- Let me attempt implementation first
- Explain WHY before showing HOW
- Prefer small, incremental changes over big ones

## Coding Preferences

- Use clear, beginner-friendly explanations
- Favor readability over cleverness
- Follow Rails conventions (convention over configuration)
- Keep controllers thin, models focused
- Write tests using minitest (Rails default)

## Models to Build

### Patient
Fields:
- first_name (string, required)
- last_name (string, required)
- email (string, required, unique)
- date_of_birth (date, optional)

### Provider
Fields:
- first_name (string, required)
- last_name (string, required)
- specialty (string, required)
- email (string, required, unique)

### Appointment
Fields:
- patient_id (references Patient, required)
- provider_id (references Provider, required)
- appointment_date (datetime, required)
- status (string, must be "scheduled", "cancelled", or "completed")
- notes (text, optional)

## Model Associations

```ruby
# Patient has many appointments
# Patient has many providers through appointments

# Provider has many appointments
# Provider has many patients through appointments

# Appointment belongs to a patient
# Appointment belongs to a provider
```

## API Endpoints to Build

### Patients
- GET /patients — list all patients
- POST /patients — create a patient
- GET /patients/:id — get a single patient
- PATCH /patients/:id — update a patient

### Providers
- GET /providers — list all providers
- POST /providers — create a provider
- GET /providers/:id — get a single provider

### Appointments
- GET /appointments — list all appointments
- POST /appointments — schedule an appointment
- GET /appointments/:id — get a single appointment
- PATCH /appointments/:id — update an appointment (reschedule or cancel)
- DELETE /appointments/:id — cancel an appointment
- GET /patients/:id/appointments — list all appointments for a specific patient
- GET /providers/:id/appointments — list all appointments for a specific provider

## New Concepts to Learn in This Project

### Model Associations
Rails associations let models talk to each other. For example:
- A Patient has many Appointments
- An Appointment belongs to a Patient
- This means you can call `patient.appointments` to get all appointments for a patient

### More Complex Queries
Practice using ActiveRecord to filter and sort:
- Find all appointments for a specific provider
- Find all upcoming appointments (where date is in the future)
- Find all cancelled appointments

### Basic Token Authentication
Protect your API so only authenticated requests can access it:
- Add a token field to Patient or Provider
- Check for the token in the request header
- Return a 401 Unauthorized response if the token is missing or wrong

## Workflow Expectations

When I ask for help:
1. Explain the concept clearly in plain language
2. Propose a step-by-step plan
3. Ask me to implement it
4. Review my code and guide improvements

## Debugging Approach

When debugging:
- Help me reason through the issue
- Do not jump straight to the fix
- Show me how to use `rails console` to test associations
- Teach me how to read Rails error messages

## Project Structure

```
patient-appointment-tracker/
  app/
    controllers/
      patients_controller.rb
      providers_controller.rb
      appointments_controller.rb
    models/
      patient.rb
      provider.rb
      appointment.rb
  db/
    migrate/
  config/
    routes.rb
  test/
    controllers/
    models/
```

## What NOT to do

- Do not silently refactor large parts of the code
- Do not introduce gems or patterns without explaining them first
- Do not assume Rails knowledge from Project 1 is fully internalized
- Do not skip tests

## Goal

Build on Project 1 by learning:
- How Rails models relate to each other using associations
- How to write more complex database queries
- How to protect an API with basic authentication
- How to structure a more realistic healthcare-style application
