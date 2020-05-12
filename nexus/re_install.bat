call activate py36

rmdir /s/q dist
rmdir /s/q build

python setup.py bdist_wheel

twine upload --repository-url http://14.29.229.48:8091/repository/qi-pipy/ dist\*.whl -u admin -p admin123
twine upload --repository-url http://14.29.229.48:8091/repository/qi-pipy/ dist\*.whl -u admin -p admin123

pip uninstall qi.tool -y
pip install qi.tool
