
#dirs=("functions" "maintenance" "hosting-and-deployment" "hugo-modules" "myshowcase" "readfiles" "tools" "troubleshooting" "variables" "commands" "content-management" "getting-started" "hugo-pipes" "templates")
dirs=("news" "showcase" "about")
#mkdir -p "content/en/documentation"

for i in ${!dirs[@]};
do
    dir=${dirs[$i]}
    mv "content/en/${dir}" "content/site/en/${dir}"
    #echo "content/en/${dir}"
done