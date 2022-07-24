import getExpeditiousCache from 'express-expeditious'

export const cache = getExpeditiousCache({
  namespace: 'expresscache',
  defaultTtl: '1 minute',
  // eslint-disable-next-line @typescript-eslint/no-var-requires
  engine: require('expeditious-engine-redis')({
    // options for the redis driver
    host: 'redis.acme.com',
    port: 6379
  })
})
