# shellcheck disable=SC2148
# shellcheck disable=SC1091
. script/common.sh >&/dev/null
. script/clashctl.sh >&/dev/null

# _valid_env

clashoff >&/dev/null

update-rc.d "$BIN_KERNEL_NAME" remove >&/dev/null
rm -f "/etc/init.d/${BIN_KERNEL_NAME}"
service "$BIN_KERNEL_NAME" reload

rm -rf "$CLASH_BASE_DIR"
sed -i '/clashupdate/d' "$CLASH_CRON_TAB" >&/dev/null
_set_rc unset

_okcat '✨' '已卸载，相关配置已清除'
_quit
