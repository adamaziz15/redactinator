# REDACTINATOR

A rails RESTful API to be used to facilitate the process of redacting sensitive
information from images/documents.

## Setup

In your terminal cd to the project directory and run:
```bash
bin/setup
```
To start the project:
```bash
rails server
```
By default it will run on port 3000

## Running test suite
```bash
bundle exec rspec
```

## Key API Actions

> GET /e_consults?include=attachments

**Successful response will return:**

- 200 status
- All e_consults and their associated attachments

> PUT /attachments/:id

**Sample Payload:**

```json
{
  "data": {
    "type": "attachments",
    "id": 1,
    "attributes": {
      "censorship_status": "IN_PROGRESS"
    }
  }
}
```

**Successful response will return:**

- 200 status
- The updated attachment

> GET /attachments/:id?include=redactions

**Successful response will return:**

- 200 status
- All attachments and their associated redactions

> POST /redactions

**Sample Payload:**
```json
{
  "data": {
    "type": "redactions",
    "attributes": {
      "attachment_id": 1,
    }
  }
}
```

**Successful response will return:**

- 200 status
- The updated entity

> PUT /redactions/:id

**Sample Payload:**

*Note: redaction attrs should be in pixels (e.g. x_origin =~ html left attr, y_origin =~ html top attr, etc.*
```json
{
  "data": {
    "type": "redactions",
    "id": 1,
    "attributes": {
      "x_origin": 25,
      "y_origin": 34,
      "height": 15,
      "width": 6
    }
  }
}
```

**Successful response will return:**

- 200 status
- The updated redaction

> DELETE /redactions/:id

**Successful response will return:**

- 204 status

## Data model (resource attributes)
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
| attachment_url | string |
------

### **redactions**
| Attribute | Type |
| :---------: | :----: |
| id | integer |
| attachment_id | integer |
| x_origin | float |
| y_origin | float  |
| height | float |
| width | float |

## Future Improvements

- [ ] Additional specs
- [ ] Rubofixes
- [ ] Improve validations and error handling/guarding
- [ ] Review default attributes
- [ ] Add randomly generated image urls to seed file