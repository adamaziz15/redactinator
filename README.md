# REDACTINATOR

A rails RESTful API to be used to facilitate the process of redacting sensitive
information from images/documents.

## Setup
TBD

## API Actions

| Description | Route | Payload | Response (on success) |
| :-----------: | :-----: | :-------: | :--------: |
| Fetch eConsults & attachments | GET /econsults?include=[attachments] | n/a | json response containing econsults and their associated attachments |
| Update attachment status | PUT /attachments/:id | { status: 'new status' } | Updated entity returned with 200 response |
| Fetch attachment & redactions | GET /attachments/:id?include=[redactions] | n/a | json response containing attachments and their associated redactions |
| Create new redaction | POST /attachments/:id/redactions | optional | Updated entity returned with 200 status |
| Update redaction | PUT /redactions/:id | { status: 'new status' } | Updated entity returned with 200 status |
| Delete redaction | DELETE /redactions/:id | n/a | Empty response with 204 status |

## Data model
### **e_consults**
| Attribute | Type |
| :---------: | :----: |
| id | integer |
------

### **attachments**
| Attribute | Type |
| :---------: | :----: |
| id | integer |
| e_consult_id | integer |
| censorship_status | string |
------

### **redactions**
| Attribute | Type |
| :---------: | :----: |
| x_origin | float |
| y_origin | float  |
| height | float |
| width | float |