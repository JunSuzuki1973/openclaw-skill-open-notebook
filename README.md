# Open Notebook Skill for OpenClaw

Open Notebook API skill for OpenClaw - Manage research notebooks, sources, notes, and AI-powered knowledge management on notebook.junsuzuki.group.

## About

This skill enables OpenClaw agents to interact with Open Notebook instances via REST API. You can create and manage research notebooks, add sources (URLs, text, files), create notes, search content, and use AI-powered chat for knowledge management.

## Features

- 📓 **Notebook Management** - Create, read, update, and delete research notebooks
- 📎 **Source Management** - Add web URLs, text content, and files as sources
- 📝 **Note Taking** - Create and manage notes within notebooks
- 🔍 **Search** - Full-text search across your knowledge base
- 💬 **AI Chat** - Chat with your knowledge base using AI

## Installation

1. Copy this skill directory to your OpenClaw workspace:
   ```bash
   cp -r open-notebook ~/.openclaw/workspace/skills/
   ```

2. Create the API configuration file:
   ```bash
   mkdir -p ~/.clawdbot
   cat > ~/.clawdbot/open-notebook-config.json << 'EOF'
   {
     "apiUrl": "https://notebook.junsuzuki.group/api",
     "apiKey": "your_api_key_here"
   }
   EOF
   ```

3. Replace `your_api_key_here` with your actual Open Notebook API key.

## Usage

The skill provides Bash helper scripts for common operations:

### List Notebooks
```bash
~/.openclaw/workspace/skills/open-notebook/scripts/list_notebooks.sh
```

### Create a Notebook
```bash
~/.openclaw/workspace/skills/open-notebook/scripts/create_notebook.sh "My Research" "Description here"
```

## API Endpoints

### Notebooks

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/notebooks` | List all notebooks |
| GET | `/notebooks/{id}` | Get a specific notebook |
| POST | `/notebooks` | Create a new notebook |
| PUT | `/notebooks/{id}` | Update a notebook |
| DELETE | `/notebooks/{id}` | Delete a notebook |

### Sources

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/sources` | List all sources |
| POST | `/sources` | Add a new source (URL, text, or file) |

**Note:** When adding a source, include the `type` field (`url`, `text`, or `file`).

### Notes

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/notes?notebook_id={id}` | List notes for a notebook |
| POST | `/notes` | Create a new note |

### Search

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/search` | Full-text search across notebooks |

### Chat

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/chat/execute` | Execute AI chat with knowledge base |

**Note:** Chat requires `session_id` and `context` fields in the request body.

## Example API Usage

### Create a Research Notebook
```bash
curl -X POST '{apiUrl}/notebooks' \
  -H 'Authorization: Bearer {apiKey}' \
  -H 'Content-Type: application/json' \
  -d '{
    "name": "AI Research 2026",
    "description": "Latest AI research findings"
  }'
```

### Add a URL Source
```bash
curl -X POST '{apiUrl}/sources' \
  -H 'Authorization: Bearer {apiKey}' \
  -H 'Content-Type: application/json' \
  -d '{
    "notebook_id": "notebook:xxx",
    "name": "OpenClaw GitHub",
    "url": "https://github.com/openclaw/openclaw",
    "type": "url"
  }'
```

### Create a Note
```bash
curl -X POST '{apiUrl}/notes' \
  -H 'Authorization: Bearer {apiKey}' \
  -H 'Content-Type: application/json' \
  -d '{
    "notebook_id": "notebook:xxx",
    "title": "Key Insights",
    "content": "Main findings from research..."
  }'
```

### Search Content
```bash
curl -X POST '{apiUrl}/search' \
  -H 'Authorization: Bearer {apiKey}' \
  -H 'Content-Type: application/json' \
  -d '{
    "notebook_id": "notebook:xxx",
    "query": "machine learning"
  }'
```

## Configuration

API credentials are stored in `~/.clawdbot/open-notebook-config.json`:

```json
{
  "apiUrl": "https://notebook.junsuzuki.group/api",
  "apiKey": "your_password_here"
}
```

## Source Types

- **URL** - Web pages and articles (automatic scraping)
- **Text** - Plain text content
- **File** - PDFs, videos, audio files

## Requirements

- OpenClaw workspace
- Open Notebook API access
- Valid API key

## License

MIT

## Author

Created for OpenClaw by Jun Suzuki

---

For more information about Open Notebook, visit: https://notebook.junsuzuki.group
