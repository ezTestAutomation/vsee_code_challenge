# rm -rf venv_*
. .env_config
py=$(which python$py_ver)
echo "Using Python Version"
$py --version
echo "Upgrade pip, wheel and virtualenv module"
$py -m pip install --upgrade pip
$py -m pip install --upgrade wheel virtualenv
echo "Check if virtualenv already created, if not create a new one"
if [ "$(find -name .venv_$py_ver)" = "" ]
then
    echo "Create new virtualenv"
    $py -m venv ".venv_$py_ver"
fi 
echo "Activate virtualenv"
. .venv_$py_ver/bin/activate
echo "Upgrade pip"
python -m pip install --upgrade pip
echo 
if [ -f "requirements.txt" ]
then
    echo "Install requirements Libraries"
    pip install -r requirements.txt
fi
echo "deactivate virtualenv"
deactivate