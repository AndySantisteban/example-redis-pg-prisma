import express, { Response } from 'express'
import validateEnv from './utils/validateEnv'
import { cache } from './utils/cache'
// eslint-disable-next-line @typescript-eslint/no-var-requires
require('dotenv').config()
validateEnv()

const app = express()

app.use(express.json())

// eslint-disable-next-line @typescript-eslint/explicit-module-boundary-types, space-before-function-paren
function Bootstrap() {
  // eslint-disable-next-line space-before-function-paren
  app.get('/', cache, (_, res: Response) => {
    setTimeout(() => {
      res.status(200).send('Clinic API')
    }, 4000)
  })

  app.listen(4000, () => {
    console.log(`Server on port: ${4000}`)
  })
}

export default Bootstrap
