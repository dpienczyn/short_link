Link do dokumentacji - https://staging-short-link.herokuapp.com/api-docs/index.html
Aby przejść autentykacje użytkownika w aplikacji trzeba wygenerować auth_token:
adres url - POST https://staging-short-link.herokuapp.com/api/v1/auth

request body:
```json
{
  "auth": {
    "email": "admin@example.com",
    "password": "Passw0rd"
  }
}
```
Uzyskany auth_token można użyć w dokumentacji.
