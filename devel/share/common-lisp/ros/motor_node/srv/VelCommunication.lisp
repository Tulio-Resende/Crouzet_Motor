; Auto-generated. Do not edit!


(cl:in-package motor_node-srv)


;//! \htmlinclude VelCommunication-request.msg.html

(cl:defclass <VelCommunication-request> (roslisp-msg-protocol:ros-message)
  ((a
    :reader a
    :initarg :a
    :type cl:integer
    :initform 0))
)

(cl:defclass VelCommunication-request (<VelCommunication-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VelCommunication-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VelCommunication-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name motor_node-srv:<VelCommunication-request> is deprecated: use motor_node-srv:VelCommunication-request instead.")))

(cl:ensure-generic-function 'a-val :lambda-list '(m))
(cl:defmethod a-val ((m <VelCommunication-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader motor_node-srv:a-val is deprecated.  Use motor_node-srv:a instead.")
  (a m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VelCommunication-request>) ostream)
  "Serializes a message object of type '<VelCommunication-request>"
  (cl:let* ((signed (cl:slot-value msg 'a)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VelCommunication-request>) istream)
  "Deserializes a message object of type '<VelCommunication-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'a) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VelCommunication-request>)))
  "Returns string type for a service object of type '<VelCommunication-request>"
  "motor_node/VelCommunicationRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VelCommunication-request)))
  "Returns string type for a service object of type 'VelCommunication-request"
  "motor_node/VelCommunicationRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VelCommunication-request>)))
  "Returns md5sum for a message object of type '<VelCommunication-request>"
  "d305ada655a6639621f582c764d323b8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VelCommunication-request)))
  "Returns md5sum for a message object of type 'VelCommunication-request"
  "d305ada655a6639621f582c764d323b8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VelCommunication-request>)))
  "Returns full string definition for message of type '<VelCommunication-request>"
  (cl:format cl:nil "int64 a~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VelCommunication-request)))
  "Returns full string definition for message of type 'VelCommunication-request"
  (cl:format cl:nil "int64 a~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VelCommunication-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VelCommunication-request>))
  "Converts a ROS message object to a list"
  (cl:list 'VelCommunication-request
    (cl:cons ':a (a msg))
))
;//! \htmlinclude VelCommunication-response.msg.html

(cl:defclass <VelCommunication-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass VelCommunication-response (<VelCommunication-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VelCommunication-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VelCommunication-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name motor_node-srv:<VelCommunication-response> is deprecated: use motor_node-srv:VelCommunication-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <VelCommunication-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader motor_node-srv:result-val is deprecated.  Use motor_node-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VelCommunication-response>) ostream)
  "Serializes a message object of type '<VelCommunication-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VelCommunication-response>) istream)
  "Deserializes a message object of type '<VelCommunication-response>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VelCommunication-response>)))
  "Returns string type for a service object of type '<VelCommunication-response>"
  "motor_node/VelCommunicationResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VelCommunication-response)))
  "Returns string type for a service object of type 'VelCommunication-response"
  "motor_node/VelCommunicationResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VelCommunication-response>)))
  "Returns md5sum for a message object of type '<VelCommunication-response>"
  "d305ada655a6639621f582c764d323b8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VelCommunication-response)))
  "Returns md5sum for a message object of type 'VelCommunication-response"
  "d305ada655a6639621f582c764d323b8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VelCommunication-response>)))
  "Returns full string definition for message of type '<VelCommunication-response>"
  (cl:format cl:nil "bool result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VelCommunication-response)))
  "Returns full string definition for message of type 'VelCommunication-response"
  (cl:format cl:nil "bool result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VelCommunication-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VelCommunication-response>))
  "Converts a ROS message object to a list"
  (cl:list 'VelCommunication-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'VelCommunication)))
  'VelCommunication-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'VelCommunication)))
  'VelCommunication-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VelCommunication)))
  "Returns string type for a service object of type '<VelCommunication>"
  "motor_node/VelCommunication")