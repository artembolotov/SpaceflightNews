MODULE_SRC="Modules/NewsNetwork/Sources/NewsNetwork"

openapi-generator generate -i "openapi.yaml" -g swift5 -o "api-mobile"
rm -r $MODULE_SRC/*
cp -r "api-mobile/OpenApiClient/Classes/OpenAPIs/." $MODULE_SRC
rm -r "api-mobile"

