
${parameter_name:-value} #假如parameter_name是空值，就回傳value，parameter_name還是空值

${parameter_name:=value}  #假如parameter_name是空值，就指定parameter_name為value
if [ -z "$parameter_name" ]; then parameter_name=value; fi

! EXPRESSION:  test returns true of EXPRESSION is false
-z STRING: test returns true if the length of STRING is zero.


set -o nounset  #遇到不存在的變量會報錯，預設為忽略. 
set -u #同上

set -x #一般只顯示執行結果，加此控制，會先输出執行的那行命令

set +e  #執行時錯誤，不會停止
set -e  #執行時錯誤，就停止

set -o pipefail   #用pipe時，設定為有一個失敗即代表整行失敗。預設：最後一個執行失敗才算失敗

# 一般用法
set -euxo pipefail


