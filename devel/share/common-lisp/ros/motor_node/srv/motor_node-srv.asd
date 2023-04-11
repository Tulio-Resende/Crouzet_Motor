
(cl:in-package :asdf)

(defsystem "motor_node-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "VelCommunication" :depends-on ("_package_VelCommunication"))
    (:file "_package_VelCommunication" :depends-on ("_package"))
  ))