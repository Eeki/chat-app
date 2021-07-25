import express from 'express'
import { postgraphile } from 'postgraphile'
import dotenv from 'dotenv'

dotenv.config()

const {
  POSTGRES_USER,
  POSTGRES_PASSWORD,
  POSTGRES_DB
} = process.env

const app = express()

app.use(
  postgraphile(
    `postgres://${POSTGRES_USER}:${POSTGRES_PASSWORD}@localhost/${POSTGRES_DB}`,
    "chat",
    {
      watchPg: true,
      graphiql: true,
      enhanceGraphiql: true,
    }
  )
)

app.listen(process.env.PORT || 5000)
