org_alias=$1

if [[ -z "$org_alias" ]]
then
	echo "Specify the org alias as the first parameter."
	exit 1
fi

echo
echo "Authorizing the org..."
echo "Please login to org."
sfdx force:auth:web:login -a "$org_alias"

echo
echo "Deploying to $org_alias..."
sfdx force:source:deploy -u "$org_alias" -p ./force-app

echo
sfdx force:org:open -u "$org_alias"

rm debug.log
