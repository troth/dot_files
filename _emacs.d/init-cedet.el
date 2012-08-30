;;;
;;; Configure CEDET.
;;;

;;;;;; Use this with cedet from outside of emacs.
;; Load CEDET.
;; See cedet/common/cedet.info for configuration details.
;; IMPORTANT: For Emacs >= 23.2, you must place this *before* any
;; CEDET component (including EIEIO) gets activated by another
;; package (Gnus, auth-source, ...).
(load-file "~/.emacs.d/site-el/cedet/common/cedet.el")

;; Enable EDE (Project Management) features
;(global-ede-mode 1)

;; Enable EDE for a pre-existing C++ project
;; (ede-cpp-root-project "NAME" :file "~/myproject/Makefile")


;; Enabling Semantic (code-parsing, smart completion) features
;; Select one of the following:

;; * This enables the database and idle reparse engines
(semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode,
;;   imenu support, and the semantic navigator
(semantic-load-enable-code-helpers)

;; * This enables even more coding tools such as intellisense mode,
;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;; (semantic-load-enable-gaudy-code-helpers)

;; * This enables the use of Exuberant ctags if you have it installed.
;;   If you use C++ templates or boost, you should NOT enable it.
;; (semantic-load-enable-all-exuberent-ctags-support)
;;   Or, use one of these two types of support.
;;   Add support for new languages only via ctags.
;; (semantic-load-enable-primary-exuberent-ctags-support)
;;   Add support for using ctags as a backup parser.
;; (semantic-load-enable-secondary-exuberent-ctags-support)

;; Enable SRecode (Template management) minor-mode.
;; (global-srecode-minor-mode 1)


;;;;;; Use this with cedet supplied with emacs >= 23.2.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;(require 'cedet)
;(require 'ede/cpp-root)
;(global-ede-mode 1)                 ; Enable the Project management system
;(semantic-load-enable-code-helpers) ; Enable prototype help and smart completion
;;;(require 'semantic)
;;;(require 'semantic/ia)
;;;(require 'semantic/symref/cscope)
;;;(require 'semantic/bovine/gcc)
;(global-srecode-minor-mode 1)       ; Enable template insertion menu

;;;(ede-cpp-root-project "lhn-trunk"
;;;    :file "/data/sandbox/Linux/V_9_0_00_Build_2461/lhn/cpp-root"
;;;    :include-path '(
;;;         "/eventDatabase/include"
;;;         "/shared/include"
;;;         "/shared/src/include"
;;;         "/product/include"
;;;         "/product/components/include"
;;;         "/product/tools/libxml2/include"
;;;         "/backend/monitoring/include"
;;;         "/backend/modules/include"
;;;         "/backend/snmp/net-snmp-5.3.2.2/include"
;;;         "/pils/include"
;;;         "/pils/components/include"
;;;         "/pils/tools/netxen_lsa/include"
;;;         )
;;;    :system-include-path '("/usr/include/c++/4.1.1/")
;;;)

