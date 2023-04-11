;; Auto-generated. Do not edit!


(when (boundp 'motor_node::VelCommunication)
  (if (not (find-package "MOTOR_NODE"))
    (make-package "MOTOR_NODE"))
  (shadow 'VelCommunication (find-package "MOTOR_NODE")))
(unless (find-package "MOTOR_NODE::VELCOMMUNICATION")
  (make-package "MOTOR_NODE::VELCOMMUNICATION"))
(unless (find-package "MOTOR_NODE::VELCOMMUNICATIONREQUEST")
  (make-package "MOTOR_NODE::VELCOMMUNICATIONREQUEST"))
(unless (find-package "MOTOR_NODE::VELCOMMUNICATIONRESPONSE")
  (make-package "MOTOR_NODE::VELCOMMUNICATIONRESPONSE"))

(in-package "ROS")





(defclass motor_node::VelCommunicationRequest
  :super ros::object
  :slots (_a ))

(defmethod motor_node::VelCommunicationRequest
  (:init
   (&key
    ((:a __a) 0)
    )
   (send-super :init)
   (setq _a (round __a))
   self)
  (:a
   (&optional __a)
   (if __a (setq _a __a)) _a)
  (:serialization-length
   ()
   (+
    ;; int64 _a
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _a
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _a (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _a) (= (length (_a . bv)) 2)) ;; bignum
              (write-long (ash (elt (_a . bv) 0) 0) s)
              (write-long (ash (elt (_a . bv) 1) -1) s))
             ((and (class _a) (= (length (_a . bv)) 1)) ;; big1
              (write-long (elt (_a . bv) 0) s)
              (write-long (if (>= _a 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _a s)(write-long (if (>= _a 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _a
#+(or :alpha :irix6 :x86_64)
      (setf _a (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _a (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(defclass motor_node::VelCommunicationResponse
  :super ros::object
  :slots (_result ))

(defmethod motor_node::VelCommunicationResponse
  (:init
   (&key
    ((:result __result) nil)
    )
   (send-super :init)
   (setq _result __result)
   self)
  (:result
   (&optional (__result :null))
   (if (not (eq __result :null)) (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; bool _result
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _result
       (if _result (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _result
     (setq _result (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass motor_node::VelCommunication
  :super ros::object
  :slots ())

(setf (get motor_node::VelCommunication :md5sum-) "d305ada655a6639621f582c764d323b8")
(setf (get motor_node::VelCommunication :datatype-) "motor_node/VelCommunication")
(setf (get motor_node::VelCommunication :request) motor_node::VelCommunicationRequest)
(setf (get motor_node::VelCommunication :response) motor_node::VelCommunicationResponse)

(defmethod motor_node::VelCommunicationRequest
  (:response () (instance motor_node::VelCommunicationResponse :init)))

(setf (get motor_node::VelCommunicationRequest :md5sum-) "d305ada655a6639621f582c764d323b8")
(setf (get motor_node::VelCommunicationRequest :datatype-) "motor_node/VelCommunicationRequest")
(setf (get motor_node::VelCommunicationRequest :definition-)
      "int64 a
---
bool result
")

(setf (get motor_node::VelCommunicationResponse :md5sum-) "d305ada655a6639621f582c764d323b8")
(setf (get motor_node::VelCommunicationResponse :datatype-) "motor_node/VelCommunicationResponse")
(setf (get motor_node::VelCommunicationResponse :definition-)
      "int64 a
---
bool result
")



(provide :motor_node/VelCommunication "d305ada655a6639621f582c764d323b8")


