;;;
;;; Configure CEDET.
;;;

(require 'cedet)
;(require 'ede/cpp-root)
;(global-ede-mode 1)                 ; Enable the Project management system
;(semantic-load-enable-code-helpers) ; Enable prototype help and smart completion
(require 'semantic)
(require 'semantic/ia)
(require 'semantic/symref/cscope)
(require 'semantic/bovine/gcc)
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

