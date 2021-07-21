# Use env variables from .env file
export $(grep -v '#.*' .env | xargs)

# Run postgraphile
./node_modules/postgraphile/cli.js \
 --subscriptions \
 --watch \
 --dynamic-json \
 --no-setof-functions-contain-nulls \
 --no-ignore-rbac \
 --no-ignore-indexes \
 --show-error-stack=json \
 --extended-errors hint,detail,errcode \
 --append-plugins @graphile-contrib/pg-simplify-inflector,postgraphile-plugin-connection-filter \
 --graphiql "/" \
 --enhance-graphiql \
 --allow-explain \
 --enable-query-batching \
 --legacy-relations omit \
 --default-role chat_anonymous \
 --jwt-token-identifier chat.jwt \
 --jwt-secret "$JWT_SECRET" \
 --connection "postgres://$POSTGRES_USER:$POSTGRES_PASSWORD@localhost/$POSTGRES_DB" \
 --schema chat
