---
name: open-notebook
description: Open Notebook API for managing research notebooks, sources, notes, and AI-powered knowledge management on notebook.junsuzuki.group.
---

# Open Notebook Management

Manage Open Notebook instances via REST API. Access research notebooks, sources, notes, and AI-powered knowledge tools.

## Configuration

API credentials are stored in `~/.clawdbot/open-notebook-config.json`:
```json
{
  "apiUrl": "https://notebook.junsuzuki.group/api",
  "apiKey": "your_password_here"
}
```

## API Endpoints

### Notebooks

**List Notebooks**
```bash
curl -X GET '{apiUrl}/notebooks' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer {apiKey}'
```

**Get Notebook**
```bash
curl -X GET '{apiUrl}/notebooks/{notebookId}' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer {apiKey}'
```

**Create Notebook**
```bash
curl -X POST '{apiUrl}/notebooks' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer {apiKey}' \
  -H 'Content-Type: application/json' \
  -d '{
    "name": "Research Project",
    "description": "My research notes"
  }'
```

**Update Notebook**
```bash
curl -X PUT '{apiUrl}/notebooks/{notebookId}' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer {apiKey}' \
  -H 'Content-Type: application/json' \
  -d '{
    "name": "Updated Name",
    "description": "Updated description"
  }'
```

**Delete Notebook**
```bash
curl -X DELETE '{apiUrl}/notebooks/{notebookId}' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer {apiKey}'
```

### Sources

**List Sources**
```bash
curl -X GET '{apiUrl}/sources' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer {apiKey}'
```

**Add Source (URL)**
```bash
curl -X POST '{apiUrl}/sources' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer {apiKey}' \
  -H 'Content-Type: application/json' \
  -d '{
    "notebook_id": "notebook:xxx",
    "name": "Article Title",
    "url": "https://example.com/article",
    "type": "url"
  }'
```

**Add Source (Text)**
```bash
curl -X POST '{apiUrl}/sources' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer {apiKey}' \
  -H 'Content-Type: application/json' \
  -d '{
    "notebook_id": "notebook:xxx",
    "name": "Notes",
    "content": "My notes content",
    "type": "text"
  }'
```

### Notes

**List Notes**
```bash
curl -X GET '{apiUrl}/notes?notebook_id=notebook:xxx' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer {apiKey}'
```

**Create Note**
```bash
curl -X POST '{apiUrl}/notes' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer {apiKey}' \
  -H 'Content-Type: application/json' \
  -d '{
    "notebook_id": "notebook:xxx",
    "title": "Research Findings",
    "content": "Key insights from research"
  }'
```

### Search

**Search Content**
```bash
curl -X POST '{apiUrl}/search' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer {apiKey}' \
  -H 'Content-Type: application/json' \
  -d '{
    "notebook_id": "notebook:xxx",
    "query": "machine learning"
  }'
```

### Chat

**Execute Chat**
```bash
curl -X POST '{apiUrl}/chat/execute' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer {apiKey}' \
  -H 'Content-Type: application/json' \
  -d '{
    "notebook_id": "notebook:xxx",
    "message": "Summarize my research",
    "session_id": "chat_session_123",
    "context": "research_assistant"
  }'
```

## Notebook Object Structure

```json
{
  "id": "notebook:xxx",
  "name": "Research Project",
  "description": "My research notes",
  "archived": false,
  "created": "2026-01-29T07:28:34+00:00",
  "updated": "2026-01-29T07:28:34+00:00",
  "source_count": 1,
  "note_count": 1
}
```

## Source Types

- **URL** - Web pages, articles (automatic scraping)
- **Text** - Plain text content
- **File** - PDFs, videos, audio (upload support)
- **YouTube** - Video transcripts
- **Gmail** - Email integration
- **Calendar** - Event integration

## Usage Examples

### Create a research notebook for AI articles
```bash
# Create notebook
curl -X POST '{apiUrl}/notebooks' \
  -H 'Authorization: Bearer {apiKey}' \
  -H 'Content-Type: application/json' \
  -d '{
    "name": "AI Research 2026",
    "description": "Latest AI research and articles"
  }'
```

### Add an article as a source
```bash
# Add URL source
curl -X POST '{apiUrl}/sources' \
  -H 'Authorization: Bearer {apiKey}' \
  -H 'Content-Type: application/json' \
  -d '{
    "notebook_id": "notebook:xxx",
    "name": "AI Article",
    "url": "https://example.com/ai-article"
  }'
```

### Search research
```bash
# Search for specific topics
curl -X POST '{apiUrl}/search' \
  -H 'Authorization: Bearer {apiKey}' \
  -H 'Content-Type: application/json' \
  -d '{
    "notebook_id": "notebook:xxx",
    "query": "neural networks"
  }'
```

## Notes

- Always include `Authorization: Bearer {apiKey}` header
- Notebook IDs start with `notebook:` prefix
- API returns JSON responses
- Use `jq` for parsing JSON responses
- Test endpoints in browser: `https://notebook.junsuzuki.group/api/docs`
