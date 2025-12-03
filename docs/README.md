# Blog Post: ls_since.sh - Advanced File Date Filtering

This directory contains the Quarto blog post for the `ls_since.sh` utility.

## Overview

A comprehensive blog post explaining the `ls_since.sh` utility—a powerful command-line tool for discovering files within temporal windows. Covers:

- Core features and architecture
- Practical use cases and examples
- Technical implementation details
- Integration patterns with other tools
- Performance and scalability

**Status**: Published
**Date**: December 2, 2025
**Format**: Quarto Blog (HTML)

## Files

```
ls_since_utility/
├── index.qmd                 # Main blog post (Quarto format)
├── README.md                 # This file
├── media/                    # Images and media
│   └── create_hero.sh       # Script to generate hero image
└── figures/                  # Placeholder for generated figures
```

## Quick Start

### Render the Blog Post

```bash
# Navigate to blog root
cd ~/Dropbox/prj/qblog

# Render this post
quarto render posts/ls_since_utility/index.qmd

# Or render entire blog
quarto render
```

### View the Post

After rendering, open the generated HTML:

```bash
open ~/Dropbox/prj/qblog/_output/posts/ls_since_utility/index.html
```

## Source Material

This blog post was generated from the comprehensive white paper:

**White Paper**: `/Users/zenn/Dropbox/bin/date_filtering.md`

The blog post adapts the technical content for a blog audience while maintaining accuracy and completeness.

## Blog Post Structure

The post is organized as follows:

1. **Introduction** - Problem statement and overview
2. **The Problem Space** - Why date-based filtering matters
3. **Core Features and Architecture** - Technical deep dive
4. **Command Reference** - Complete option and argument documentation
5. **Practical Examples** - Real-world use cases with code
6. **Interactive Mode Deep Dive** - Guided workflow explanation
7. **Technical Deep Dive** - Implementation details
8. **Performance and Scalability** - Benchmarks and optimization
9. **Comparison with Standard Tools** - Alternative solutions
10. **Real-World Integration Patterns** - Advanced workflows
11. **Getting Started** - Installation and first use
12. **Troubleshooting** - Common issues and solutions
13. **Key Takeaways** - Summary and learning outcomes
14. **Further Reading** - Resources and related materials

## Customization

### Add Hero Image

Generate the hero image:

```bash
cd media
./create_hero.sh
```

This requires ImageMagick:
```bash
brew install imagemagick  # macOS
sudo apt-get install imagemagick  # Linux
```

### Update Metadata

Edit the YAML front matter in `index.qmd`:

```yaml
title: "..."
subtitle: "..."
author: "..."
date: "..."
categories: [...]
tags: [...]
image: "media/..."
description: "..."
```

### Modify Post Content

The post is written in Quarto markdown. Edit `index.qmd` to:
- Update examples
- Add new sections
- Modify code samples
- Adjust formatting

## Publishing Workflow

1. **Create the post** (done)
2. **Generate hero image** (optional but recommended)
3. **Review content** for accuracy and completeness
4. **Render the blog** with `quarto render`
5. **Test links** and verify formatting
6. **Commit to git** when satisfied
7. **Deploy** via your blog's deployment process

## Integration with Main Blog

This post integrates with the larger Quarto blog system at `~/Dropbox/prj/qblog/`:

- Inherits blog styling and templates
- Shares metadata and index system
- Uses common categories and tags
- Follows blog development workflow

## Metadata and Categorization

**Categories**: Bash, Command-Line, Utilities, File Management, Research Tools

**Tags**:
- bash-scripting
- file-discovery
- date-filtering
- unix-tools
- research-computing
- fzf-integration

## Related Resources

- **Original Script**: `/Users/zenn/Dropbox/bin/ls_since.sh`
- **White Paper**: `/Users/zenn/Dropbox/bin/date_filtering.md`
- **Quarto Documentation**: https://quarto.org/docs/
- **Blog System**: ~/Dropbox/prj/qblog/

## Next Steps

To complete the blog post publication:

1. **Generate hero image** (if not already done)
2. **Test rendering** with `quarto render`
3. **Review formatted output** in browser
4. **Commit changes** to git
5. **Deploy blog** via your deployment process

## Questions or Issues?

For questions about:

- **The utility itself**: See `/Users/zenn/Dropbox/bin/ls_since.sh` or run `ls_since.sh -h`
- **The white paper**: Read `/Users/zenn/Dropbox/bin/date_filtering.md`
- **Quarto formatting**: Visit https://quarto.org/docs/

---

**Created**: December 2, 2025
**Format**: Quarto Blog (Markdown + YAML metadata)
**Status**: Ready for rendering and publication
