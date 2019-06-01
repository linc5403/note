# pyenv prompt

## the plugin `pyenv` support func `pyenv_prompt_info`

## .oh-my-zsh/themes

```
--- a/themes/agnoster.zsh-theme
+++ b/themes/agnoster.zsh-theme
@@ -210,6 +210,24 @@ prompt_virtualenv() {
   fi
 }

+# pyenv prompt copied from powerline9k
+prompt_pyenv() {
+  if [[ -n "$PYENV_VERSION" ]]; then
+    prompt_segment black wite "($PYENV_VERSION)" 'PYTHON_ICON'
+    # prompt_segment green black "($PYENV_VERSION)" 'PYTHON_ICON'
+  elif [ $commands[pyenv] ]; then
+    local pyenv_version_name="$(pyenv version-name)"
+    local pyenv_global="system"
+    local pyenv_root="$(pyenv root)"
+    if [[ -f "${pyenv_root}/version" ]]; then
+      pyenv_global="$(pyenv version-file-read ${pyenv_root}/version)"
+    fi
+    if [[ "${pyenv_version_name}" != "${pyenv_global}" || "${POWERLEVEL9K_PYENV_PROMPT_ALWAYS_SHOW}" == "true" ]]; then
+      prompt_segment black wite "($pyenv_version_name)" 'PYTHON_ICON'
+    fi
+  fi
+}
+
 # Status:
 # - was there an error
 # - am I root
@@ -228,10 +246,11 @@ prompt_status() {
 build_prompt() {
   RETVAL=$?
   prompt_status
+  prompt_pyenv
   prompt_virtualenv
+  prompt_git
   prompt_context
   prompt_dir
-  prompt_git
   prompt_bzr
   prompt_hg
   prompt_end
(END)
```
