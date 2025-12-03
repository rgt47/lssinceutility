# ls_since.sh: Advanced File Date Filtering Utility

This directory is a **reproducible research compendium** and Quarto blog post about `ls_since.sh`, an advanced file date filtering utility for research computing.

## Quick Start

```bash
# Build Docker environment
make docker-build

# Option 1: Render blog post in container
make docker-post-render
open analysis/paper/index.html

# Option 2: Interactive preview
make docker-post-preview
# Visit http://localhost:8080
```

## Project Structure

```
ls_since_utility/
├── analysis/
│   ├── paper/
│   │   └── index.qmd              # Blog post (main content)
│   ├── figures/                   # Generated plots (placeholder)
│   ├── media/
│   │   └── images/                # Hero images and static assets
│   ├── scripts/                   # Analysis scripts
│   │   └── create_hero.sh         # Hero image generation script
│   └── data/
│       ├── raw_data/              # Original data (read-only)
│       └── derived_data/          # Processed data
│
├── Symlinks (convenience):
│   ├── index.qmd → analysis/paper/index.qmd
│   ├── figures → analysis/figures
│   ├── media → analysis/media
│   └── data → analysis/data
│
├── Configuration:
│   ├── Dockerfile                 # Computational environment
│   ├── renv.lock                  # Exact R package versions
│   ├── .Rprofile                  # R session configuration
│   ├── DESCRIPTION                # R package metadata
│   ├── NAMESPACE                  # R namespace
│   ├── Makefile                   # Build automation
│   └── .gitignore                 # Git exclusions
│
└── docs/                          # Documentation
    └── README.md                  # Original project README
```

## Blog Post Content

The blog post (`analysis/paper/index.qmd`) covers:

- **The Problem Space**: Limitations of standard file discovery tools
- **Core Features**: Three-stage filtering pipeline for date-based file selection
- **Command Reference**: Complete syntax and options documentation
- **Practical Examples**: 7+ real-world scenarios with bash code
- **Technical Deep Dive**: Platform compatibility, fzf integration, performance
- **Integration Patterns**: Advanced workflow examples
- **Getting Started**: Installation and first-use guide
- **Troubleshooting**: Common issues and solutions

## Available Make Targets

| Target | Purpose |
|--------|---------|
| `make help` | Show available targets |
| `make docker-build` | Build Docker image with Quarto |
| `make docker-sh` | Interactive shell in container |
| `make docker-rstudio` | RStudio Server (localhost:8787) |
| `make docker-post-render` | Full build + render to HTML |
| `make docker-post-preview` | Interactive preview (localhost:8080) |
| `make post-render` | Render locally (requires Quarto) |
| `make check-renv` | Validate renv configuration |
| `make clean` | Remove generated files |

## Requirements

### For Docker-based workflow (recommended):
- Docker installed and running
- Make

### For local workflow:
- Quarto installed
- R 4.0+
- renv package

## Rendering

### Option 1: Docker (reproducible, no local dependencies)
```bash
make docker-post-render
```

### Option 2: Local Quarto (requires Quarto installed)
```bash
make post-render
```

### Option 3: Interactive Preview
```bash
make docker-post-preview
# Open http://localhost:8080
```

## Reproducibility

This blog post is a complete reproducible compendium:

- **Dockerfile** specifies exact computational environment (Rocker R + Quarto)
- **renv.lock** freezes exact R package versions
- **.Rprofile** configures R session options for consistency
- **Git** tracks all source code and configuration
- **Analysis scripts** (`analysis/scripts/`) document the derivation of any plots or derived data
- **Media assets** (`analysis/media/`) are organized and sourced

To reproduce the blog post:
```bash
git clone <repo>
cd posts/ls_since_utility
make docker-post-render
```

## Media Assets

Static images stored in `analysis/media/images/`:
- `ls_since_hero.png` - Primary hero image for blog listing
- Workspace concept images and supporting photography

For image attribution and licensing information, see `analysis/media/images/README.md`

## Git LFS

Large media files use Git LFS (optional):
```bash
git lfs install
git lfs track "*.mp4" "*.mp3"
```

## Related Documentation

- Original README: `docs/README.md`
- Project CLAUDE.md: See `/Users/zenn/prj/d07/zzcollab/CLAUDE.md` for ZZCOLLAB framework details
- Workflow guide: `/Users/zenn/prj/d07/zzcollab/vignettes/workflow-blog-development.Rmd`

## File Organization Philosophy

Following the **unified research compendium** framework:
- **analysis/paper/**: Blog post content
- **analysis/scripts/**: Reproducible data processing
- **analysis/figures/**: Generated plots (R scripts → images)
- **analysis/media/**: Static assets (images, video, audio)
- **analysis/data/**: Raw and derived data with documentation

## Troubleshooting

### Docker build fails
```bash
# Clear Docker cache
docker system prune -a
make docker-build
```

### Quarto not found in Docker
```bash
# Rebuild image (may take longer to pull Quarto)
make clean
make docker-post-render
```

### Port already in use (preview)
```bash
# Change port in Makefile or use different host port:
docker run --rm -p 9090:8080 ...
```

## Notes for Future Development

- The `figures/` directory is empty - add generated plots here if extending the post
- The `data/` directories support adding raw or derived data as examples
- The `scripts/` directory can contain analysis code that generates figures or data
- Consider updating image sources in `analysis/media/images/README.md` as needed

## License

This project is licensed under the GNU General Public License v3.0 (GPL-3). See LICENSE file for details.

---

**Original Project README**: See `docs/README.md` for the detailed project documentation.

**Last Updated**: December 2, 2025
