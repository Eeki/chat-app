# Use env variables from .env file
export $(grep -v '#.*' .env | xargs)

# Set password to postgraphile user "chat_postgraphile" if not set
psql -Atx "postgres://$POSTGRES_USER:$POSTGRES_PASSWORD@localhost/$POSTGRES_DB" --command=<<EOF
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT passwd
    FROM pg_shadow
    WHERE usename = 'chat_postgraphile'
    ) THEN
      ALTER USER chat_postgraphile
      WITH LOGIN PASSWORD 'secret_password123';
  END IF;
END $$;
EOF

# Run postgraphile
./node_modules/postgraphile/cli.js \
 --connection "postgres://chat_postgraphile:$POSTGRAPHILE_PASSWORD@localhost/$POSTGRES_DB" \
 --owner-connection "postgres://$POSTGRES_USER:$POSTGRES_PASSWORD@localhost/$POSTGRES_DB" \
 --schema chat \
 --watch \
 --enhance-graphiql \
 --allow-explain \
 --no-setof-functions-contain-nulls \
 --no-ignore-rbac \
 --no-ignore-indexes \
 --append-plugins @graphile-contrib/pg-simplify-inflector,postgraphile-plugin-connection-filter \
 --dynamic-json \
 --show-error-stack=json \
 --extended-errors hint,detail,errcode \
 --enable-query-batching \
 --legacy-relations omit \
 --default-role chat_anonymous \
 --jwt-token-identifier chat.jwt \
 --jwt-secret "$JWT_SECRET" \
# --subscriptions \
