#!/bin/bash

read -p "Enter file name: " filename
blog_filepath="src/content/blog/$filename"
links_filepath="src/content/links/$filename"

content=$(cat <<EOF
---
title: ""
description: ""
date: ""
---

import Link from "../../components/Link.vue"
import Code from "../../components/Code.vue"
import { createHeading } from "../../components/Heading"

export const components = {
  a: Link,
  code: Code,
  h1: createHeading("h1"),
  h2: createHeading("h2"),
  h3: createHeading("h3"),
}
EOF
)

links_content=$(cat <<EOF
---
title: ""
description: ""
---

import Link from "../../components/Link.vue"
import Code from "../../components/Code.vue"
import { createHeading } from "../../components/Heading"

export const components = {
  a: Link,
  code: Code,
  h1: createHeading("h1"),
  h2: createHeading("h2"),
  h3: createHeading("h3"),
}
EOF
)

echo "$content" > "$blog_filepath"
echo "$links_content" > "$links_filepath"

echo "Files created successfully at $blog_filepath and $links_filepath"