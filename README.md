# Backllo

## Dev
```
mix deps.get
mix phoenix.server

cd web/static
npm start
npm run b
```

## Release
```
 MIX_ENV=prod mix phoenix.digest
 MIX_ENV=prod mix release
 ./rel/backllo/bin/backllo start
 ```