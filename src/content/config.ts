import { defineCollection } from "astro:content"
import { z } from "zod"

const blog = defineCollection({
  type: "content",
  schema: z.object({
    isDraft: z.boolean().optional().default(false),
    title: z.string(),
    description: z.string(),
    date: z.string().transform(str => new Date(str)),
  }),
})

const links = defineCollection({
  type: "content",
  schema: z.object({
    title: z.string(),
    description: z.string(),
  }),
})

export const collections = { blog, links }
