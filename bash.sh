
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


$0	当前脚本的文件名
$n	传递给脚本或函数的参数。n 是一个数字，表示第几个参数。例如，第一个参数是$1，第二个参数是$2。
$#	传递给脚本或函数的参数个数。
$*	传递给脚本或函数的所有参数。
$@	传递给脚本或函数的所有参数。被双引号(" ")包含时，与 $* 稍有不同，下面将会讲到。
$?	上个命令的退出状态，或函数的返回值。
$$	当前Shell进程ID。对于 Shell 脚本，就是这些脚本所在的进程ID。
