       �K"	  ��4��Abrain.Event:2���	u7     ,4+3	���4��A"��
{
data_inPlaceholder"/device:CPU:0*
dtype0*
shape:����������*(
_output_shapes
:����������
z
data_outPlaceholder"/device:CPU:0*
dtype0*
shape:���������*'
_output_shapes
:���������
e
dropout_keep_probPlaceholder"/device:CPU:0*
dtype0*
shape:*
_output_shapes
:
_
PlaceholderPlaceholder"/device:CPU:0*
dtype0*
shape:*
_output_shapes
:
a
Placeholder_1Placeholder"/device:CPU:0*
dtype0*
shape:*
_output_shapes
:
~
embedding/random_uniform/shapeConst"/device:CPU:0*
dtype0*
valueB"	"  �   *
_output_shapes
:
p
embedding/random_uniform/minConst"/device:CPU:0*
dtype0*
valueB
 *  ��*
_output_shapes
: 
p
embedding/random_uniform/maxConst"/device:CPU:0*
dtype0*
valueB
 *  �?*
_output_shapes
: 
�
&embedding/random_uniform/RandomUniformRandomUniformembedding/random_uniform/shape"/device:CPU:0*
dtype0*
seed2 *

seed *
T0* 
_output_shapes
:
�D�
�
embedding/random_uniform/subSubembedding/random_uniform/maxembedding/random_uniform/min"/device:CPU:0*
T0*
_output_shapes
: 
�
embedding/random_uniform/mulMul&embedding/random_uniform/RandomUniformembedding/random_uniform/sub"/device:CPU:0*
T0* 
_output_shapes
:
�D�
�
embedding/random_uniformAddembedding/random_uniform/mulembedding/random_uniform/min"/device:CPU:0*
T0* 
_output_shapes
:
�D�
�
embedding/embedding_matrix
VariableV2"/device:CPU:0*
dtype0*
shape:
�D�*
	container *
shared_name * 
_output_shapes
:
�D�
�
!embedding/embedding_matrix/AssignAssignembedding/embedding_matrixembedding/random_uniform"/device:CPU:0*
validate_shape(*-
_class#
!loc:@embedding/embedding_matrix*
use_locking(*
T0* 
_output_shapes
:
�D�
�
embedding/embedding_matrix/readIdentityembedding/embedding_matrix"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0* 
_output_shapes
:
�D�
�
embedding/embedding_lookupGatherembedding/embedding_matrix/readdata_in"/device:CPU:0*
validate_indices(*
Tparams0*
Tindices0*-
_class#
!loc:@embedding/embedding_matrix*-
_output_shapes
:�����������
r
embedding/ExpandDims/dimConst"/device:CPU:0*
dtype0*
valueB :
���������*
_output_shapes
: 
�
embedding/ExpandDims
ExpandDimsembedding/embedding_lookupembedding/ExpandDims/dim"/device:CPU:0*

Tdim0*
T0*1
_output_shapes
:�����������
�
%conv-maxpool-3/truncated_normal/shapeConst"/device:CPU:0*
dtype0*%
valueB"   �      �   *
_output_shapes
:
x
$conv-maxpool-3/truncated_normal/meanConst"/device:CPU:0*
dtype0*
valueB
 *    *
_output_shapes
: 
z
&conv-maxpool-3/truncated_normal/stddevConst"/device:CPU:0*
dtype0*
valueB
 *���=*
_output_shapes
: 
�
/conv-maxpool-3/truncated_normal/TruncatedNormalTruncatedNormal%conv-maxpool-3/truncated_normal/shape"/device:CPU:0*
dtype0*
seed2 *

seed *
T0*(
_output_shapes
:��
�
#conv-maxpool-3/truncated_normal/mulMul/conv-maxpool-3/truncated_normal/TruncatedNormal&conv-maxpool-3/truncated_normal/stddev"/device:CPU:0*
T0*(
_output_shapes
:��
�
conv-maxpool-3/truncated_normalAdd#conv-maxpool-3/truncated_normal/mul$conv-maxpool-3/truncated_normal/mean"/device:CPU:0*
T0*(
_output_shapes
:��
�
conv-maxpool-3/W_conv
VariableV2"/device:CPU:0*
dtype0*
shape:��*
	container *
shared_name *(
_output_shapes
:��
�
conv-maxpool-3/W_conv/AssignAssignconv-maxpool-3/W_convconv-maxpool-3/truncated_normal"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-3/W_conv*
use_locking(*
T0*(
_output_shapes
:��
�
conv-maxpool-3/W_conv/readIdentityconv-maxpool-3/W_conv"/device:CPU:0*(
_class
loc:@conv-maxpool-3/W_conv*
T0*(
_output_shapes
:��
r
conv-maxpool-3/ConstConst"/device:CPU:0*
dtype0*
valueB�*���=*
_output_shapes	
:�
�
conv-maxpool-3/b_conv
VariableV2"/device:CPU:0*
dtype0*
shape:�*
	container *
shared_name *
_output_shapes	
:�
�
conv-maxpool-3/b_conv/AssignAssignconv-maxpool-3/b_convconv-maxpool-3/Const"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-3/b_conv*
use_locking(*
T0*
_output_shapes	
:�
�
conv-maxpool-3/b_conv/readIdentityconv-maxpool-3/b_conv"/device:CPU:0*(
_class
loc:@conv-maxpool-3/b_conv*
T0*
_output_shapes	
:�
�
conv-maxpool-3/convConv2Dembedding/ExpandDimsconv-maxpool-3/W_conv/read"/device:CPU:0*1
_output_shapes
:�����������*
data_formatNHWC*
use_cudnn_on_gpu(*
paddingVALID*
strides
*
T0
�
conv-maxpool-3/BiasAddBiasAddconv-maxpool-3/convconv-maxpool-3/b_conv/read"/device:CPU:0*1
_output_shapes
:�����������*
T0*
data_formatNHWC
~
conv-maxpool-3/reluReluconv-maxpool-3/BiasAdd"/device:CPU:0*
T0*1
_output_shapes
:�����������
�
conv-maxpool-3/poolMaxPoolconv-maxpool-3/relu"/device:CPU:0*0
_output_shapes
:����������*
data_formatNHWC*
paddingVALID*
strides
*
ksize	
�*
T0
�
%conv-maxpool-4/truncated_normal/shapeConst"/device:CPU:0*
dtype0*%
valueB"   �      �   *
_output_shapes
:
x
$conv-maxpool-4/truncated_normal/meanConst"/device:CPU:0*
dtype0*
valueB
 *    *
_output_shapes
: 
z
&conv-maxpool-4/truncated_normal/stddevConst"/device:CPU:0*
dtype0*
valueB
 *���=*
_output_shapes
: 
�
/conv-maxpool-4/truncated_normal/TruncatedNormalTruncatedNormal%conv-maxpool-4/truncated_normal/shape"/device:CPU:0*
dtype0*
seed2 *

seed *
T0*(
_output_shapes
:��
�
#conv-maxpool-4/truncated_normal/mulMul/conv-maxpool-4/truncated_normal/TruncatedNormal&conv-maxpool-4/truncated_normal/stddev"/device:CPU:0*
T0*(
_output_shapes
:��
�
conv-maxpool-4/truncated_normalAdd#conv-maxpool-4/truncated_normal/mul$conv-maxpool-4/truncated_normal/mean"/device:CPU:0*
T0*(
_output_shapes
:��
�
conv-maxpool-4/W_conv
VariableV2"/device:CPU:0*
dtype0*
shape:��*
	container *
shared_name *(
_output_shapes
:��
�
conv-maxpool-4/W_conv/AssignAssignconv-maxpool-4/W_convconv-maxpool-4/truncated_normal"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-4/W_conv*
use_locking(*
T0*(
_output_shapes
:��
�
conv-maxpool-4/W_conv/readIdentityconv-maxpool-4/W_conv"/device:CPU:0*(
_class
loc:@conv-maxpool-4/W_conv*
T0*(
_output_shapes
:��
r
conv-maxpool-4/ConstConst"/device:CPU:0*
dtype0*
valueB�*���=*
_output_shapes	
:�
�
conv-maxpool-4/b_conv
VariableV2"/device:CPU:0*
dtype0*
shape:�*
	container *
shared_name *
_output_shapes	
:�
�
conv-maxpool-4/b_conv/AssignAssignconv-maxpool-4/b_convconv-maxpool-4/Const"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-4/b_conv*
use_locking(*
T0*
_output_shapes	
:�
�
conv-maxpool-4/b_conv/readIdentityconv-maxpool-4/b_conv"/device:CPU:0*(
_class
loc:@conv-maxpool-4/b_conv*
T0*
_output_shapes	
:�
�
conv-maxpool-4/convConv2Dembedding/ExpandDimsconv-maxpool-4/W_conv/read"/device:CPU:0*1
_output_shapes
:�����������*
data_formatNHWC*
use_cudnn_on_gpu(*
paddingVALID*
strides
*
T0
�
conv-maxpool-4/BiasAddBiasAddconv-maxpool-4/convconv-maxpool-4/b_conv/read"/device:CPU:0*1
_output_shapes
:�����������*
T0*
data_formatNHWC
~
conv-maxpool-4/reluReluconv-maxpool-4/BiasAdd"/device:CPU:0*
T0*1
_output_shapes
:�����������
�
conv-maxpool-4/poolMaxPoolconv-maxpool-4/relu"/device:CPU:0*0
_output_shapes
:����������*
data_formatNHWC*
paddingVALID*
strides
*
ksize	
�*
T0
�
%conv-maxpool-5/truncated_normal/shapeConst"/device:CPU:0*
dtype0*%
valueB"   �      �   *
_output_shapes
:
x
$conv-maxpool-5/truncated_normal/meanConst"/device:CPU:0*
dtype0*
valueB
 *    *
_output_shapes
: 
z
&conv-maxpool-5/truncated_normal/stddevConst"/device:CPU:0*
dtype0*
valueB
 *���=*
_output_shapes
: 
�
/conv-maxpool-5/truncated_normal/TruncatedNormalTruncatedNormal%conv-maxpool-5/truncated_normal/shape"/device:CPU:0*
dtype0*
seed2 *

seed *
T0*(
_output_shapes
:��
�
#conv-maxpool-5/truncated_normal/mulMul/conv-maxpool-5/truncated_normal/TruncatedNormal&conv-maxpool-5/truncated_normal/stddev"/device:CPU:0*
T0*(
_output_shapes
:��
�
conv-maxpool-5/truncated_normalAdd#conv-maxpool-5/truncated_normal/mul$conv-maxpool-5/truncated_normal/mean"/device:CPU:0*
T0*(
_output_shapes
:��
�
conv-maxpool-5/W_conv
VariableV2"/device:CPU:0*
dtype0*
shape:��*
	container *
shared_name *(
_output_shapes
:��
�
conv-maxpool-5/W_conv/AssignAssignconv-maxpool-5/W_convconv-maxpool-5/truncated_normal"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-5/W_conv*
use_locking(*
T0*(
_output_shapes
:��
�
conv-maxpool-5/W_conv/readIdentityconv-maxpool-5/W_conv"/device:CPU:0*(
_class
loc:@conv-maxpool-5/W_conv*
T0*(
_output_shapes
:��
r
conv-maxpool-5/ConstConst"/device:CPU:0*
dtype0*
valueB�*���=*
_output_shapes	
:�
�
conv-maxpool-5/b_conv
VariableV2"/device:CPU:0*
dtype0*
shape:�*
	container *
shared_name *
_output_shapes	
:�
�
conv-maxpool-5/b_conv/AssignAssignconv-maxpool-5/b_convconv-maxpool-5/Const"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-5/b_conv*
use_locking(*
T0*
_output_shapes	
:�
�
conv-maxpool-5/b_conv/readIdentityconv-maxpool-5/b_conv"/device:CPU:0*(
_class
loc:@conv-maxpool-5/b_conv*
T0*
_output_shapes	
:�
�
conv-maxpool-5/convConv2Dembedding/ExpandDimsconv-maxpool-5/W_conv/read"/device:CPU:0*1
_output_shapes
:�����������*
data_formatNHWC*
use_cudnn_on_gpu(*
paddingVALID*
strides
*
T0
�
conv-maxpool-5/BiasAddBiasAddconv-maxpool-5/convconv-maxpool-5/b_conv/read"/device:CPU:0*1
_output_shapes
:�����������*
T0*
data_formatNHWC
~
conv-maxpool-5/reluReluconv-maxpool-5/BiasAdd"/device:CPU:0*
T0*1
_output_shapes
:�����������
�
conv-maxpool-5/poolMaxPoolconv-maxpool-5/relu"/device:CPU:0*0
_output_shapes
:����������*
data_formatNHWC*
paddingVALID*
strides
*
ksize	
�*
T0
\
concat/axisConst"/device:CPU:0*
dtype0*
value	B :*
_output_shapes
: 
�
concatConcatV2conv-maxpool-3/poolconv-maxpool-4/poolconv-maxpool-5/poolconcat/axis"/device:CPU:0*
N*

Tidx0*0
_output_shapes
:����������*
T0
m
Reshape/shapeConst"/device:CPU:0*
dtype0*
valueB"�����  *
_output_shapes
:
y
ReshapeReshapeconcatReshape/shape"/device:CPU:0*(
_output_shapes
:����������*
T0*
Tshape0
k
dropout/dropout/ShapeShapeReshape"/device:CPU:0*
out_type0*
T0*
_output_shapes
:
v
"dropout/dropout/random_uniform/minConst"/device:CPU:0*
dtype0*
valueB
 *    *
_output_shapes
: 
v
"dropout/dropout/random_uniform/maxConst"/device:CPU:0*
dtype0*
valueB
 *  �?*
_output_shapes
: 
�
,dropout/dropout/random_uniform/RandomUniformRandomUniformdropout/dropout/Shape"/device:CPU:0*
dtype0*
seed2 *

seed *
T0*(
_output_shapes
:����������
�
"dropout/dropout/random_uniform/subSub"dropout/dropout/random_uniform/max"dropout/dropout/random_uniform/min"/device:CPU:0*
T0*
_output_shapes
: 
�
"dropout/dropout/random_uniform/mulMul,dropout/dropout/random_uniform/RandomUniform"dropout/dropout/random_uniform/sub"/device:CPU:0*
T0*(
_output_shapes
:����������
�
dropout/dropout/random_uniformAdd"dropout/dropout/random_uniform/mul"dropout/dropout/random_uniform/min"/device:CPU:0*
T0*(
_output_shapes
:����������

dropout/dropout/addAdddropout_keep_probdropout/dropout/random_uniform"/device:CPU:0*
T0*
_output_shapes
:
e
dropout/dropout/FloorFloordropout/dropout/add"/device:CPU:0*
T0*
_output_shapes
:
l
dropout/dropout/divRealDivReshapedropout_keep_prob"/device:CPU:0*
T0*
_output_shapes
:
�
dropout/dropout/mulMuldropout/dropout/divdropout/dropout/Floor"/device:CPU:0*
T0*(
_output_shapes
:����������
}
output/truncated_normal/shapeConst"/device:CPU:0*
dtype0*
valueB"�     *
_output_shapes
:
p
output/truncated_normal/meanConst"/device:CPU:0*
dtype0*
valueB
 *    *
_output_shapes
: 
r
output/truncated_normal/stddevConst"/device:CPU:0*
dtype0*
valueB
 *���=*
_output_shapes
: 
�
'output/truncated_normal/TruncatedNormalTruncatedNormaloutput/truncated_normal/shape"/device:CPU:0*
dtype0*
seed2 *

seed *
T0*
_output_shapes
:	�
�
output/truncated_normal/mulMul'output/truncated_normal/TruncatedNormaloutput/truncated_normal/stddev"/device:CPU:0*
T0*
_output_shapes
:	�
�
output/truncated_normalAddoutput/truncated_normal/muloutput/truncated_normal/mean"/device:CPU:0*
T0*
_output_shapes
:	�
�
output/W_out
VariableV2"/device:CPU:0*
dtype0*
shape:	�*
	container *
shared_name *
_output_shapes
:	�
�
output/W_out/AssignAssignoutput/W_outoutput/truncated_normal"/device:CPU:0*
validate_shape(*
_class
loc:@output/W_out*
use_locking(*
T0*
_output_shapes
:	�
�
output/W_out/readIdentityoutput/W_out"/device:CPU:0*
_class
loc:@output/W_out*
T0*
_output_shapes
:	�
h
output/ConstConst"/device:CPU:0*
dtype0*
valueB*���=*
_output_shapes
:
�
output/b_out
VariableV2"/device:CPU:0*
dtype0*
shape:*
	container *
shared_name *
_output_shapes
:
�
output/b_out/AssignAssignoutput/b_outoutput/Const"/device:CPU:0*
validate_shape(*
_class
loc:@output/b_out*
use_locking(*
T0*
_output_shapes
:
�
output/b_out/readIdentityoutput/b_out"/device:CPU:0*
_class
loc:@output/b_out*
T0*
_output_shapes
:
�
output/MatMulMatMuldropout/dropout/muloutput/W_out/read"/device:CPU:0*
transpose_b( *
transpose_a( *
T0*'
_output_shapes
:���������
t

output/addAddoutput/MatMuloutput/b_out/read"/device:CPU:0*
T0*'
_output_shapes
:���������
f
output/SoftmaxSoftmax
output/add"/device:CPU:0*
T0*'
_output_shapes
:���������
[
LogLogoutput/Softmax"/device:CPU:0*
T0*'
_output_shapes
:���������
Z
mulMuldata_outLog"/device:CPU:0*
T0*'
_output_shapes
:���������
e
ConstConst"/device:CPU:0*
dtype0*
valueB"       *
_output_shapes
:
c
SumSummulConst"/device:CPU:0*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0
?
NegNegSum"/device:CPU:0*
T0*
_output_shapes
: 
a
gradients/ShapeConst"/device:CPU:0*
dtype0*
valueB *
_output_shapes
: 
c
gradients/ConstConst"/device:CPU:0*
dtype0*
valueB
 *  �?*
_output_shapes
: 
h
gradients/FillFillgradients/Shapegradients/Const"/device:CPU:0*
T0*
_output_shapes
: 
]
gradients/Neg_grad/NegNeggradients/Fill"/device:CPU:0*
T0*
_output_shapes
: 
�
 gradients/Sum_grad/Reshape/shapeConst"/device:CPU:0*
dtype0*
valueB"      *
_output_shapes
:
�
gradients/Sum_grad/ReshapeReshapegradients/Neg_grad/Neg gradients/Sum_grad/Reshape/shape"/device:CPU:0*
_output_shapes

:*
T0*
Tshape0
j
gradients/Sum_grad/ShapeShapemul"/device:CPU:0*
out_type0*
T0*
_output_shapes
:
�
gradients/Sum_grad/TileTilegradients/Sum_grad/Reshapegradients/Sum_grad/Shape"/device:CPU:0*

Tmultiples0*
T0*'
_output_shapes
:���������
o
gradients/mul_grad/ShapeShapedata_out"/device:CPU:0*
out_type0*
T0*
_output_shapes
:
l
gradients/mul_grad/Shape_1ShapeLog"/device:CPU:0*
out_type0*
T0*
_output_shapes
:
�
(gradients/mul_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/mul_grad/Shapegradients/mul_grad/Shape_1"/device:CPU:0*
T0*2
_output_shapes 
:���������:���������
|
gradients/mul_grad/mulMulgradients/Sum_grad/TileLog"/device:CPU:0*
T0*'
_output_shapes
:���������
�
gradients/mul_grad/SumSumgradients/mul_grad/mul(gradients/mul_grad/BroadcastGradientArgs"/device:CPU:0*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0
�
gradients/mul_grad/ReshapeReshapegradients/mul_grad/Sumgradients/mul_grad/Shape"/device:CPU:0*'
_output_shapes
:���������*
T0*
Tshape0
�
gradients/mul_grad/mul_1Muldata_outgradients/Sum_grad/Tile"/device:CPU:0*
T0*'
_output_shapes
:���������
�
gradients/mul_grad/Sum_1Sumgradients/mul_grad/mul_1*gradients/mul_grad/BroadcastGradientArgs:1"/device:CPU:0*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0
�
gradients/mul_grad/Reshape_1Reshapegradients/mul_grad/Sum_1gradients/mul_grad/Shape_1"/device:CPU:0*'
_output_shapes
:���������*
T0*
Tshape0
v
#gradients/mul_grad/tuple/group_depsNoOp^gradients/mul_grad/Reshape^gradients/mul_grad/Reshape_1"/device:CPU:0
�
+gradients/mul_grad/tuple/control_dependencyIdentitygradients/mul_grad/Reshape$^gradients/mul_grad/tuple/group_deps"/device:CPU:0*-
_class#
!loc:@gradients/mul_grad/Reshape*
T0*'
_output_shapes
:���������
�
-gradients/mul_grad/tuple/control_dependency_1Identitygradients/mul_grad/Reshape_1$^gradients/mul_grad/tuple/group_deps"/device:CPU:0*/
_class%
#!loc:@gradients/mul_grad/Reshape_1*
T0*'
_output_shapes
:���������
�
gradients/Log_grad/Reciprocal
Reciprocaloutput/Softmax.^gradients/mul_grad/tuple/control_dependency_1"/device:CPU:0*
T0*'
_output_shapes
:���������
�
gradients/Log_grad/mulMul-gradients/mul_grad/tuple/control_dependency_1gradients/Log_grad/Reciprocal"/device:CPU:0*
T0*'
_output_shapes
:���������
�
!gradients/output/Softmax_grad/mulMulgradients/Log_grad/muloutput/Softmax"/device:CPU:0*
T0*'
_output_shapes
:���������
�
3gradients/output/Softmax_grad/Sum/reduction_indicesConst"/device:CPU:0*
dtype0*
valueB:*
_output_shapes
:
�
!gradients/output/Softmax_grad/SumSum!gradients/output/Softmax_grad/mul3gradients/output/Softmax_grad/Sum/reduction_indices"/device:CPU:0*#
_output_shapes
:���������*
T0*
	keep_dims( *

Tidx0
�
+gradients/output/Softmax_grad/Reshape/shapeConst"/device:CPU:0*
dtype0*
valueB"����   *
_output_shapes
:
�
%gradients/output/Softmax_grad/ReshapeReshape!gradients/output/Softmax_grad/Sum+gradients/output/Softmax_grad/Reshape/shape"/device:CPU:0*'
_output_shapes
:���������*
T0*
Tshape0
�
!gradients/output/Softmax_grad/subSubgradients/Log_grad/mul%gradients/output/Softmax_grad/Reshape"/device:CPU:0*
T0*'
_output_shapes
:���������
�
#gradients/output/Softmax_grad/mul_1Mul!gradients/output/Softmax_grad/suboutput/Softmax"/device:CPU:0*
T0*'
_output_shapes
:���������
{
gradients/output/add_grad/ShapeShapeoutput/MatMul"/device:CPU:0*
out_type0*
T0*
_output_shapes
:
z
!gradients/output/add_grad/Shape_1Const"/device:CPU:0*
dtype0*
valueB:*
_output_shapes
:
�
/gradients/output/add_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/output/add_grad/Shape!gradients/output/add_grad/Shape_1"/device:CPU:0*
T0*2
_output_shapes 
:���������:���������
�
gradients/output/add_grad/SumSum#gradients/output/Softmax_grad/mul_1/gradients/output/add_grad/BroadcastGradientArgs"/device:CPU:0*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0
�
!gradients/output/add_grad/ReshapeReshapegradients/output/add_grad/Sumgradients/output/add_grad/Shape"/device:CPU:0*'
_output_shapes
:���������*
T0*
Tshape0
�
gradients/output/add_grad/Sum_1Sum#gradients/output/Softmax_grad/mul_11gradients/output/add_grad/BroadcastGradientArgs:1"/device:CPU:0*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0
�
#gradients/output/add_grad/Reshape_1Reshapegradients/output/add_grad/Sum_1!gradients/output/add_grad/Shape_1"/device:CPU:0*
_output_shapes
:*
T0*
Tshape0
�
*gradients/output/add_grad/tuple/group_depsNoOp"^gradients/output/add_grad/Reshape$^gradients/output/add_grad/Reshape_1"/device:CPU:0
�
2gradients/output/add_grad/tuple/control_dependencyIdentity!gradients/output/add_grad/Reshape+^gradients/output/add_grad/tuple/group_deps"/device:CPU:0*4
_class*
(&loc:@gradients/output/add_grad/Reshape*
T0*'
_output_shapes
:���������
�
4gradients/output/add_grad/tuple/control_dependency_1Identity#gradients/output/add_grad/Reshape_1+^gradients/output/add_grad/tuple/group_deps"/device:CPU:0*6
_class,
*(loc:@gradients/output/add_grad/Reshape_1*
T0*
_output_shapes
:
�
#gradients/output/MatMul_grad/MatMulMatMul2gradients/output/add_grad/tuple/control_dependencyoutput/W_out/read"/device:CPU:0*
transpose_b(*
transpose_a( *
T0*(
_output_shapes
:����������
�
%gradients/output/MatMul_grad/MatMul_1MatMuldropout/dropout/mul2gradients/output/add_grad/tuple/control_dependency"/device:CPU:0*
transpose_b( *
transpose_a(*
T0*
_output_shapes
:	�
�
-gradients/output/MatMul_grad/tuple/group_depsNoOp$^gradients/output/MatMul_grad/MatMul&^gradients/output/MatMul_grad/MatMul_1"/device:CPU:0
�
5gradients/output/MatMul_grad/tuple/control_dependencyIdentity#gradients/output/MatMul_grad/MatMul.^gradients/output/MatMul_grad/tuple/group_deps"/device:CPU:0*6
_class,
*(loc:@gradients/output/MatMul_grad/MatMul*
T0*(
_output_shapes
:����������
�
7gradients/output/MatMul_grad/tuple/control_dependency_1Identity%gradients/output/MatMul_grad/MatMul_1.^gradients/output/MatMul_grad/tuple/group_deps"/device:CPU:0*8
_class.
,*loc:@gradients/output/MatMul_grad/MatMul_1*
T0*
_output_shapes
:	�
�
(gradients/dropout/dropout/mul_grad/ShapeShapedropout/dropout/div"/device:CPU:0*
out_type0*
T0*#
_output_shapes
:���������
�
*gradients/dropout/dropout/mul_grad/Shape_1Shapedropout/dropout/Floor"/device:CPU:0*
out_type0*
T0*#
_output_shapes
:���������
�
8gradients/dropout/dropout/mul_grad/BroadcastGradientArgsBroadcastGradientArgs(gradients/dropout/dropout/mul_grad/Shape*gradients/dropout/dropout/mul_grad/Shape_1"/device:CPU:0*
T0*2
_output_shapes 
:���������:���������
�
&gradients/dropout/dropout/mul_grad/mulMul5gradients/output/MatMul_grad/tuple/control_dependencydropout/dropout/Floor"/device:CPU:0*
T0*
_output_shapes
:
�
&gradients/dropout/dropout/mul_grad/SumSum&gradients/dropout/dropout/mul_grad/mul8gradients/dropout/dropout/mul_grad/BroadcastGradientArgs"/device:CPU:0*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0
�
*gradients/dropout/dropout/mul_grad/ReshapeReshape&gradients/dropout/dropout/mul_grad/Sum(gradients/dropout/dropout/mul_grad/Shape"/device:CPU:0*
_output_shapes
:*
T0*
Tshape0
�
(gradients/dropout/dropout/mul_grad/mul_1Muldropout/dropout/div5gradients/output/MatMul_grad/tuple/control_dependency"/device:CPU:0*
T0*
_output_shapes
:
�
(gradients/dropout/dropout/mul_grad/Sum_1Sum(gradients/dropout/dropout/mul_grad/mul_1:gradients/dropout/dropout/mul_grad/BroadcastGradientArgs:1"/device:CPU:0*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0
�
,gradients/dropout/dropout/mul_grad/Reshape_1Reshape(gradients/dropout/dropout/mul_grad/Sum_1*gradients/dropout/dropout/mul_grad/Shape_1"/device:CPU:0*
_output_shapes
:*
T0*
Tshape0
�
3gradients/dropout/dropout/mul_grad/tuple/group_depsNoOp+^gradients/dropout/dropout/mul_grad/Reshape-^gradients/dropout/dropout/mul_grad/Reshape_1"/device:CPU:0
�
;gradients/dropout/dropout/mul_grad/tuple/control_dependencyIdentity*gradients/dropout/dropout/mul_grad/Reshape4^gradients/dropout/dropout/mul_grad/tuple/group_deps"/device:CPU:0*=
_class3
1/loc:@gradients/dropout/dropout/mul_grad/Reshape*
T0*
_output_shapes
:
�
=gradients/dropout/dropout/mul_grad/tuple/control_dependency_1Identity,gradients/dropout/dropout/mul_grad/Reshape_14^gradients/dropout/dropout/mul_grad/tuple/group_deps"/device:CPU:0*?
_class5
31loc:@gradients/dropout/dropout/mul_grad/Reshape_1*
T0*
_output_shapes
:
~
(gradients/dropout/dropout/div_grad/ShapeShapeReshape"/device:CPU:0*
out_type0*
T0*
_output_shapes
:
�
*gradients/dropout/dropout/div_grad/Shape_1Shapedropout_keep_prob"/device:CPU:0*
out_type0*
T0*#
_output_shapes
:���������
�
8gradients/dropout/dropout/div_grad/BroadcastGradientArgsBroadcastGradientArgs(gradients/dropout/dropout/div_grad/Shape*gradients/dropout/dropout/div_grad/Shape_1"/device:CPU:0*
T0*2
_output_shapes 
:���������:���������
�
*gradients/dropout/dropout/div_grad/RealDivRealDiv;gradients/dropout/dropout/mul_grad/tuple/control_dependencydropout_keep_prob"/device:CPU:0*
T0*
_output_shapes
:
�
&gradients/dropout/dropout/div_grad/SumSum*gradients/dropout/dropout/div_grad/RealDiv8gradients/dropout/dropout/div_grad/BroadcastGradientArgs"/device:CPU:0*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0
�
*gradients/dropout/dropout/div_grad/ReshapeReshape&gradients/dropout/dropout/div_grad/Sum(gradients/dropout/dropout/div_grad/Shape"/device:CPU:0*(
_output_shapes
:����������*
T0*
Tshape0
x
&gradients/dropout/dropout/div_grad/NegNegReshape"/device:CPU:0*
T0*(
_output_shapes
:����������
�
,gradients/dropout/dropout/div_grad/RealDiv_1RealDiv&gradients/dropout/dropout/div_grad/Negdropout_keep_prob"/device:CPU:0*
T0*
_output_shapes
:
�
,gradients/dropout/dropout/div_grad/RealDiv_2RealDiv,gradients/dropout/dropout/div_grad/RealDiv_1dropout_keep_prob"/device:CPU:0*
T0*
_output_shapes
:
�
&gradients/dropout/dropout/div_grad/mulMul;gradients/dropout/dropout/mul_grad/tuple/control_dependency,gradients/dropout/dropout/div_grad/RealDiv_2"/device:CPU:0*
T0*
_output_shapes
:
�
(gradients/dropout/dropout/div_grad/Sum_1Sum&gradients/dropout/dropout/div_grad/mul:gradients/dropout/dropout/div_grad/BroadcastGradientArgs:1"/device:CPU:0*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0
�
,gradients/dropout/dropout/div_grad/Reshape_1Reshape(gradients/dropout/dropout/div_grad/Sum_1*gradients/dropout/dropout/div_grad/Shape_1"/device:CPU:0*
_output_shapes
:*
T0*
Tshape0
�
3gradients/dropout/dropout/div_grad/tuple/group_depsNoOp+^gradients/dropout/dropout/div_grad/Reshape-^gradients/dropout/dropout/div_grad/Reshape_1"/device:CPU:0
�
;gradients/dropout/dropout/div_grad/tuple/control_dependencyIdentity*gradients/dropout/dropout/div_grad/Reshape4^gradients/dropout/dropout/div_grad/tuple/group_deps"/device:CPU:0*=
_class3
1/loc:@gradients/dropout/dropout/div_grad/Reshape*
T0*(
_output_shapes
:����������
�
=gradients/dropout/dropout/div_grad/tuple/control_dependency_1Identity,gradients/dropout/dropout/div_grad/Reshape_14^gradients/dropout/dropout/div_grad/tuple/group_deps"/device:CPU:0*?
_class5
31loc:@gradients/dropout/dropout/div_grad/Reshape_1*
T0*
_output_shapes
:
q
gradients/Reshape_grad/ShapeShapeconcat"/device:CPU:0*
out_type0*
T0*
_output_shapes
:
�
gradients/Reshape_grad/ReshapeReshape;gradients/dropout/dropout/div_grad/tuple/control_dependencygradients/Reshape_grad/Shape"/device:CPU:0*0
_output_shapes
:����������*
T0*
Tshape0
k
gradients/concat_grad/RankConst"/device:CPU:0*
dtype0*
value	B :*
_output_shapes
: 
~
gradients/concat_grad/modFloorModconcat/axisgradients/concat_grad/Rank"/device:CPU:0*
T0*
_output_shapes
: 
}
gradients/concat_grad/ShapeShapeconv-maxpool-3/pool"/device:CPU:0*
out_type0*
T0*
_output_shapes
:
�
gradients/concat_grad/ShapeNShapeNconv-maxpool-3/poolconv-maxpool-4/poolconv-maxpool-5/pool"/device:CPU:0*
out_type0*
T0*&
_output_shapes
:::*
N
�
"gradients/concat_grad/ConcatOffsetConcatOffsetgradients/concat_grad/modgradients/concat_grad/ShapeNgradients/concat_grad/ShapeN:1gradients/concat_grad/ShapeN:2"/device:CPU:0*&
_output_shapes
:::*
N
�
gradients/concat_grad/SliceSlicegradients/Reshape_grad/Reshape"gradients/concat_grad/ConcatOffsetgradients/concat_grad/ShapeN"/device:CPU:0*
Index0*
T0*J
_output_shapes8
6:4������������������������������������
�
gradients/concat_grad/Slice_1Slicegradients/Reshape_grad/Reshape$gradients/concat_grad/ConcatOffset:1gradients/concat_grad/ShapeN:1"/device:CPU:0*
Index0*
T0*J
_output_shapes8
6:4������������������������������������
�
gradients/concat_grad/Slice_2Slicegradients/Reshape_grad/Reshape$gradients/concat_grad/ConcatOffset:2gradients/concat_grad/ShapeN:2"/device:CPU:0*
Index0*
T0*J
_output_shapes8
6:4������������������������������������
�
&gradients/concat_grad/tuple/group_depsNoOp^gradients/concat_grad/Slice^gradients/concat_grad/Slice_1^gradients/concat_grad/Slice_2"/device:CPU:0
�
.gradients/concat_grad/tuple/control_dependencyIdentitygradients/concat_grad/Slice'^gradients/concat_grad/tuple/group_deps"/device:CPU:0*.
_class$
" loc:@gradients/concat_grad/Slice*
T0*0
_output_shapes
:����������
�
0gradients/concat_grad/tuple/control_dependency_1Identitygradients/concat_grad/Slice_1'^gradients/concat_grad/tuple/group_deps"/device:CPU:0*0
_class&
$"loc:@gradients/concat_grad/Slice_1*
T0*0
_output_shapes
:����������
�
0gradients/concat_grad/tuple/control_dependency_2Identitygradients/concat_grad/Slice_2'^gradients/concat_grad/tuple/group_deps"/device:CPU:0*0
_class&
$"loc:@gradients/concat_grad/Slice_2*
T0*0
_output_shapes
:����������
�
.gradients/conv-maxpool-3/pool_grad/MaxPoolGradMaxPoolGradconv-maxpool-3/reluconv-maxpool-3/pool.gradients/concat_grad/tuple/control_dependency"/device:CPU:0*1
_output_shapes
:�����������*
data_formatNHWC*
paddingVALID*
strides
*
ksize	
�*
T0
�
.gradients/conv-maxpool-4/pool_grad/MaxPoolGradMaxPoolGradconv-maxpool-4/reluconv-maxpool-4/pool0gradients/concat_grad/tuple/control_dependency_1"/device:CPU:0*1
_output_shapes
:�����������*
data_formatNHWC*
paddingVALID*
strides
*
ksize	
�*
T0
�
.gradients/conv-maxpool-5/pool_grad/MaxPoolGradMaxPoolGradconv-maxpool-5/reluconv-maxpool-5/pool0gradients/concat_grad/tuple/control_dependency_2"/device:CPU:0*1
_output_shapes
:�����������*
data_formatNHWC*
paddingVALID*
strides
*
ksize	
�*
T0
�
+gradients/conv-maxpool-3/relu_grad/ReluGradReluGrad.gradients/conv-maxpool-3/pool_grad/MaxPoolGradconv-maxpool-3/relu"/device:CPU:0*
T0*1
_output_shapes
:�����������
�
+gradients/conv-maxpool-4/relu_grad/ReluGradReluGrad.gradients/conv-maxpool-4/pool_grad/MaxPoolGradconv-maxpool-4/relu"/device:CPU:0*
T0*1
_output_shapes
:�����������
�
+gradients/conv-maxpool-5/relu_grad/ReluGradReluGrad.gradients/conv-maxpool-5/pool_grad/MaxPoolGradconv-maxpool-5/relu"/device:CPU:0*
T0*1
_output_shapes
:�����������
�
1gradients/conv-maxpool-3/BiasAdd_grad/BiasAddGradBiasAddGrad+gradients/conv-maxpool-3/relu_grad/ReluGrad"/device:CPU:0*
_output_shapes	
:�*
T0*
data_formatNHWC
�
6gradients/conv-maxpool-3/BiasAdd_grad/tuple/group_depsNoOp,^gradients/conv-maxpool-3/relu_grad/ReluGrad2^gradients/conv-maxpool-3/BiasAdd_grad/BiasAddGrad"/device:CPU:0
�
>gradients/conv-maxpool-3/BiasAdd_grad/tuple/control_dependencyIdentity+gradients/conv-maxpool-3/relu_grad/ReluGrad7^gradients/conv-maxpool-3/BiasAdd_grad/tuple/group_deps"/device:CPU:0*>
_class4
20loc:@gradients/conv-maxpool-3/relu_grad/ReluGrad*
T0*1
_output_shapes
:�����������
�
@gradients/conv-maxpool-3/BiasAdd_grad/tuple/control_dependency_1Identity1gradients/conv-maxpool-3/BiasAdd_grad/BiasAddGrad7^gradients/conv-maxpool-3/BiasAdd_grad/tuple/group_deps"/device:CPU:0*D
_class:
86loc:@gradients/conv-maxpool-3/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes	
:�
�
1gradients/conv-maxpool-4/BiasAdd_grad/BiasAddGradBiasAddGrad+gradients/conv-maxpool-4/relu_grad/ReluGrad"/device:CPU:0*
_output_shapes	
:�*
T0*
data_formatNHWC
�
6gradients/conv-maxpool-4/BiasAdd_grad/tuple/group_depsNoOp,^gradients/conv-maxpool-4/relu_grad/ReluGrad2^gradients/conv-maxpool-4/BiasAdd_grad/BiasAddGrad"/device:CPU:0
�
>gradients/conv-maxpool-4/BiasAdd_grad/tuple/control_dependencyIdentity+gradients/conv-maxpool-4/relu_grad/ReluGrad7^gradients/conv-maxpool-4/BiasAdd_grad/tuple/group_deps"/device:CPU:0*>
_class4
20loc:@gradients/conv-maxpool-4/relu_grad/ReluGrad*
T0*1
_output_shapes
:�����������
�
@gradients/conv-maxpool-4/BiasAdd_grad/tuple/control_dependency_1Identity1gradients/conv-maxpool-4/BiasAdd_grad/BiasAddGrad7^gradients/conv-maxpool-4/BiasAdd_grad/tuple/group_deps"/device:CPU:0*D
_class:
86loc:@gradients/conv-maxpool-4/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes	
:�
�
1gradients/conv-maxpool-5/BiasAdd_grad/BiasAddGradBiasAddGrad+gradients/conv-maxpool-5/relu_grad/ReluGrad"/device:CPU:0*
_output_shapes	
:�*
T0*
data_formatNHWC
�
6gradients/conv-maxpool-5/BiasAdd_grad/tuple/group_depsNoOp,^gradients/conv-maxpool-5/relu_grad/ReluGrad2^gradients/conv-maxpool-5/BiasAdd_grad/BiasAddGrad"/device:CPU:0
�
>gradients/conv-maxpool-5/BiasAdd_grad/tuple/control_dependencyIdentity+gradients/conv-maxpool-5/relu_grad/ReluGrad7^gradients/conv-maxpool-5/BiasAdd_grad/tuple/group_deps"/device:CPU:0*>
_class4
20loc:@gradients/conv-maxpool-5/relu_grad/ReluGrad*
T0*1
_output_shapes
:�����������
�
@gradients/conv-maxpool-5/BiasAdd_grad/tuple/control_dependency_1Identity1gradients/conv-maxpool-5/BiasAdd_grad/BiasAddGrad7^gradients/conv-maxpool-5/BiasAdd_grad/tuple/group_deps"/device:CPU:0*D
_class:
86loc:@gradients/conv-maxpool-5/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes	
:�
�
(gradients/conv-maxpool-3/conv_grad/ShapeShapeembedding/ExpandDims"/device:CPU:0*
out_type0*
T0*
_output_shapes
:
�
6gradients/conv-maxpool-3/conv_grad/Conv2DBackpropInputConv2DBackpropInput(gradients/conv-maxpool-3/conv_grad/Shapeconv-maxpool-3/W_conv/read>gradients/conv-maxpool-3/BiasAdd_grad/tuple/control_dependency"/device:CPU:0*J
_output_shapes8
6:4������������������������������������*
data_formatNHWC*
use_cudnn_on_gpu(*
paddingVALID*
strides
*
T0
�
*gradients/conv-maxpool-3/conv_grad/Shape_1Const"/device:CPU:0*
dtype0*%
valueB"   �      �   *
_output_shapes
:
�
7gradients/conv-maxpool-3/conv_grad/Conv2DBackpropFilterConv2DBackpropFilterembedding/ExpandDims*gradients/conv-maxpool-3/conv_grad/Shape_1>gradients/conv-maxpool-3/BiasAdd_grad/tuple/control_dependency"/device:CPU:0*(
_output_shapes
:��*
data_formatNHWC*
use_cudnn_on_gpu(*
paddingVALID*
strides
*
T0
�
3gradients/conv-maxpool-3/conv_grad/tuple/group_depsNoOp7^gradients/conv-maxpool-3/conv_grad/Conv2DBackpropInput8^gradients/conv-maxpool-3/conv_grad/Conv2DBackpropFilter"/device:CPU:0
�
;gradients/conv-maxpool-3/conv_grad/tuple/control_dependencyIdentity6gradients/conv-maxpool-3/conv_grad/Conv2DBackpropInput4^gradients/conv-maxpool-3/conv_grad/tuple/group_deps"/device:CPU:0*I
_class?
=;loc:@gradients/conv-maxpool-3/conv_grad/Conv2DBackpropInput*
T0*1
_output_shapes
:�����������
�
=gradients/conv-maxpool-3/conv_grad/tuple/control_dependency_1Identity7gradients/conv-maxpool-3/conv_grad/Conv2DBackpropFilter4^gradients/conv-maxpool-3/conv_grad/tuple/group_deps"/device:CPU:0*J
_class@
><loc:@gradients/conv-maxpool-3/conv_grad/Conv2DBackpropFilter*
T0*(
_output_shapes
:��
�
(gradients/conv-maxpool-4/conv_grad/ShapeShapeembedding/ExpandDims"/device:CPU:0*
out_type0*
T0*
_output_shapes
:
�
6gradients/conv-maxpool-4/conv_grad/Conv2DBackpropInputConv2DBackpropInput(gradients/conv-maxpool-4/conv_grad/Shapeconv-maxpool-4/W_conv/read>gradients/conv-maxpool-4/BiasAdd_grad/tuple/control_dependency"/device:CPU:0*J
_output_shapes8
6:4������������������������������������*
data_formatNHWC*
use_cudnn_on_gpu(*
paddingVALID*
strides
*
T0
�
*gradients/conv-maxpool-4/conv_grad/Shape_1Const"/device:CPU:0*
dtype0*%
valueB"   �      �   *
_output_shapes
:
�
7gradients/conv-maxpool-4/conv_grad/Conv2DBackpropFilterConv2DBackpropFilterembedding/ExpandDims*gradients/conv-maxpool-4/conv_grad/Shape_1>gradients/conv-maxpool-4/BiasAdd_grad/tuple/control_dependency"/device:CPU:0*(
_output_shapes
:��*
data_formatNHWC*
use_cudnn_on_gpu(*
paddingVALID*
strides
*
T0
�
3gradients/conv-maxpool-4/conv_grad/tuple/group_depsNoOp7^gradients/conv-maxpool-4/conv_grad/Conv2DBackpropInput8^gradients/conv-maxpool-4/conv_grad/Conv2DBackpropFilter"/device:CPU:0
�
;gradients/conv-maxpool-4/conv_grad/tuple/control_dependencyIdentity6gradients/conv-maxpool-4/conv_grad/Conv2DBackpropInput4^gradients/conv-maxpool-4/conv_grad/tuple/group_deps"/device:CPU:0*I
_class?
=;loc:@gradients/conv-maxpool-4/conv_grad/Conv2DBackpropInput*
T0*1
_output_shapes
:�����������
�
=gradients/conv-maxpool-4/conv_grad/tuple/control_dependency_1Identity7gradients/conv-maxpool-4/conv_grad/Conv2DBackpropFilter4^gradients/conv-maxpool-4/conv_grad/tuple/group_deps"/device:CPU:0*J
_class@
><loc:@gradients/conv-maxpool-4/conv_grad/Conv2DBackpropFilter*
T0*(
_output_shapes
:��
�
(gradients/conv-maxpool-5/conv_grad/ShapeShapeembedding/ExpandDims"/device:CPU:0*
out_type0*
T0*
_output_shapes
:
�
6gradients/conv-maxpool-5/conv_grad/Conv2DBackpropInputConv2DBackpropInput(gradients/conv-maxpool-5/conv_grad/Shapeconv-maxpool-5/W_conv/read>gradients/conv-maxpool-5/BiasAdd_grad/tuple/control_dependency"/device:CPU:0*J
_output_shapes8
6:4������������������������������������*
data_formatNHWC*
use_cudnn_on_gpu(*
paddingVALID*
strides
*
T0
�
*gradients/conv-maxpool-5/conv_grad/Shape_1Const"/device:CPU:0*
dtype0*%
valueB"   �      �   *
_output_shapes
:
�
7gradients/conv-maxpool-5/conv_grad/Conv2DBackpropFilterConv2DBackpropFilterembedding/ExpandDims*gradients/conv-maxpool-5/conv_grad/Shape_1>gradients/conv-maxpool-5/BiasAdd_grad/tuple/control_dependency"/device:CPU:0*(
_output_shapes
:��*
data_formatNHWC*
use_cudnn_on_gpu(*
paddingVALID*
strides
*
T0
�
3gradients/conv-maxpool-5/conv_grad/tuple/group_depsNoOp7^gradients/conv-maxpool-5/conv_grad/Conv2DBackpropInput8^gradients/conv-maxpool-5/conv_grad/Conv2DBackpropFilter"/device:CPU:0
�
;gradients/conv-maxpool-5/conv_grad/tuple/control_dependencyIdentity6gradients/conv-maxpool-5/conv_grad/Conv2DBackpropInput4^gradients/conv-maxpool-5/conv_grad/tuple/group_deps"/device:CPU:0*I
_class?
=;loc:@gradients/conv-maxpool-5/conv_grad/Conv2DBackpropInput*
T0*1
_output_shapes
:�����������
�
=gradients/conv-maxpool-5/conv_grad/tuple/control_dependency_1Identity7gradients/conv-maxpool-5/conv_grad/Conv2DBackpropFilter4^gradients/conv-maxpool-5/conv_grad/tuple/group_deps"/device:CPU:0*J
_class@
><loc:@gradients/conv-maxpool-5/conv_grad/Conv2DBackpropFilter*
T0*(
_output_shapes
:��
�
gradients/AddNAddN;gradients/conv-maxpool-3/conv_grad/tuple/control_dependency;gradients/conv-maxpool-4/conv_grad/tuple/control_dependency;gradients/conv-maxpool-5/conv_grad/tuple/control_dependency"/device:CPU:0*I
_class?
=;loc:@gradients/conv-maxpool-3/conv_grad/Conv2DBackpropInput*
T0*1
_output_shapes
:�����������*
N
�
)gradients/embedding/ExpandDims_grad/ShapeShapeembedding/embedding_lookup"/device:CPU:0*
out_type0*
T0*
_output_shapes
:
�
+gradients/embedding/ExpandDims_grad/ReshapeReshapegradients/AddN)gradients/embedding/ExpandDims_grad/Shape"/device:CPU:0*-
_output_shapes
:�����������*
T0*
Tshape0
�
/gradients/embedding/embedding_lookup_grad/ShapeConst"/device:CPU:0*
dtype0	*-
_class#
!loc:@embedding/embedding_matrix*%
valueB	"	"      �       *
_output_shapes
:
�
1gradients/embedding/embedding_lookup_grad/ToInt32Cast/gradients/embedding/embedding_lookup_grad/Shape"/device:CPU:0*

DstT0*-
_class#
!loc:@embedding/embedding_matrix*

SrcT0	*
_output_shapes
:

.gradients/embedding/embedding_lookup_grad/SizeSizedata_in"/device:CPU:0*
out_type0*
T0*
_output_shapes
: 
�
8gradients/embedding/embedding_lookup_grad/ExpandDims/dimConst"/device:CPU:0*
dtype0*
value	B : *
_output_shapes
: 
�
4gradients/embedding/embedding_lookup_grad/ExpandDims
ExpandDims.gradients/embedding/embedding_lookup_grad/Size8gradients/embedding/embedding_lookup_grad/ExpandDims/dim"/device:CPU:0*

Tdim0*
T0*
_output_shapes
:
�
=gradients/embedding/embedding_lookup_grad/strided_slice/stackConst"/device:CPU:0*
dtype0*
valueB:*
_output_shapes
:
�
?gradients/embedding/embedding_lookup_grad/strided_slice/stack_1Const"/device:CPU:0*
dtype0*
valueB: *
_output_shapes
:
�
?gradients/embedding/embedding_lookup_grad/strided_slice/stack_2Const"/device:CPU:0*
dtype0*
valueB:*
_output_shapes
:
�
7gradients/embedding/embedding_lookup_grad/strided_sliceStridedSlice1gradients/embedding/embedding_lookup_grad/ToInt32=gradients/embedding/embedding_lookup_grad/strided_slice/stack?gradients/embedding/embedding_lookup_grad/strided_slice/stack_1?gradients/embedding/embedding_lookup_grad/strided_slice/stack_2"/device:CPU:0*
new_axis_mask *
Index0*
_output_shapes
:*

begin_mask *
ellipsis_mask *
end_mask*
T0*
shrink_axis_mask 
�
5gradients/embedding/embedding_lookup_grad/concat/axisConst"/device:CPU:0*
dtype0*
value	B : *
_output_shapes
: 
�
0gradients/embedding/embedding_lookup_grad/concatConcatV24gradients/embedding/embedding_lookup_grad/ExpandDims7gradients/embedding/embedding_lookup_grad/strided_slice5gradients/embedding/embedding_lookup_grad/concat/axis"/device:CPU:0*
N*

Tidx0*
_output_shapes
:*
T0
�
1gradients/embedding/embedding_lookup_grad/ReshapeReshape+gradients/embedding/ExpandDims_grad/Reshape0gradients/embedding/embedding_lookup_grad/concat"/device:CPU:0*(
_output_shapes
:����������*
T0*
Tshape0
�
3gradients/embedding/embedding_lookup_grad/Reshape_1Reshapedata_in4gradients/embedding/embedding_lookup_grad/ExpandDims"/device:CPU:0*#
_output_shapes
:���������*
T0*
Tshape0
�
beta1_power/initial_valueConst"/device:CPU:0*
dtype0*(
_class
loc:@conv-maxpool-3/W_conv*
valueB
 *fff?*
_output_shapes
: 
�
beta1_power
VariableV2"/device:CPU:0*
	container *
_output_shapes
: *
dtype0*
shape: *(
_class
loc:@conv-maxpool-3/W_conv*
shared_name 
�
beta1_power/AssignAssignbeta1_powerbeta1_power/initial_value"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-3/W_conv*
use_locking(*
T0*
_output_shapes
: 
�
beta1_power/readIdentitybeta1_power"/device:CPU:0*(
_class
loc:@conv-maxpool-3/W_conv*
T0*
_output_shapes
: 
�
beta2_power/initial_valueConst"/device:CPU:0*
dtype0*(
_class
loc:@conv-maxpool-3/W_conv*
valueB
 *w�?*
_output_shapes
: 
�
beta2_power
VariableV2"/device:CPU:0*
	container *
_output_shapes
: *
dtype0*
shape: *(
_class
loc:@conv-maxpool-3/W_conv*
shared_name 
�
beta2_power/AssignAssignbeta2_powerbeta2_power/initial_value"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-3/W_conv*
use_locking(*
T0*
_output_shapes
: 
�
beta2_power/readIdentitybeta2_power"/device:CPU:0*(
_class
loc:@conv-maxpool-3/W_conv*
T0*
_output_shapes
: 
�
1embedding/embedding_matrix/Adam/Initializer/zerosConst"/device:CPU:0*
dtype0*-
_class#
!loc:@embedding/embedding_matrix*
valueB
�D�*    * 
_output_shapes
:
�D�
�
embedding/embedding_matrix/Adam
VariableV2"/device:CPU:0*
	container * 
_output_shapes
:
�D�*
dtype0*
shape:
�D�*-
_class#
!loc:@embedding/embedding_matrix*
shared_name 
�
&embedding/embedding_matrix/Adam/AssignAssignembedding/embedding_matrix/Adam1embedding/embedding_matrix/Adam/Initializer/zeros"/device:CPU:0*
validate_shape(*-
_class#
!loc:@embedding/embedding_matrix*
use_locking(*
T0* 
_output_shapes
:
�D�
�
$embedding/embedding_matrix/Adam/readIdentityembedding/embedding_matrix/Adam"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0* 
_output_shapes
:
�D�
�
3embedding/embedding_matrix/Adam_1/Initializer/zerosConst"/device:CPU:0*
dtype0*-
_class#
!loc:@embedding/embedding_matrix*
valueB
�D�*    * 
_output_shapes
:
�D�
�
!embedding/embedding_matrix/Adam_1
VariableV2"/device:CPU:0*
	container * 
_output_shapes
:
�D�*
dtype0*
shape:
�D�*-
_class#
!loc:@embedding/embedding_matrix*
shared_name 
�
(embedding/embedding_matrix/Adam_1/AssignAssign!embedding/embedding_matrix/Adam_13embedding/embedding_matrix/Adam_1/Initializer/zeros"/device:CPU:0*
validate_shape(*-
_class#
!loc:@embedding/embedding_matrix*
use_locking(*
T0* 
_output_shapes
:
�D�
�
&embedding/embedding_matrix/Adam_1/readIdentity!embedding/embedding_matrix/Adam_1"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0* 
_output_shapes
:
�D�
�
,conv-maxpool-3/W_conv/Adam/Initializer/zerosConst"/device:CPU:0*
dtype0*(
_class
loc:@conv-maxpool-3/W_conv*'
valueB��*    *(
_output_shapes
:��
�
conv-maxpool-3/W_conv/Adam
VariableV2"/device:CPU:0*
	container *(
_output_shapes
:��*
dtype0*
shape:��*(
_class
loc:@conv-maxpool-3/W_conv*
shared_name 
�
!conv-maxpool-3/W_conv/Adam/AssignAssignconv-maxpool-3/W_conv/Adam,conv-maxpool-3/W_conv/Adam/Initializer/zeros"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-3/W_conv*
use_locking(*
T0*(
_output_shapes
:��
�
conv-maxpool-3/W_conv/Adam/readIdentityconv-maxpool-3/W_conv/Adam"/device:CPU:0*(
_class
loc:@conv-maxpool-3/W_conv*
T0*(
_output_shapes
:��
�
.conv-maxpool-3/W_conv/Adam_1/Initializer/zerosConst"/device:CPU:0*
dtype0*(
_class
loc:@conv-maxpool-3/W_conv*'
valueB��*    *(
_output_shapes
:��
�
conv-maxpool-3/W_conv/Adam_1
VariableV2"/device:CPU:0*
	container *(
_output_shapes
:��*
dtype0*
shape:��*(
_class
loc:@conv-maxpool-3/W_conv*
shared_name 
�
#conv-maxpool-3/W_conv/Adam_1/AssignAssignconv-maxpool-3/W_conv/Adam_1.conv-maxpool-3/W_conv/Adam_1/Initializer/zeros"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-3/W_conv*
use_locking(*
T0*(
_output_shapes
:��
�
!conv-maxpool-3/W_conv/Adam_1/readIdentityconv-maxpool-3/W_conv/Adam_1"/device:CPU:0*(
_class
loc:@conv-maxpool-3/W_conv*
T0*(
_output_shapes
:��
�
,conv-maxpool-3/b_conv/Adam/Initializer/zerosConst"/device:CPU:0*
dtype0*(
_class
loc:@conv-maxpool-3/b_conv*
valueB�*    *
_output_shapes	
:�
�
conv-maxpool-3/b_conv/Adam
VariableV2"/device:CPU:0*
	container *
_output_shapes	
:�*
dtype0*
shape:�*(
_class
loc:@conv-maxpool-3/b_conv*
shared_name 
�
!conv-maxpool-3/b_conv/Adam/AssignAssignconv-maxpool-3/b_conv/Adam,conv-maxpool-3/b_conv/Adam/Initializer/zeros"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-3/b_conv*
use_locking(*
T0*
_output_shapes	
:�
�
conv-maxpool-3/b_conv/Adam/readIdentityconv-maxpool-3/b_conv/Adam"/device:CPU:0*(
_class
loc:@conv-maxpool-3/b_conv*
T0*
_output_shapes	
:�
�
.conv-maxpool-3/b_conv/Adam_1/Initializer/zerosConst"/device:CPU:0*
dtype0*(
_class
loc:@conv-maxpool-3/b_conv*
valueB�*    *
_output_shapes	
:�
�
conv-maxpool-3/b_conv/Adam_1
VariableV2"/device:CPU:0*
	container *
_output_shapes	
:�*
dtype0*
shape:�*(
_class
loc:@conv-maxpool-3/b_conv*
shared_name 
�
#conv-maxpool-3/b_conv/Adam_1/AssignAssignconv-maxpool-3/b_conv/Adam_1.conv-maxpool-3/b_conv/Adam_1/Initializer/zeros"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-3/b_conv*
use_locking(*
T0*
_output_shapes	
:�
�
!conv-maxpool-3/b_conv/Adam_1/readIdentityconv-maxpool-3/b_conv/Adam_1"/device:CPU:0*(
_class
loc:@conv-maxpool-3/b_conv*
T0*
_output_shapes	
:�
�
,conv-maxpool-4/W_conv/Adam/Initializer/zerosConst"/device:CPU:0*
dtype0*(
_class
loc:@conv-maxpool-4/W_conv*'
valueB��*    *(
_output_shapes
:��
�
conv-maxpool-4/W_conv/Adam
VariableV2"/device:CPU:0*
	container *(
_output_shapes
:��*
dtype0*
shape:��*(
_class
loc:@conv-maxpool-4/W_conv*
shared_name 
�
!conv-maxpool-4/W_conv/Adam/AssignAssignconv-maxpool-4/W_conv/Adam,conv-maxpool-4/W_conv/Adam/Initializer/zeros"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-4/W_conv*
use_locking(*
T0*(
_output_shapes
:��
�
conv-maxpool-4/W_conv/Adam/readIdentityconv-maxpool-4/W_conv/Adam"/device:CPU:0*(
_class
loc:@conv-maxpool-4/W_conv*
T0*(
_output_shapes
:��
�
.conv-maxpool-4/W_conv/Adam_1/Initializer/zerosConst"/device:CPU:0*
dtype0*(
_class
loc:@conv-maxpool-4/W_conv*'
valueB��*    *(
_output_shapes
:��
�
conv-maxpool-4/W_conv/Adam_1
VariableV2"/device:CPU:0*
	container *(
_output_shapes
:��*
dtype0*
shape:��*(
_class
loc:@conv-maxpool-4/W_conv*
shared_name 
�
#conv-maxpool-4/W_conv/Adam_1/AssignAssignconv-maxpool-4/W_conv/Adam_1.conv-maxpool-4/W_conv/Adam_1/Initializer/zeros"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-4/W_conv*
use_locking(*
T0*(
_output_shapes
:��
�
!conv-maxpool-4/W_conv/Adam_1/readIdentityconv-maxpool-4/W_conv/Adam_1"/device:CPU:0*(
_class
loc:@conv-maxpool-4/W_conv*
T0*(
_output_shapes
:��
�
,conv-maxpool-4/b_conv/Adam/Initializer/zerosConst"/device:CPU:0*
dtype0*(
_class
loc:@conv-maxpool-4/b_conv*
valueB�*    *
_output_shapes	
:�
�
conv-maxpool-4/b_conv/Adam
VariableV2"/device:CPU:0*
	container *
_output_shapes	
:�*
dtype0*
shape:�*(
_class
loc:@conv-maxpool-4/b_conv*
shared_name 
�
!conv-maxpool-4/b_conv/Adam/AssignAssignconv-maxpool-4/b_conv/Adam,conv-maxpool-4/b_conv/Adam/Initializer/zeros"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-4/b_conv*
use_locking(*
T0*
_output_shapes	
:�
�
conv-maxpool-4/b_conv/Adam/readIdentityconv-maxpool-4/b_conv/Adam"/device:CPU:0*(
_class
loc:@conv-maxpool-4/b_conv*
T0*
_output_shapes	
:�
�
.conv-maxpool-4/b_conv/Adam_1/Initializer/zerosConst"/device:CPU:0*
dtype0*(
_class
loc:@conv-maxpool-4/b_conv*
valueB�*    *
_output_shapes	
:�
�
conv-maxpool-4/b_conv/Adam_1
VariableV2"/device:CPU:0*
	container *
_output_shapes	
:�*
dtype0*
shape:�*(
_class
loc:@conv-maxpool-4/b_conv*
shared_name 
�
#conv-maxpool-4/b_conv/Adam_1/AssignAssignconv-maxpool-4/b_conv/Adam_1.conv-maxpool-4/b_conv/Adam_1/Initializer/zeros"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-4/b_conv*
use_locking(*
T0*
_output_shapes	
:�
�
!conv-maxpool-4/b_conv/Adam_1/readIdentityconv-maxpool-4/b_conv/Adam_1"/device:CPU:0*(
_class
loc:@conv-maxpool-4/b_conv*
T0*
_output_shapes	
:�
�
,conv-maxpool-5/W_conv/Adam/Initializer/zerosConst"/device:CPU:0*
dtype0*(
_class
loc:@conv-maxpool-5/W_conv*'
valueB��*    *(
_output_shapes
:��
�
conv-maxpool-5/W_conv/Adam
VariableV2"/device:CPU:0*
	container *(
_output_shapes
:��*
dtype0*
shape:��*(
_class
loc:@conv-maxpool-5/W_conv*
shared_name 
�
!conv-maxpool-5/W_conv/Adam/AssignAssignconv-maxpool-5/W_conv/Adam,conv-maxpool-5/W_conv/Adam/Initializer/zeros"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-5/W_conv*
use_locking(*
T0*(
_output_shapes
:��
�
conv-maxpool-5/W_conv/Adam/readIdentityconv-maxpool-5/W_conv/Adam"/device:CPU:0*(
_class
loc:@conv-maxpool-5/W_conv*
T0*(
_output_shapes
:��
�
.conv-maxpool-5/W_conv/Adam_1/Initializer/zerosConst"/device:CPU:0*
dtype0*(
_class
loc:@conv-maxpool-5/W_conv*'
valueB��*    *(
_output_shapes
:��
�
conv-maxpool-5/W_conv/Adam_1
VariableV2"/device:CPU:0*
	container *(
_output_shapes
:��*
dtype0*
shape:��*(
_class
loc:@conv-maxpool-5/W_conv*
shared_name 
�
#conv-maxpool-5/W_conv/Adam_1/AssignAssignconv-maxpool-5/W_conv/Adam_1.conv-maxpool-5/W_conv/Adam_1/Initializer/zeros"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-5/W_conv*
use_locking(*
T0*(
_output_shapes
:��
�
!conv-maxpool-5/W_conv/Adam_1/readIdentityconv-maxpool-5/W_conv/Adam_1"/device:CPU:0*(
_class
loc:@conv-maxpool-5/W_conv*
T0*(
_output_shapes
:��
�
,conv-maxpool-5/b_conv/Adam/Initializer/zerosConst"/device:CPU:0*
dtype0*(
_class
loc:@conv-maxpool-5/b_conv*
valueB�*    *
_output_shapes	
:�
�
conv-maxpool-5/b_conv/Adam
VariableV2"/device:CPU:0*
	container *
_output_shapes	
:�*
dtype0*
shape:�*(
_class
loc:@conv-maxpool-5/b_conv*
shared_name 
�
!conv-maxpool-5/b_conv/Adam/AssignAssignconv-maxpool-5/b_conv/Adam,conv-maxpool-5/b_conv/Adam/Initializer/zeros"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-5/b_conv*
use_locking(*
T0*
_output_shapes	
:�
�
conv-maxpool-5/b_conv/Adam/readIdentityconv-maxpool-5/b_conv/Adam"/device:CPU:0*(
_class
loc:@conv-maxpool-5/b_conv*
T0*
_output_shapes	
:�
�
.conv-maxpool-5/b_conv/Adam_1/Initializer/zerosConst"/device:CPU:0*
dtype0*(
_class
loc:@conv-maxpool-5/b_conv*
valueB�*    *
_output_shapes	
:�
�
conv-maxpool-5/b_conv/Adam_1
VariableV2"/device:CPU:0*
	container *
_output_shapes	
:�*
dtype0*
shape:�*(
_class
loc:@conv-maxpool-5/b_conv*
shared_name 
�
#conv-maxpool-5/b_conv/Adam_1/AssignAssignconv-maxpool-5/b_conv/Adam_1.conv-maxpool-5/b_conv/Adam_1/Initializer/zeros"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-5/b_conv*
use_locking(*
T0*
_output_shapes	
:�
�
!conv-maxpool-5/b_conv/Adam_1/readIdentityconv-maxpool-5/b_conv/Adam_1"/device:CPU:0*(
_class
loc:@conv-maxpool-5/b_conv*
T0*
_output_shapes	
:�
�
#output/W_out/Adam/Initializer/zerosConst"/device:CPU:0*
dtype0*
_class
loc:@output/W_out*
valueB	�*    *
_output_shapes
:	�
�
output/W_out/Adam
VariableV2"/device:CPU:0*
	container *
_output_shapes
:	�*
dtype0*
shape:	�*
_class
loc:@output/W_out*
shared_name 
�
output/W_out/Adam/AssignAssignoutput/W_out/Adam#output/W_out/Adam/Initializer/zeros"/device:CPU:0*
validate_shape(*
_class
loc:@output/W_out*
use_locking(*
T0*
_output_shapes
:	�
�
output/W_out/Adam/readIdentityoutput/W_out/Adam"/device:CPU:0*
_class
loc:@output/W_out*
T0*
_output_shapes
:	�
�
%output/W_out/Adam_1/Initializer/zerosConst"/device:CPU:0*
dtype0*
_class
loc:@output/W_out*
valueB	�*    *
_output_shapes
:	�
�
output/W_out/Adam_1
VariableV2"/device:CPU:0*
	container *
_output_shapes
:	�*
dtype0*
shape:	�*
_class
loc:@output/W_out*
shared_name 
�
output/W_out/Adam_1/AssignAssignoutput/W_out/Adam_1%output/W_out/Adam_1/Initializer/zeros"/device:CPU:0*
validate_shape(*
_class
loc:@output/W_out*
use_locking(*
T0*
_output_shapes
:	�
�
output/W_out/Adam_1/readIdentityoutput/W_out/Adam_1"/device:CPU:0*
_class
loc:@output/W_out*
T0*
_output_shapes
:	�
�
#output/b_out/Adam/Initializer/zerosConst"/device:CPU:0*
dtype0*
_class
loc:@output/b_out*
valueB*    *
_output_shapes
:
�
output/b_out/Adam
VariableV2"/device:CPU:0*
	container *
_output_shapes
:*
dtype0*
shape:*
_class
loc:@output/b_out*
shared_name 
�
output/b_out/Adam/AssignAssignoutput/b_out/Adam#output/b_out/Adam/Initializer/zeros"/device:CPU:0*
validate_shape(*
_class
loc:@output/b_out*
use_locking(*
T0*
_output_shapes
:
�
output/b_out/Adam/readIdentityoutput/b_out/Adam"/device:CPU:0*
_class
loc:@output/b_out*
T0*
_output_shapes
:
�
%output/b_out/Adam_1/Initializer/zerosConst"/device:CPU:0*
dtype0*
_class
loc:@output/b_out*
valueB*    *
_output_shapes
:
�
output/b_out/Adam_1
VariableV2"/device:CPU:0*
	container *
_output_shapes
:*
dtype0*
shape:*
_class
loc:@output/b_out*
shared_name 
�
output/b_out/Adam_1/AssignAssignoutput/b_out/Adam_1%output/b_out/Adam_1/Initializer/zeros"/device:CPU:0*
validate_shape(*
_class
loc:@output/b_out*
use_locking(*
T0*
_output_shapes
:
�
output/b_out/Adam_1/readIdentityoutput/b_out/Adam_1"/device:CPU:0*
_class
loc:@output/b_out*
T0*
_output_shapes
:
f
Adam/learning_rateConst"/device:CPU:0*
dtype0*
valueB
 *��8*
_output_shapes
: 
^

Adam/beta1Const"/device:CPU:0*
dtype0*
valueB
 *fff?*
_output_shapes
: 
^

Adam/beta2Const"/device:CPU:0*
dtype0*
valueB
 *w�?*
_output_shapes
: 
`
Adam/epsilonConst"/device:CPU:0*
dtype0*
valueB
 *w�+2*
_output_shapes
: 
�
-Adam/update_embedding/embedding_matrix/UniqueUnique3gradients/embedding/embedding_lookup_grad/Reshape_1"/device:CPU:0*
out_idx0*
T0*2
_output_shapes 
:���������:���������*-
_class#
!loc:@embedding/embedding_matrix
�
,Adam/update_embedding/embedding_matrix/ShapeShape-Adam/update_embedding/embedding_matrix/Unique"/device:CPU:0*
out_type0*
T0*
_output_shapes
:*-
_class#
!loc:@embedding/embedding_matrix
�
:Adam/update_embedding/embedding_matrix/strided_slice/stackConst"/device:CPU:0*
dtype0*-
_class#
!loc:@embedding/embedding_matrix*
valueB: *
_output_shapes
:
�
<Adam/update_embedding/embedding_matrix/strided_slice/stack_1Const"/device:CPU:0*
dtype0*-
_class#
!loc:@embedding/embedding_matrix*
valueB:*
_output_shapes
:
�
<Adam/update_embedding/embedding_matrix/strided_slice/stack_2Const"/device:CPU:0*
dtype0*-
_class#
!loc:@embedding/embedding_matrix*
valueB:*
_output_shapes
:
�
4Adam/update_embedding/embedding_matrix/strided_sliceStridedSlice,Adam/update_embedding/embedding_matrix/Shape:Adam/update_embedding/embedding_matrix/strided_slice/stack<Adam/update_embedding/embedding_matrix/strided_slice/stack_1<Adam/update_embedding/embedding_matrix/strided_slice/stack_2"/device:CPU:0*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask*-
_class#
!loc:@embedding/embedding_matrix
�
9Adam/update_embedding/embedding_matrix/UnsortedSegmentSumUnsortedSegmentSum1gradients/embedding/embedding_lookup_grad/Reshape/Adam/update_embedding/embedding_matrix/Unique:14Adam/update_embedding/embedding_matrix/strided_slice"/device:CPU:0*
Tindices0*
T0*(
_output_shapes
:����������*-
_class#
!loc:@embedding/embedding_matrix
�
,Adam/update_embedding/embedding_matrix/sub/xConst"/device:CPU:0*
dtype0*-
_class#
!loc:@embedding/embedding_matrix*
valueB
 *  �?*
_output_shapes
: 
�
*Adam/update_embedding/embedding_matrix/subSub,Adam/update_embedding/embedding_matrix/sub/xbeta2_power/read"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0*
_output_shapes
: 
�
+Adam/update_embedding/embedding_matrix/SqrtSqrt*Adam/update_embedding/embedding_matrix/sub"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0*
_output_shapes
: 
�
*Adam/update_embedding/embedding_matrix/mulMulAdam/learning_rate+Adam/update_embedding/embedding_matrix/Sqrt"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0*
_output_shapes
: 
�
.Adam/update_embedding/embedding_matrix/sub_1/xConst"/device:CPU:0*
dtype0*-
_class#
!loc:@embedding/embedding_matrix*
valueB
 *  �?*
_output_shapes
: 
�
,Adam/update_embedding/embedding_matrix/sub_1Sub.Adam/update_embedding/embedding_matrix/sub_1/xbeta1_power/read"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0*
_output_shapes
: 
�
.Adam/update_embedding/embedding_matrix/truedivRealDiv*Adam/update_embedding/embedding_matrix/mul,Adam/update_embedding/embedding_matrix/sub_1"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0*
_output_shapes
: 
�
.Adam/update_embedding/embedding_matrix/sub_2/xConst"/device:CPU:0*
dtype0*-
_class#
!loc:@embedding/embedding_matrix*
valueB
 *  �?*
_output_shapes
: 
�
,Adam/update_embedding/embedding_matrix/sub_2Sub.Adam/update_embedding/embedding_matrix/sub_2/x
Adam/beta1"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0*
_output_shapes
: 
�
,Adam/update_embedding/embedding_matrix/mul_1Mul9Adam/update_embedding/embedding_matrix/UnsortedSegmentSum,Adam/update_embedding/embedding_matrix/sub_2"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0*(
_output_shapes
:����������
�
,Adam/update_embedding/embedding_matrix/mul_2Mul$embedding/embedding_matrix/Adam/read
Adam/beta1"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0* 
_output_shapes
:
�D�
�
-Adam/update_embedding/embedding_matrix/AssignAssignembedding/embedding_matrix/Adam,Adam/update_embedding/embedding_matrix/mul_2"/device:CPU:0*
validate_shape(*-
_class#
!loc:@embedding/embedding_matrix*
use_locking( *
T0* 
_output_shapes
:
�D�
�
1Adam/update_embedding/embedding_matrix/ScatterAdd
ScatterAddembedding/embedding_matrix/Adam-Adam/update_embedding/embedding_matrix/Unique,Adam/update_embedding/embedding_matrix/mul_1.^Adam/update_embedding/embedding_matrix/Assign"/device:CPU:0*
Tindices0*
use_locking( *
T0* 
_output_shapes
:
�D�*-
_class#
!loc:@embedding/embedding_matrix
�
,Adam/update_embedding/embedding_matrix/mul_3Mul9Adam/update_embedding/embedding_matrix/UnsortedSegmentSum9Adam/update_embedding/embedding_matrix/UnsortedSegmentSum"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0*(
_output_shapes
:����������
�
.Adam/update_embedding/embedding_matrix/sub_3/xConst"/device:CPU:0*
dtype0*-
_class#
!loc:@embedding/embedding_matrix*
valueB
 *  �?*
_output_shapes
: 
�
,Adam/update_embedding/embedding_matrix/sub_3Sub.Adam/update_embedding/embedding_matrix/sub_3/x
Adam/beta2"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0*
_output_shapes
: 
�
,Adam/update_embedding/embedding_matrix/mul_4Mul,Adam/update_embedding/embedding_matrix/mul_3,Adam/update_embedding/embedding_matrix/sub_3"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0*(
_output_shapes
:����������
�
,Adam/update_embedding/embedding_matrix/mul_5Mul&embedding/embedding_matrix/Adam_1/read
Adam/beta2"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0* 
_output_shapes
:
�D�
�
/Adam/update_embedding/embedding_matrix/Assign_1Assign!embedding/embedding_matrix/Adam_1,Adam/update_embedding/embedding_matrix/mul_5"/device:CPU:0*
validate_shape(*-
_class#
!loc:@embedding/embedding_matrix*
use_locking( *
T0* 
_output_shapes
:
�D�
�
3Adam/update_embedding/embedding_matrix/ScatterAdd_1
ScatterAdd!embedding/embedding_matrix/Adam_1-Adam/update_embedding/embedding_matrix/Unique,Adam/update_embedding/embedding_matrix/mul_40^Adam/update_embedding/embedding_matrix/Assign_1"/device:CPU:0*
Tindices0*
use_locking( *
T0* 
_output_shapes
:
�D�*-
_class#
!loc:@embedding/embedding_matrix
�
-Adam/update_embedding/embedding_matrix/Sqrt_1Sqrt3Adam/update_embedding/embedding_matrix/ScatterAdd_1"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0* 
_output_shapes
:
�D�
�
,Adam/update_embedding/embedding_matrix/mul_6Mul.Adam/update_embedding/embedding_matrix/truediv1Adam/update_embedding/embedding_matrix/ScatterAdd"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0* 
_output_shapes
:
�D�
�
*Adam/update_embedding/embedding_matrix/addAdd-Adam/update_embedding/embedding_matrix/Sqrt_1Adam/epsilon"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0* 
_output_shapes
:
�D�
�
0Adam/update_embedding/embedding_matrix/truediv_1RealDiv,Adam/update_embedding/embedding_matrix/mul_6*Adam/update_embedding/embedding_matrix/add"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0* 
_output_shapes
:
�D�
�
0Adam/update_embedding/embedding_matrix/AssignSub	AssignSubembedding/embedding_matrix0Adam/update_embedding/embedding_matrix/truediv_1"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
use_locking( *
T0* 
_output_shapes
:
�D�
�
1Adam/update_embedding/embedding_matrix/group_depsNoOp1^Adam/update_embedding/embedding_matrix/AssignSub2^Adam/update_embedding/embedding_matrix/ScatterAdd4^Adam/update_embedding/embedding_matrix/ScatterAdd_1"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix
�
+Adam/update_conv-maxpool-3/W_conv/ApplyAdam	ApplyAdamconv-maxpool-3/W_convconv-maxpool-3/W_conv/Adamconv-maxpool-3/W_conv/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon=gradients/conv-maxpool-3/conv_grad/tuple/control_dependency_1"/device:CPU:0*
use_nesterov( *(
_class
loc:@conv-maxpool-3/W_conv*
use_locking( *
T0*(
_output_shapes
:��
�
+Adam/update_conv-maxpool-3/b_conv/ApplyAdam	ApplyAdamconv-maxpool-3/b_convconv-maxpool-3/b_conv/Adamconv-maxpool-3/b_conv/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon@gradients/conv-maxpool-3/BiasAdd_grad/tuple/control_dependency_1"/device:CPU:0*
use_nesterov( *(
_class
loc:@conv-maxpool-3/b_conv*
use_locking( *
T0*
_output_shapes	
:�
�
+Adam/update_conv-maxpool-4/W_conv/ApplyAdam	ApplyAdamconv-maxpool-4/W_convconv-maxpool-4/W_conv/Adamconv-maxpool-4/W_conv/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon=gradients/conv-maxpool-4/conv_grad/tuple/control_dependency_1"/device:CPU:0*
use_nesterov( *(
_class
loc:@conv-maxpool-4/W_conv*
use_locking( *
T0*(
_output_shapes
:��
�
+Adam/update_conv-maxpool-4/b_conv/ApplyAdam	ApplyAdamconv-maxpool-4/b_convconv-maxpool-4/b_conv/Adamconv-maxpool-4/b_conv/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon@gradients/conv-maxpool-4/BiasAdd_grad/tuple/control_dependency_1"/device:CPU:0*
use_nesterov( *(
_class
loc:@conv-maxpool-4/b_conv*
use_locking( *
T0*
_output_shapes	
:�
�
+Adam/update_conv-maxpool-5/W_conv/ApplyAdam	ApplyAdamconv-maxpool-5/W_convconv-maxpool-5/W_conv/Adamconv-maxpool-5/W_conv/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon=gradients/conv-maxpool-5/conv_grad/tuple/control_dependency_1"/device:CPU:0*
use_nesterov( *(
_class
loc:@conv-maxpool-5/W_conv*
use_locking( *
T0*(
_output_shapes
:��
�
+Adam/update_conv-maxpool-5/b_conv/ApplyAdam	ApplyAdamconv-maxpool-5/b_convconv-maxpool-5/b_conv/Adamconv-maxpool-5/b_conv/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon@gradients/conv-maxpool-5/BiasAdd_grad/tuple/control_dependency_1"/device:CPU:0*
use_nesterov( *(
_class
loc:@conv-maxpool-5/b_conv*
use_locking( *
T0*
_output_shapes	
:�
�
"Adam/update_output/W_out/ApplyAdam	ApplyAdamoutput/W_outoutput/W_out/Adamoutput/W_out/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon7gradients/output/MatMul_grad/tuple/control_dependency_1"/device:CPU:0*
use_nesterov( *
_class
loc:@output/W_out*
use_locking( *
T0*
_output_shapes
:	�
�
"Adam/update_output/b_out/ApplyAdam	ApplyAdamoutput/b_outoutput/b_out/Adamoutput/b_out/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon4gradients/output/add_grad/tuple/control_dependency_1"/device:CPU:0*
use_nesterov( *
_class
loc:@output/b_out*
use_locking( *
T0*
_output_shapes
:
�
Adam/mulMulbeta1_power/read
Adam/beta12^Adam/update_embedding/embedding_matrix/group_deps,^Adam/update_conv-maxpool-3/W_conv/ApplyAdam,^Adam/update_conv-maxpool-3/b_conv/ApplyAdam,^Adam/update_conv-maxpool-4/W_conv/ApplyAdam,^Adam/update_conv-maxpool-4/b_conv/ApplyAdam,^Adam/update_conv-maxpool-5/W_conv/ApplyAdam,^Adam/update_conv-maxpool-5/b_conv/ApplyAdam#^Adam/update_output/W_out/ApplyAdam#^Adam/update_output/b_out/ApplyAdam"/device:CPU:0*(
_class
loc:@conv-maxpool-3/W_conv*
T0*
_output_shapes
: 
�
Adam/AssignAssignbeta1_powerAdam/mul"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-3/W_conv*
use_locking( *
T0*
_output_shapes
: 
�

Adam/mul_1Mulbeta2_power/read
Adam/beta22^Adam/update_embedding/embedding_matrix/group_deps,^Adam/update_conv-maxpool-3/W_conv/ApplyAdam,^Adam/update_conv-maxpool-3/b_conv/ApplyAdam,^Adam/update_conv-maxpool-4/W_conv/ApplyAdam,^Adam/update_conv-maxpool-4/b_conv/ApplyAdam,^Adam/update_conv-maxpool-5/W_conv/ApplyAdam,^Adam/update_conv-maxpool-5/b_conv/ApplyAdam#^Adam/update_output/W_out/ApplyAdam#^Adam/update_output/b_out/ApplyAdam"/device:CPU:0*(
_class
loc:@conv-maxpool-3/W_conv*
T0*
_output_shapes
: 
�
Adam/Assign_1Assignbeta2_power
Adam/mul_1"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-3/W_conv*
use_locking( *
T0*
_output_shapes
: 
�
AdamNoOp2^Adam/update_embedding/embedding_matrix/group_deps,^Adam/update_conv-maxpool-3/W_conv/ApplyAdam,^Adam/update_conv-maxpool-3/b_conv/ApplyAdam,^Adam/update_conv-maxpool-4/W_conv/ApplyAdam,^Adam/update_conv-maxpool-4/b_conv/ApplyAdam,^Adam/update_conv-maxpool-5/W_conv/ApplyAdam,^Adam/update_conv-maxpool-5/b_conv/ApplyAdam#^Adam/update_output/W_out/ApplyAdam#^Adam/update_output/b_out/ApplyAdam^Adam/Assign^Adam/Assign_1"/device:CPU:0
a
ArgMax/dimensionConst"/device:CPU:0*
dtype0*
value	B :*
_output_shapes
: 
�
ArgMaxArgMaxoutput/SoftmaxArgMax/dimension"/device:CPU:0*
output_type0	*#
_output_shapes
:���������*
T0*

Tidx0
c
ArgMax_1/dimensionConst"/device:CPU:0*
dtype0*
value	B :*
_output_shapes
: 
�
ArgMax_1ArgMaxdata_outArgMax_1/dimension"/device:CPU:0*
output_type0	*#
_output_shapes
:���������*
T0*

Tidx0
]
EqualEqualArgMaxArgMax_1"/device:CPU:0*
T0	*#
_output_shapes
:���������
_
CastCastEqual"/device:CPU:0*

DstT0*

SrcT0
*#
_output_shapes
:���������
`
Const_1Const"/device:CPU:0*
dtype0*
valueB: *
_output_shapes
:
h
MeanMeanCastConst_1"/device:CPU:0*
_output_shapes
: *
T0*
	keep_dims( *

Tidx0
I
RankRankPlaceholder"/device:CPU:0*
T0*
_output_shapes
: 
\
range/startConst"/device:CPU:0*
dtype0*
value	B : *
_output_shapes
: 
\
range/deltaConst"/device:CPU:0*
dtype0*
value	B :*
_output_shapes
: 
n
rangeRangerange/startRankrange/delta"/device:CPU:0*

Tidx0*#
_output_shapes
:���������
q
Mean_1MeanPlaceholderrange"/device:CPU:0*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0
M
Rank_1RankPlaceholder_1"/device:CPU:0*
T0*
_output_shapes
: 
^
range_1/startConst"/device:CPU:0*
dtype0*
value	B : *
_output_shapes
: 
^
range_1/deltaConst"/device:CPU:0*
dtype0*
value	B :*
_output_shapes
: 
v
range_1Rangerange_1/startRank_1range_1/delta"/device:CPU:0*

Tidx0*#
_output_shapes
:���������
u
Mean_2MeanPlaceholder_1range_1"/device:CPU:0*
_output_shapes
:*
T0*
	keep_dims( *

Tidx0
�
initNoOp"^embedding/embedding_matrix/Assign^conv-maxpool-3/W_conv/Assign^conv-maxpool-3/b_conv/Assign^conv-maxpool-4/W_conv/Assign^conv-maxpool-4/b_conv/Assign^conv-maxpool-5/W_conv/Assign^conv-maxpool-5/b_conv/Assign^output/W_out/Assign^output/b_out/Assign^beta1_power/Assign^beta2_power/Assign'^embedding/embedding_matrix/Adam/Assign)^embedding/embedding_matrix/Adam_1/Assign"^conv-maxpool-3/W_conv/Adam/Assign$^conv-maxpool-3/W_conv/Adam_1/Assign"^conv-maxpool-3/b_conv/Adam/Assign$^conv-maxpool-3/b_conv/Adam_1/Assign"^conv-maxpool-4/W_conv/Adam/Assign$^conv-maxpool-4/W_conv/Adam_1/Assign"^conv-maxpool-4/b_conv/Adam/Assign$^conv-maxpool-4/b_conv/Adam_1/Assign"^conv-maxpool-5/W_conv/Adam/Assign$^conv-maxpool-5/W_conv/Adam_1/Assign"^conv-maxpool-5/b_conv/Adam/Assign$^conv-maxpool-5/b_conv/Adam_1/Assign^output/W_out/Adam/Assign^output/W_out/Adam_1/Assign^output/b_out/Adam/Assign^output/b_out/Adam_1/Assign"/device:CPU:0
`
Training_loss/tagsConst*
dtype0*
valueB BTraining_loss*
_output_shapes
: 
X
Training_lossScalarSummaryTraining_loss/tagsNeg*
T0*
_output_shapes
: 
d
Validation_loss/tagsConst*
dtype0* 
valueB BValidation_loss*
_output_shapes
: 
_
Validation_lossScalarSummaryValidation_loss/tagsMean_2*
T0*
_output_shapes
: 
l
Validation_accuracy/tagsConst*
dtype0*$
valueB BValidation_accuracy*
_output_shapes
: 
g
Validation_accuracyScalarSummaryValidation_accuracy/tagsMean_1*
T0*
_output_shapes
: "4y��}\     ��#	����4��AJ�
�.�-
9
Add
x"T
y"T
z"T"
Ttype:
2	
S
AddN
inputs"T*N
sum"T"
Nint(0"
Ttype:
2	��
�
	ApplyAdam
var"T�	
m"T�	
v"T�
beta1_power"T
beta2_power"T
lr"T

beta1"T

beta2"T
epsilon"T	
grad"T
out"T�"
Ttype:
2	"
use_lockingbool( "
use_nesterovbool( 
�
ArgMax

input"T
	dimension"Tidx
output"output_type"
Ttype:
2	"
Tidxtype0:
2	"
output_typetype0	:
2	
x
Assign
ref"T�

value"T

output_ref"T�"	
Ttype"
validate_shapebool("
use_lockingbool(�
p
	AssignSub
ref"T�

value"T

output_ref"T�"
Ttype:
2	"
use_lockingbool( 
{
BiasAdd

value"T	
bias"T
output"T"
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
{
BiasAddGrad
out_backprop"T
output"T"
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
R
BroadcastGradientArgs
s0"T
s1"T
r0"T
r1"T"
Ttype0:
2	
8
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype
I
ConcatOffset

concat_dim
shape*N
offset*N"
Nint(0
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
�
Conv2D

input"T
filter"T
output"T"
Ttype:
2"
strides	list(int)"
use_cudnn_on_gpubool(""
paddingstring:
SAMEVALID"-
data_formatstringNHWC:
NHWCNCHW
�
Conv2DBackpropFilter

input"T
filter_sizes
out_backprop"T
output"T"
Ttype:
2"
strides	list(int)"
use_cudnn_on_gpubool(""
paddingstring:
SAMEVALID"-
data_formatstringNHWC:
NHWCNCHW
�
Conv2DBackpropInput
input_sizes
filter"T
out_backprop"T
output"T"
Ttype:
2"
strides	list(int)"
use_cudnn_on_gpubool(""
paddingstring:
SAMEVALID"-
data_formatstringNHWC:
NHWCNCHW
A
Equal
x"T
y"T
z
"
Ttype:
2	
�
W

ExpandDims

input"T
dim"Tdim
output"T"	
Ttype"
Tdimtype0:
2	
4
Fill
dims

value"T
output"T"	
Ttype
+
Floor
x"T
y"T"
Ttype:
2
7
FloorMod
x"T
y"T
z"T"
Ttype:
2	
�
Gather
params"Tparams
indices"Tindices
output"Tparams"
validate_indicesbool("
Tparamstype"
Tindicestype:
2	
.
Identity

input"T
output"T"	
Ttype
+
Log
x"T
y"T"
Ttype:	
2
o
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2
�
MaxPool

input"T
output"T"
Ttype0:
2		"
ksize	list(int)(0"
strides	list(int)(0""
paddingstring:
SAMEVALID"-
data_formatstringNHWC:
NHWCNCHW
�
MaxPoolGrad

orig_input"T
orig_output"T	
grad"T
output"T"
ksize	list(int)(0"
strides	list(int)(0""
paddingstring:
SAMEVALID"-
data_formatstringNHWC:
NHWCNCHW"
Ttype0:
2		
�
Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
<
Mul
x"T
y"T
z"T"
Ttype:
2	�
-
Neg
x"T
y"T"
Ttype:
	2	

NoOp
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
}
RandomUniform

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	�
`
Range
start"Tidx
limit"Tidx
delta"Tidx
output"Tidx"
Tidxtype0:
2	
)
Rank

input"T

output"	
Ttype
=
RealDiv
x"T
y"T
z"T"
Ttype:
2	
4

Reciprocal
x"T
y"T"
Ttype:
	2	
A
Relu
features"T
activations"T"
Ttype:
2		
S
ReluGrad
	gradients"T
features"T
	backprops"T"
Ttype:
2		
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
M
ScalarSummary
tags
values"T
summary"
Ttype:
2		
�

ScatterAdd
ref"T�
indices"Tindices
updates"T

output_ref"T�"
Ttype:
2	"
Tindicestype:
2	"
use_lockingbool( 
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
e
ShapeN
input"T*N
output"out_type*N"
Nint(0"	
Ttype"
out_typetype0:
2	
O
Size

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
a
Slice

input"T
begin"Index
size"Index
output"T"	
Ttype"
Indextype:
2	
8
Softmax
logits"T
softmax"T"
Ttype:
2
,
Sqrt
x"T
y"T"
Ttype:	
2
�
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
5
Sub
x"T
y"T
z"T"
Ttype:
	2	
�
Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
c
Tile

input"T
	multiples"
Tmultiples
output"T"	
Ttype"

Tmultiplestype0:
2	

TruncatedNormal

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	�
P
Unique
x"T
y"T
idx"out_idx"	
Ttype"
out_idxtype0:
2	
�
UnsortedSegmentSum	
data"T
segment_ids"Tindices
num_segments
output"T"
Ttype:
2	"
Tindicestype:
2	
s

VariableV2
ref"dtype�"
shapeshape"
dtypetype"
	containerstring "
shared_namestring �*1.3.02v1.3.0-rc2-20-g0787eee��
{
data_inPlaceholder"/device:CPU:0*
dtype0*
shape:����������*(
_output_shapes
:����������
z
data_outPlaceholder"/device:CPU:0*
dtype0*
shape:���������*'
_output_shapes
:���������
e
dropout_keep_probPlaceholder"/device:CPU:0*
dtype0*
shape:*
_output_shapes
:
_
PlaceholderPlaceholder"/device:CPU:0*
dtype0*
shape:*
_output_shapes
:
a
Placeholder_1Placeholder"/device:CPU:0*
dtype0*
shape:*
_output_shapes
:
~
embedding/random_uniform/shapeConst"/device:CPU:0*
dtype0*
valueB"	"  �   *
_output_shapes
:
p
embedding/random_uniform/minConst"/device:CPU:0*
dtype0*
valueB
 *  ��*
_output_shapes
: 
p
embedding/random_uniform/maxConst"/device:CPU:0*
dtype0*
valueB
 *  �?*
_output_shapes
: 
�
&embedding/random_uniform/RandomUniformRandomUniformembedding/random_uniform/shape"/device:CPU:0*
dtype0*
seed2 *

seed *
T0* 
_output_shapes
:
�D�
�
embedding/random_uniform/subSubembedding/random_uniform/maxembedding/random_uniform/min"/device:CPU:0*
T0*
_output_shapes
: 
�
embedding/random_uniform/mulMul&embedding/random_uniform/RandomUniformembedding/random_uniform/sub"/device:CPU:0*
T0* 
_output_shapes
:
�D�
�
embedding/random_uniformAddembedding/random_uniform/mulembedding/random_uniform/min"/device:CPU:0*
T0* 
_output_shapes
:
�D�
�
embedding/embedding_matrix
VariableV2"/device:CPU:0*
dtype0*
shape:
�D�*
shared_name *
	container * 
_output_shapes
:
�D�
�
!embedding/embedding_matrix/AssignAssignembedding/embedding_matrixembedding/random_uniform"/device:CPU:0*
validate_shape(*-
_class#
!loc:@embedding/embedding_matrix*
use_locking(*
T0* 
_output_shapes
:
�D�
�
embedding/embedding_matrix/readIdentityembedding/embedding_matrix"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0* 
_output_shapes
:
�D�
�
embedding/embedding_lookupGatherembedding/embedding_matrix/readdata_in"/device:CPU:0*
validate_indices(*
Tparams0*
Tindices0*-
_class#
!loc:@embedding/embedding_matrix*-
_output_shapes
:�����������
r
embedding/ExpandDims/dimConst"/device:CPU:0*
dtype0*
valueB :
���������*
_output_shapes
: 
�
embedding/ExpandDims
ExpandDimsembedding/embedding_lookupembedding/ExpandDims/dim"/device:CPU:0*

Tdim0*
T0*1
_output_shapes
:�����������
�
%conv-maxpool-3/truncated_normal/shapeConst"/device:CPU:0*
dtype0*%
valueB"   �      �   *
_output_shapes
:
x
$conv-maxpool-3/truncated_normal/meanConst"/device:CPU:0*
dtype0*
valueB
 *    *
_output_shapes
: 
z
&conv-maxpool-3/truncated_normal/stddevConst"/device:CPU:0*
dtype0*
valueB
 *���=*
_output_shapes
: 
�
/conv-maxpool-3/truncated_normal/TruncatedNormalTruncatedNormal%conv-maxpool-3/truncated_normal/shape"/device:CPU:0*
dtype0*
seed2 *

seed *
T0*(
_output_shapes
:��
�
#conv-maxpool-3/truncated_normal/mulMul/conv-maxpool-3/truncated_normal/TruncatedNormal&conv-maxpool-3/truncated_normal/stddev"/device:CPU:0*
T0*(
_output_shapes
:��
�
conv-maxpool-3/truncated_normalAdd#conv-maxpool-3/truncated_normal/mul$conv-maxpool-3/truncated_normal/mean"/device:CPU:0*
T0*(
_output_shapes
:��
�
conv-maxpool-3/W_conv
VariableV2"/device:CPU:0*
dtype0*
shape:��*
shared_name *
	container *(
_output_shapes
:��
�
conv-maxpool-3/W_conv/AssignAssignconv-maxpool-3/W_convconv-maxpool-3/truncated_normal"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-3/W_conv*
use_locking(*
T0*(
_output_shapes
:��
�
conv-maxpool-3/W_conv/readIdentityconv-maxpool-3/W_conv"/device:CPU:0*(
_class
loc:@conv-maxpool-3/W_conv*
T0*(
_output_shapes
:��
r
conv-maxpool-3/ConstConst"/device:CPU:0*
dtype0*
valueB�*���=*
_output_shapes	
:�
�
conv-maxpool-3/b_conv
VariableV2"/device:CPU:0*
dtype0*
shape:�*
shared_name *
	container *
_output_shapes	
:�
�
conv-maxpool-3/b_conv/AssignAssignconv-maxpool-3/b_convconv-maxpool-3/Const"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-3/b_conv*
use_locking(*
T0*
_output_shapes	
:�
�
conv-maxpool-3/b_conv/readIdentityconv-maxpool-3/b_conv"/device:CPU:0*(
_class
loc:@conv-maxpool-3/b_conv*
T0*
_output_shapes	
:�
�
conv-maxpool-3/convConv2Dembedding/ExpandDimsconv-maxpool-3/W_conv/read"/device:CPU:0*1
_output_shapes
:�����������*
data_formatNHWC*
use_cudnn_on_gpu(*
paddingVALID*
strides
*
T0
�
conv-maxpool-3/BiasAddBiasAddconv-maxpool-3/convconv-maxpool-3/b_conv/read"/device:CPU:0*
data_formatNHWC*
T0*1
_output_shapes
:�����������
~
conv-maxpool-3/reluReluconv-maxpool-3/BiasAdd"/device:CPU:0*
T0*1
_output_shapes
:�����������
�
conv-maxpool-3/poolMaxPoolconv-maxpool-3/relu"/device:CPU:0*0
_output_shapes
:����������*
data_formatNHWC*
paddingVALID*
strides
*
ksize	
�*
T0
�
%conv-maxpool-4/truncated_normal/shapeConst"/device:CPU:0*
dtype0*%
valueB"   �      �   *
_output_shapes
:
x
$conv-maxpool-4/truncated_normal/meanConst"/device:CPU:0*
dtype0*
valueB
 *    *
_output_shapes
: 
z
&conv-maxpool-4/truncated_normal/stddevConst"/device:CPU:0*
dtype0*
valueB
 *���=*
_output_shapes
: 
�
/conv-maxpool-4/truncated_normal/TruncatedNormalTruncatedNormal%conv-maxpool-4/truncated_normal/shape"/device:CPU:0*
dtype0*
seed2 *

seed *
T0*(
_output_shapes
:��
�
#conv-maxpool-4/truncated_normal/mulMul/conv-maxpool-4/truncated_normal/TruncatedNormal&conv-maxpool-4/truncated_normal/stddev"/device:CPU:0*
T0*(
_output_shapes
:��
�
conv-maxpool-4/truncated_normalAdd#conv-maxpool-4/truncated_normal/mul$conv-maxpool-4/truncated_normal/mean"/device:CPU:0*
T0*(
_output_shapes
:��
�
conv-maxpool-4/W_conv
VariableV2"/device:CPU:0*
dtype0*
shape:��*
shared_name *
	container *(
_output_shapes
:��
�
conv-maxpool-4/W_conv/AssignAssignconv-maxpool-4/W_convconv-maxpool-4/truncated_normal"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-4/W_conv*
use_locking(*
T0*(
_output_shapes
:��
�
conv-maxpool-4/W_conv/readIdentityconv-maxpool-4/W_conv"/device:CPU:0*(
_class
loc:@conv-maxpool-4/W_conv*
T0*(
_output_shapes
:��
r
conv-maxpool-4/ConstConst"/device:CPU:0*
dtype0*
valueB�*���=*
_output_shapes	
:�
�
conv-maxpool-4/b_conv
VariableV2"/device:CPU:0*
dtype0*
shape:�*
shared_name *
	container *
_output_shapes	
:�
�
conv-maxpool-4/b_conv/AssignAssignconv-maxpool-4/b_convconv-maxpool-4/Const"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-4/b_conv*
use_locking(*
T0*
_output_shapes	
:�
�
conv-maxpool-4/b_conv/readIdentityconv-maxpool-4/b_conv"/device:CPU:0*(
_class
loc:@conv-maxpool-4/b_conv*
T0*
_output_shapes	
:�
�
conv-maxpool-4/convConv2Dembedding/ExpandDimsconv-maxpool-4/W_conv/read"/device:CPU:0*1
_output_shapes
:�����������*
data_formatNHWC*
use_cudnn_on_gpu(*
paddingVALID*
strides
*
T0
�
conv-maxpool-4/BiasAddBiasAddconv-maxpool-4/convconv-maxpool-4/b_conv/read"/device:CPU:0*
data_formatNHWC*
T0*1
_output_shapes
:�����������
~
conv-maxpool-4/reluReluconv-maxpool-4/BiasAdd"/device:CPU:0*
T0*1
_output_shapes
:�����������
�
conv-maxpool-4/poolMaxPoolconv-maxpool-4/relu"/device:CPU:0*0
_output_shapes
:����������*
data_formatNHWC*
paddingVALID*
strides
*
ksize	
�*
T0
�
%conv-maxpool-5/truncated_normal/shapeConst"/device:CPU:0*
dtype0*%
valueB"   �      �   *
_output_shapes
:
x
$conv-maxpool-5/truncated_normal/meanConst"/device:CPU:0*
dtype0*
valueB
 *    *
_output_shapes
: 
z
&conv-maxpool-5/truncated_normal/stddevConst"/device:CPU:0*
dtype0*
valueB
 *���=*
_output_shapes
: 
�
/conv-maxpool-5/truncated_normal/TruncatedNormalTruncatedNormal%conv-maxpool-5/truncated_normal/shape"/device:CPU:0*
dtype0*
seed2 *

seed *
T0*(
_output_shapes
:��
�
#conv-maxpool-5/truncated_normal/mulMul/conv-maxpool-5/truncated_normal/TruncatedNormal&conv-maxpool-5/truncated_normal/stddev"/device:CPU:0*
T0*(
_output_shapes
:��
�
conv-maxpool-5/truncated_normalAdd#conv-maxpool-5/truncated_normal/mul$conv-maxpool-5/truncated_normal/mean"/device:CPU:0*
T0*(
_output_shapes
:��
�
conv-maxpool-5/W_conv
VariableV2"/device:CPU:0*
dtype0*
shape:��*
shared_name *
	container *(
_output_shapes
:��
�
conv-maxpool-5/W_conv/AssignAssignconv-maxpool-5/W_convconv-maxpool-5/truncated_normal"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-5/W_conv*
use_locking(*
T0*(
_output_shapes
:��
�
conv-maxpool-5/W_conv/readIdentityconv-maxpool-5/W_conv"/device:CPU:0*(
_class
loc:@conv-maxpool-5/W_conv*
T0*(
_output_shapes
:��
r
conv-maxpool-5/ConstConst"/device:CPU:0*
dtype0*
valueB�*���=*
_output_shapes	
:�
�
conv-maxpool-5/b_conv
VariableV2"/device:CPU:0*
dtype0*
shape:�*
shared_name *
	container *
_output_shapes	
:�
�
conv-maxpool-5/b_conv/AssignAssignconv-maxpool-5/b_convconv-maxpool-5/Const"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-5/b_conv*
use_locking(*
T0*
_output_shapes	
:�
�
conv-maxpool-5/b_conv/readIdentityconv-maxpool-5/b_conv"/device:CPU:0*(
_class
loc:@conv-maxpool-5/b_conv*
T0*
_output_shapes	
:�
�
conv-maxpool-5/convConv2Dembedding/ExpandDimsconv-maxpool-5/W_conv/read"/device:CPU:0*1
_output_shapes
:�����������*
data_formatNHWC*
use_cudnn_on_gpu(*
paddingVALID*
strides
*
T0
�
conv-maxpool-5/BiasAddBiasAddconv-maxpool-5/convconv-maxpool-5/b_conv/read"/device:CPU:0*
data_formatNHWC*
T0*1
_output_shapes
:�����������
~
conv-maxpool-5/reluReluconv-maxpool-5/BiasAdd"/device:CPU:0*
T0*1
_output_shapes
:�����������
�
conv-maxpool-5/poolMaxPoolconv-maxpool-5/relu"/device:CPU:0*0
_output_shapes
:����������*
data_formatNHWC*
paddingVALID*
strides
*
ksize	
�*
T0
\
concat/axisConst"/device:CPU:0*
dtype0*
value	B :*
_output_shapes
: 
�
concatConcatV2conv-maxpool-3/poolconv-maxpool-4/poolconv-maxpool-5/poolconcat/axis"/device:CPU:0*0
_output_shapes
:����������*

Tidx0*
T0*
N
m
Reshape/shapeConst"/device:CPU:0*
dtype0*
valueB"�����  *
_output_shapes
:
y
ReshapeReshapeconcatReshape/shape"/device:CPU:0*
Tshape0*
T0*(
_output_shapes
:����������
k
dropout/dropout/ShapeShapeReshape"/device:CPU:0*
out_type0*
T0*
_output_shapes
:
v
"dropout/dropout/random_uniform/minConst"/device:CPU:0*
dtype0*
valueB
 *    *
_output_shapes
: 
v
"dropout/dropout/random_uniform/maxConst"/device:CPU:0*
dtype0*
valueB
 *  �?*
_output_shapes
: 
�
,dropout/dropout/random_uniform/RandomUniformRandomUniformdropout/dropout/Shape"/device:CPU:0*
dtype0*
seed2 *

seed *
T0*(
_output_shapes
:����������
�
"dropout/dropout/random_uniform/subSub"dropout/dropout/random_uniform/max"dropout/dropout/random_uniform/min"/device:CPU:0*
T0*
_output_shapes
: 
�
"dropout/dropout/random_uniform/mulMul,dropout/dropout/random_uniform/RandomUniform"dropout/dropout/random_uniform/sub"/device:CPU:0*
T0*(
_output_shapes
:����������
�
dropout/dropout/random_uniformAdd"dropout/dropout/random_uniform/mul"dropout/dropout/random_uniform/min"/device:CPU:0*
T0*(
_output_shapes
:����������

dropout/dropout/addAdddropout_keep_probdropout/dropout/random_uniform"/device:CPU:0*
T0*
_output_shapes
:
e
dropout/dropout/FloorFloordropout/dropout/add"/device:CPU:0*
T0*
_output_shapes
:
l
dropout/dropout/divRealDivReshapedropout_keep_prob"/device:CPU:0*
T0*
_output_shapes
:
�
dropout/dropout/mulMuldropout/dropout/divdropout/dropout/Floor"/device:CPU:0*
T0*(
_output_shapes
:����������
}
output/truncated_normal/shapeConst"/device:CPU:0*
dtype0*
valueB"�     *
_output_shapes
:
p
output/truncated_normal/meanConst"/device:CPU:0*
dtype0*
valueB
 *    *
_output_shapes
: 
r
output/truncated_normal/stddevConst"/device:CPU:0*
dtype0*
valueB
 *���=*
_output_shapes
: 
�
'output/truncated_normal/TruncatedNormalTruncatedNormaloutput/truncated_normal/shape"/device:CPU:0*
dtype0*
seed2 *

seed *
T0*
_output_shapes
:	�
�
output/truncated_normal/mulMul'output/truncated_normal/TruncatedNormaloutput/truncated_normal/stddev"/device:CPU:0*
T0*
_output_shapes
:	�
�
output/truncated_normalAddoutput/truncated_normal/muloutput/truncated_normal/mean"/device:CPU:0*
T0*
_output_shapes
:	�
�
output/W_out
VariableV2"/device:CPU:0*
dtype0*
shape:	�*
shared_name *
	container *
_output_shapes
:	�
�
output/W_out/AssignAssignoutput/W_outoutput/truncated_normal"/device:CPU:0*
validate_shape(*
_class
loc:@output/W_out*
use_locking(*
T0*
_output_shapes
:	�
�
output/W_out/readIdentityoutput/W_out"/device:CPU:0*
_class
loc:@output/W_out*
T0*
_output_shapes
:	�
h
output/ConstConst"/device:CPU:0*
dtype0*
valueB*���=*
_output_shapes
:
�
output/b_out
VariableV2"/device:CPU:0*
dtype0*
shape:*
shared_name *
	container *
_output_shapes
:
�
output/b_out/AssignAssignoutput/b_outoutput/Const"/device:CPU:0*
validate_shape(*
_class
loc:@output/b_out*
use_locking(*
T0*
_output_shapes
:
�
output/b_out/readIdentityoutput/b_out"/device:CPU:0*
_class
loc:@output/b_out*
T0*
_output_shapes
:
�
output/MatMulMatMuldropout/dropout/muloutput/W_out/read"/device:CPU:0*
transpose_b( *
transpose_a( *
T0*'
_output_shapes
:���������
t

output/addAddoutput/MatMuloutput/b_out/read"/device:CPU:0*
T0*'
_output_shapes
:���������
f
output/SoftmaxSoftmax
output/add"/device:CPU:0*
T0*'
_output_shapes
:���������
[
LogLogoutput/Softmax"/device:CPU:0*
T0*'
_output_shapes
:���������
Z
mulMuldata_outLog"/device:CPU:0*
T0*'
_output_shapes
:���������
e
ConstConst"/device:CPU:0*
dtype0*
valueB"       *
_output_shapes
:
c
SumSummulConst"/device:CPU:0*

Tidx0*
T0*
	keep_dims( *
_output_shapes
: 
?
NegNegSum"/device:CPU:0*
T0*
_output_shapes
: 
a
gradients/ShapeConst"/device:CPU:0*
dtype0*
valueB *
_output_shapes
: 
c
gradients/ConstConst"/device:CPU:0*
dtype0*
valueB
 *  �?*
_output_shapes
: 
h
gradients/FillFillgradients/Shapegradients/Const"/device:CPU:0*
T0*
_output_shapes
: 
]
gradients/Neg_grad/NegNeggradients/Fill"/device:CPU:0*
T0*
_output_shapes
: 
�
 gradients/Sum_grad/Reshape/shapeConst"/device:CPU:0*
dtype0*
valueB"      *
_output_shapes
:
�
gradients/Sum_grad/ReshapeReshapegradients/Neg_grad/Neg gradients/Sum_grad/Reshape/shape"/device:CPU:0*
Tshape0*
T0*
_output_shapes

:
j
gradients/Sum_grad/ShapeShapemul"/device:CPU:0*
out_type0*
T0*
_output_shapes
:
�
gradients/Sum_grad/TileTilegradients/Sum_grad/Reshapegradients/Sum_grad/Shape"/device:CPU:0*

Tmultiples0*
T0*'
_output_shapes
:���������
o
gradients/mul_grad/ShapeShapedata_out"/device:CPU:0*
out_type0*
T0*
_output_shapes
:
l
gradients/mul_grad/Shape_1ShapeLog"/device:CPU:0*
out_type0*
T0*
_output_shapes
:
�
(gradients/mul_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/mul_grad/Shapegradients/mul_grad/Shape_1"/device:CPU:0*
T0*2
_output_shapes 
:���������:���������
|
gradients/mul_grad/mulMulgradients/Sum_grad/TileLog"/device:CPU:0*
T0*'
_output_shapes
:���������
�
gradients/mul_grad/SumSumgradients/mul_grad/mul(gradients/mul_grad/BroadcastGradientArgs"/device:CPU:0*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:
�
gradients/mul_grad/ReshapeReshapegradients/mul_grad/Sumgradients/mul_grad/Shape"/device:CPU:0*
Tshape0*
T0*'
_output_shapes
:���������
�
gradients/mul_grad/mul_1Muldata_outgradients/Sum_grad/Tile"/device:CPU:0*
T0*'
_output_shapes
:���������
�
gradients/mul_grad/Sum_1Sumgradients/mul_grad/mul_1*gradients/mul_grad/BroadcastGradientArgs:1"/device:CPU:0*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:
�
gradients/mul_grad/Reshape_1Reshapegradients/mul_grad/Sum_1gradients/mul_grad/Shape_1"/device:CPU:0*
Tshape0*
T0*'
_output_shapes
:���������
v
#gradients/mul_grad/tuple/group_depsNoOp^gradients/mul_grad/Reshape^gradients/mul_grad/Reshape_1"/device:CPU:0
�
+gradients/mul_grad/tuple/control_dependencyIdentitygradients/mul_grad/Reshape$^gradients/mul_grad/tuple/group_deps"/device:CPU:0*-
_class#
!loc:@gradients/mul_grad/Reshape*
T0*'
_output_shapes
:���������
�
-gradients/mul_grad/tuple/control_dependency_1Identitygradients/mul_grad/Reshape_1$^gradients/mul_grad/tuple/group_deps"/device:CPU:0*/
_class%
#!loc:@gradients/mul_grad/Reshape_1*
T0*'
_output_shapes
:���������
�
gradients/Log_grad/Reciprocal
Reciprocaloutput/Softmax.^gradients/mul_grad/tuple/control_dependency_1"/device:CPU:0*
T0*'
_output_shapes
:���������
�
gradients/Log_grad/mulMul-gradients/mul_grad/tuple/control_dependency_1gradients/Log_grad/Reciprocal"/device:CPU:0*
T0*'
_output_shapes
:���������
�
!gradients/output/Softmax_grad/mulMulgradients/Log_grad/muloutput/Softmax"/device:CPU:0*
T0*'
_output_shapes
:���������
�
3gradients/output/Softmax_grad/Sum/reduction_indicesConst"/device:CPU:0*
dtype0*
valueB:*
_output_shapes
:
�
!gradients/output/Softmax_grad/SumSum!gradients/output/Softmax_grad/mul3gradients/output/Softmax_grad/Sum/reduction_indices"/device:CPU:0*

Tidx0*
T0*
	keep_dims( *#
_output_shapes
:���������
�
+gradients/output/Softmax_grad/Reshape/shapeConst"/device:CPU:0*
dtype0*
valueB"����   *
_output_shapes
:
�
%gradients/output/Softmax_grad/ReshapeReshape!gradients/output/Softmax_grad/Sum+gradients/output/Softmax_grad/Reshape/shape"/device:CPU:0*
Tshape0*
T0*'
_output_shapes
:���������
�
!gradients/output/Softmax_grad/subSubgradients/Log_grad/mul%gradients/output/Softmax_grad/Reshape"/device:CPU:0*
T0*'
_output_shapes
:���������
�
#gradients/output/Softmax_grad/mul_1Mul!gradients/output/Softmax_grad/suboutput/Softmax"/device:CPU:0*
T0*'
_output_shapes
:���������
{
gradients/output/add_grad/ShapeShapeoutput/MatMul"/device:CPU:0*
out_type0*
T0*
_output_shapes
:
z
!gradients/output/add_grad/Shape_1Const"/device:CPU:0*
dtype0*
valueB:*
_output_shapes
:
�
/gradients/output/add_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/output/add_grad/Shape!gradients/output/add_grad/Shape_1"/device:CPU:0*
T0*2
_output_shapes 
:���������:���������
�
gradients/output/add_grad/SumSum#gradients/output/Softmax_grad/mul_1/gradients/output/add_grad/BroadcastGradientArgs"/device:CPU:0*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:
�
!gradients/output/add_grad/ReshapeReshapegradients/output/add_grad/Sumgradients/output/add_grad/Shape"/device:CPU:0*
Tshape0*
T0*'
_output_shapes
:���������
�
gradients/output/add_grad/Sum_1Sum#gradients/output/Softmax_grad/mul_11gradients/output/add_grad/BroadcastGradientArgs:1"/device:CPU:0*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:
�
#gradients/output/add_grad/Reshape_1Reshapegradients/output/add_grad/Sum_1!gradients/output/add_grad/Shape_1"/device:CPU:0*
Tshape0*
T0*
_output_shapes
:
�
*gradients/output/add_grad/tuple/group_depsNoOp"^gradients/output/add_grad/Reshape$^gradients/output/add_grad/Reshape_1"/device:CPU:0
�
2gradients/output/add_grad/tuple/control_dependencyIdentity!gradients/output/add_grad/Reshape+^gradients/output/add_grad/tuple/group_deps"/device:CPU:0*4
_class*
(&loc:@gradients/output/add_grad/Reshape*
T0*'
_output_shapes
:���������
�
4gradients/output/add_grad/tuple/control_dependency_1Identity#gradients/output/add_grad/Reshape_1+^gradients/output/add_grad/tuple/group_deps"/device:CPU:0*6
_class,
*(loc:@gradients/output/add_grad/Reshape_1*
T0*
_output_shapes
:
�
#gradients/output/MatMul_grad/MatMulMatMul2gradients/output/add_grad/tuple/control_dependencyoutput/W_out/read"/device:CPU:0*
transpose_b(*
transpose_a( *
T0*(
_output_shapes
:����������
�
%gradients/output/MatMul_grad/MatMul_1MatMuldropout/dropout/mul2gradients/output/add_grad/tuple/control_dependency"/device:CPU:0*
transpose_b( *
transpose_a(*
T0*
_output_shapes
:	�
�
-gradients/output/MatMul_grad/tuple/group_depsNoOp$^gradients/output/MatMul_grad/MatMul&^gradients/output/MatMul_grad/MatMul_1"/device:CPU:0
�
5gradients/output/MatMul_grad/tuple/control_dependencyIdentity#gradients/output/MatMul_grad/MatMul.^gradients/output/MatMul_grad/tuple/group_deps"/device:CPU:0*6
_class,
*(loc:@gradients/output/MatMul_grad/MatMul*
T0*(
_output_shapes
:����������
�
7gradients/output/MatMul_grad/tuple/control_dependency_1Identity%gradients/output/MatMul_grad/MatMul_1.^gradients/output/MatMul_grad/tuple/group_deps"/device:CPU:0*8
_class.
,*loc:@gradients/output/MatMul_grad/MatMul_1*
T0*
_output_shapes
:	�
�
(gradients/dropout/dropout/mul_grad/ShapeShapedropout/dropout/div"/device:CPU:0*
out_type0*
T0*#
_output_shapes
:���������
�
*gradients/dropout/dropout/mul_grad/Shape_1Shapedropout/dropout/Floor"/device:CPU:0*
out_type0*
T0*#
_output_shapes
:���������
�
8gradients/dropout/dropout/mul_grad/BroadcastGradientArgsBroadcastGradientArgs(gradients/dropout/dropout/mul_grad/Shape*gradients/dropout/dropout/mul_grad/Shape_1"/device:CPU:0*
T0*2
_output_shapes 
:���������:���������
�
&gradients/dropout/dropout/mul_grad/mulMul5gradients/output/MatMul_grad/tuple/control_dependencydropout/dropout/Floor"/device:CPU:0*
T0*
_output_shapes
:
�
&gradients/dropout/dropout/mul_grad/SumSum&gradients/dropout/dropout/mul_grad/mul8gradients/dropout/dropout/mul_grad/BroadcastGradientArgs"/device:CPU:0*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:
�
*gradients/dropout/dropout/mul_grad/ReshapeReshape&gradients/dropout/dropout/mul_grad/Sum(gradients/dropout/dropout/mul_grad/Shape"/device:CPU:0*
Tshape0*
T0*
_output_shapes
:
�
(gradients/dropout/dropout/mul_grad/mul_1Muldropout/dropout/div5gradients/output/MatMul_grad/tuple/control_dependency"/device:CPU:0*
T0*
_output_shapes
:
�
(gradients/dropout/dropout/mul_grad/Sum_1Sum(gradients/dropout/dropout/mul_grad/mul_1:gradients/dropout/dropout/mul_grad/BroadcastGradientArgs:1"/device:CPU:0*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:
�
,gradients/dropout/dropout/mul_grad/Reshape_1Reshape(gradients/dropout/dropout/mul_grad/Sum_1*gradients/dropout/dropout/mul_grad/Shape_1"/device:CPU:0*
Tshape0*
T0*
_output_shapes
:
�
3gradients/dropout/dropout/mul_grad/tuple/group_depsNoOp+^gradients/dropout/dropout/mul_grad/Reshape-^gradients/dropout/dropout/mul_grad/Reshape_1"/device:CPU:0
�
;gradients/dropout/dropout/mul_grad/tuple/control_dependencyIdentity*gradients/dropout/dropout/mul_grad/Reshape4^gradients/dropout/dropout/mul_grad/tuple/group_deps"/device:CPU:0*=
_class3
1/loc:@gradients/dropout/dropout/mul_grad/Reshape*
T0*
_output_shapes
:
�
=gradients/dropout/dropout/mul_grad/tuple/control_dependency_1Identity,gradients/dropout/dropout/mul_grad/Reshape_14^gradients/dropout/dropout/mul_grad/tuple/group_deps"/device:CPU:0*?
_class5
31loc:@gradients/dropout/dropout/mul_grad/Reshape_1*
T0*
_output_shapes
:
~
(gradients/dropout/dropout/div_grad/ShapeShapeReshape"/device:CPU:0*
out_type0*
T0*
_output_shapes
:
�
*gradients/dropout/dropout/div_grad/Shape_1Shapedropout_keep_prob"/device:CPU:0*
out_type0*
T0*#
_output_shapes
:���������
�
8gradients/dropout/dropout/div_grad/BroadcastGradientArgsBroadcastGradientArgs(gradients/dropout/dropout/div_grad/Shape*gradients/dropout/dropout/div_grad/Shape_1"/device:CPU:0*
T0*2
_output_shapes 
:���������:���������
�
*gradients/dropout/dropout/div_grad/RealDivRealDiv;gradients/dropout/dropout/mul_grad/tuple/control_dependencydropout_keep_prob"/device:CPU:0*
T0*
_output_shapes
:
�
&gradients/dropout/dropout/div_grad/SumSum*gradients/dropout/dropout/div_grad/RealDiv8gradients/dropout/dropout/div_grad/BroadcastGradientArgs"/device:CPU:0*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:
�
*gradients/dropout/dropout/div_grad/ReshapeReshape&gradients/dropout/dropout/div_grad/Sum(gradients/dropout/dropout/div_grad/Shape"/device:CPU:0*
Tshape0*
T0*(
_output_shapes
:����������
x
&gradients/dropout/dropout/div_grad/NegNegReshape"/device:CPU:0*
T0*(
_output_shapes
:����������
�
,gradients/dropout/dropout/div_grad/RealDiv_1RealDiv&gradients/dropout/dropout/div_grad/Negdropout_keep_prob"/device:CPU:0*
T0*
_output_shapes
:
�
,gradients/dropout/dropout/div_grad/RealDiv_2RealDiv,gradients/dropout/dropout/div_grad/RealDiv_1dropout_keep_prob"/device:CPU:0*
T0*
_output_shapes
:
�
&gradients/dropout/dropout/div_grad/mulMul;gradients/dropout/dropout/mul_grad/tuple/control_dependency,gradients/dropout/dropout/div_grad/RealDiv_2"/device:CPU:0*
T0*
_output_shapes
:
�
(gradients/dropout/dropout/div_grad/Sum_1Sum&gradients/dropout/dropout/div_grad/mul:gradients/dropout/dropout/div_grad/BroadcastGradientArgs:1"/device:CPU:0*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:
�
,gradients/dropout/dropout/div_grad/Reshape_1Reshape(gradients/dropout/dropout/div_grad/Sum_1*gradients/dropout/dropout/div_grad/Shape_1"/device:CPU:0*
Tshape0*
T0*
_output_shapes
:
�
3gradients/dropout/dropout/div_grad/tuple/group_depsNoOp+^gradients/dropout/dropout/div_grad/Reshape-^gradients/dropout/dropout/div_grad/Reshape_1"/device:CPU:0
�
;gradients/dropout/dropout/div_grad/tuple/control_dependencyIdentity*gradients/dropout/dropout/div_grad/Reshape4^gradients/dropout/dropout/div_grad/tuple/group_deps"/device:CPU:0*=
_class3
1/loc:@gradients/dropout/dropout/div_grad/Reshape*
T0*(
_output_shapes
:����������
�
=gradients/dropout/dropout/div_grad/tuple/control_dependency_1Identity,gradients/dropout/dropout/div_grad/Reshape_14^gradients/dropout/dropout/div_grad/tuple/group_deps"/device:CPU:0*?
_class5
31loc:@gradients/dropout/dropout/div_grad/Reshape_1*
T0*
_output_shapes
:
q
gradients/Reshape_grad/ShapeShapeconcat"/device:CPU:0*
out_type0*
T0*
_output_shapes
:
�
gradients/Reshape_grad/ReshapeReshape;gradients/dropout/dropout/div_grad/tuple/control_dependencygradients/Reshape_grad/Shape"/device:CPU:0*
Tshape0*
T0*0
_output_shapes
:����������
k
gradients/concat_grad/RankConst"/device:CPU:0*
dtype0*
value	B :*
_output_shapes
: 
~
gradients/concat_grad/modFloorModconcat/axisgradients/concat_grad/Rank"/device:CPU:0*
T0*
_output_shapes
: 
}
gradients/concat_grad/ShapeShapeconv-maxpool-3/pool"/device:CPU:0*
out_type0*
T0*
_output_shapes
:
�
gradients/concat_grad/ShapeNShapeNconv-maxpool-3/poolconv-maxpool-4/poolconv-maxpool-5/pool"/device:CPU:0*
N*
out_type0*
T0*&
_output_shapes
:::
�
"gradients/concat_grad/ConcatOffsetConcatOffsetgradients/concat_grad/modgradients/concat_grad/ShapeNgradients/concat_grad/ShapeN:1gradients/concat_grad/ShapeN:2"/device:CPU:0*
N*&
_output_shapes
:::
�
gradients/concat_grad/SliceSlicegradients/Reshape_grad/Reshape"gradients/concat_grad/ConcatOffsetgradients/concat_grad/ShapeN"/device:CPU:0*
Index0*
T0*J
_output_shapes8
6:4������������������������������������
�
gradients/concat_grad/Slice_1Slicegradients/Reshape_grad/Reshape$gradients/concat_grad/ConcatOffset:1gradients/concat_grad/ShapeN:1"/device:CPU:0*
Index0*
T0*J
_output_shapes8
6:4������������������������������������
�
gradients/concat_grad/Slice_2Slicegradients/Reshape_grad/Reshape$gradients/concat_grad/ConcatOffset:2gradients/concat_grad/ShapeN:2"/device:CPU:0*
Index0*
T0*J
_output_shapes8
6:4������������������������������������
�
&gradients/concat_grad/tuple/group_depsNoOp^gradients/concat_grad/Slice^gradients/concat_grad/Slice_1^gradients/concat_grad/Slice_2"/device:CPU:0
�
.gradients/concat_grad/tuple/control_dependencyIdentitygradients/concat_grad/Slice'^gradients/concat_grad/tuple/group_deps"/device:CPU:0*.
_class$
" loc:@gradients/concat_grad/Slice*
T0*0
_output_shapes
:����������
�
0gradients/concat_grad/tuple/control_dependency_1Identitygradients/concat_grad/Slice_1'^gradients/concat_grad/tuple/group_deps"/device:CPU:0*0
_class&
$"loc:@gradients/concat_grad/Slice_1*
T0*0
_output_shapes
:����������
�
0gradients/concat_grad/tuple/control_dependency_2Identitygradients/concat_grad/Slice_2'^gradients/concat_grad/tuple/group_deps"/device:CPU:0*0
_class&
$"loc:@gradients/concat_grad/Slice_2*
T0*0
_output_shapes
:����������
�
.gradients/conv-maxpool-3/pool_grad/MaxPoolGradMaxPoolGradconv-maxpool-3/reluconv-maxpool-3/pool.gradients/concat_grad/tuple/control_dependency"/device:CPU:0*1
_output_shapes
:�����������*
data_formatNHWC*
paddingVALID*
strides
*
ksize	
�*
T0
�
.gradients/conv-maxpool-4/pool_grad/MaxPoolGradMaxPoolGradconv-maxpool-4/reluconv-maxpool-4/pool0gradients/concat_grad/tuple/control_dependency_1"/device:CPU:0*1
_output_shapes
:�����������*
data_formatNHWC*
paddingVALID*
strides
*
ksize	
�*
T0
�
.gradients/conv-maxpool-5/pool_grad/MaxPoolGradMaxPoolGradconv-maxpool-5/reluconv-maxpool-5/pool0gradients/concat_grad/tuple/control_dependency_2"/device:CPU:0*1
_output_shapes
:�����������*
data_formatNHWC*
paddingVALID*
strides
*
ksize	
�*
T0
�
+gradients/conv-maxpool-3/relu_grad/ReluGradReluGrad.gradients/conv-maxpool-3/pool_grad/MaxPoolGradconv-maxpool-3/relu"/device:CPU:0*
T0*1
_output_shapes
:�����������
�
+gradients/conv-maxpool-4/relu_grad/ReluGradReluGrad.gradients/conv-maxpool-4/pool_grad/MaxPoolGradconv-maxpool-4/relu"/device:CPU:0*
T0*1
_output_shapes
:�����������
�
+gradients/conv-maxpool-5/relu_grad/ReluGradReluGrad.gradients/conv-maxpool-5/pool_grad/MaxPoolGradconv-maxpool-5/relu"/device:CPU:0*
T0*1
_output_shapes
:�����������
�
1gradients/conv-maxpool-3/BiasAdd_grad/BiasAddGradBiasAddGrad+gradients/conv-maxpool-3/relu_grad/ReluGrad"/device:CPU:0*
data_formatNHWC*
T0*
_output_shapes	
:�
�
6gradients/conv-maxpool-3/BiasAdd_grad/tuple/group_depsNoOp,^gradients/conv-maxpool-3/relu_grad/ReluGrad2^gradients/conv-maxpool-3/BiasAdd_grad/BiasAddGrad"/device:CPU:0
�
>gradients/conv-maxpool-3/BiasAdd_grad/tuple/control_dependencyIdentity+gradients/conv-maxpool-3/relu_grad/ReluGrad7^gradients/conv-maxpool-3/BiasAdd_grad/tuple/group_deps"/device:CPU:0*>
_class4
20loc:@gradients/conv-maxpool-3/relu_grad/ReluGrad*
T0*1
_output_shapes
:�����������
�
@gradients/conv-maxpool-3/BiasAdd_grad/tuple/control_dependency_1Identity1gradients/conv-maxpool-3/BiasAdd_grad/BiasAddGrad7^gradients/conv-maxpool-3/BiasAdd_grad/tuple/group_deps"/device:CPU:0*D
_class:
86loc:@gradients/conv-maxpool-3/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes	
:�
�
1gradients/conv-maxpool-4/BiasAdd_grad/BiasAddGradBiasAddGrad+gradients/conv-maxpool-4/relu_grad/ReluGrad"/device:CPU:0*
data_formatNHWC*
T0*
_output_shapes	
:�
�
6gradients/conv-maxpool-4/BiasAdd_grad/tuple/group_depsNoOp,^gradients/conv-maxpool-4/relu_grad/ReluGrad2^gradients/conv-maxpool-4/BiasAdd_grad/BiasAddGrad"/device:CPU:0
�
>gradients/conv-maxpool-4/BiasAdd_grad/tuple/control_dependencyIdentity+gradients/conv-maxpool-4/relu_grad/ReluGrad7^gradients/conv-maxpool-4/BiasAdd_grad/tuple/group_deps"/device:CPU:0*>
_class4
20loc:@gradients/conv-maxpool-4/relu_grad/ReluGrad*
T0*1
_output_shapes
:�����������
�
@gradients/conv-maxpool-4/BiasAdd_grad/tuple/control_dependency_1Identity1gradients/conv-maxpool-4/BiasAdd_grad/BiasAddGrad7^gradients/conv-maxpool-4/BiasAdd_grad/tuple/group_deps"/device:CPU:0*D
_class:
86loc:@gradients/conv-maxpool-4/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes	
:�
�
1gradients/conv-maxpool-5/BiasAdd_grad/BiasAddGradBiasAddGrad+gradients/conv-maxpool-5/relu_grad/ReluGrad"/device:CPU:0*
data_formatNHWC*
T0*
_output_shapes	
:�
�
6gradients/conv-maxpool-5/BiasAdd_grad/tuple/group_depsNoOp,^gradients/conv-maxpool-5/relu_grad/ReluGrad2^gradients/conv-maxpool-5/BiasAdd_grad/BiasAddGrad"/device:CPU:0
�
>gradients/conv-maxpool-5/BiasAdd_grad/tuple/control_dependencyIdentity+gradients/conv-maxpool-5/relu_grad/ReluGrad7^gradients/conv-maxpool-5/BiasAdd_grad/tuple/group_deps"/device:CPU:0*>
_class4
20loc:@gradients/conv-maxpool-5/relu_grad/ReluGrad*
T0*1
_output_shapes
:�����������
�
@gradients/conv-maxpool-5/BiasAdd_grad/tuple/control_dependency_1Identity1gradients/conv-maxpool-5/BiasAdd_grad/BiasAddGrad7^gradients/conv-maxpool-5/BiasAdd_grad/tuple/group_deps"/device:CPU:0*D
_class:
86loc:@gradients/conv-maxpool-5/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes	
:�
�
(gradients/conv-maxpool-3/conv_grad/ShapeShapeembedding/ExpandDims"/device:CPU:0*
out_type0*
T0*
_output_shapes
:
�
6gradients/conv-maxpool-3/conv_grad/Conv2DBackpropInputConv2DBackpropInput(gradients/conv-maxpool-3/conv_grad/Shapeconv-maxpool-3/W_conv/read>gradients/conv-maxpool-3/BiasAdd_grad/tuple/control_dependency"/device:CPU:0*J
_output_shapes8
6:4������������������������������������*
data_formatNHWC*
use_cudnn_on_gpu(*
paddingVALID*
strides
*
T0
�
*gradients/conv-maxpool-3/conv_grad/Shape_1Const"/device:CPU:0*
dtype0*%
valueB"   �      �   *
_output_shapes
:
�
7gradients/conv-maxpool-3/conv_grad/Conv2DBackpropFilterConv2DBackpropFilterembedding/ExpandDims*gradients/conv-maxpool-3/conv_grad/Shape_1>gradients/conv-maxpool-3/BiasAdd_grad/tuple/control_dependency"/device:CPU:0*(
_output_shapes
:��*
data_formatNHWC*
use_cudnn_on_gpu(*
paddingVALID*
strides
*
T0
�
3gradients/conv-maxpool-3/conv_grad/tuple/group_depsNoOp7^gradients/conv-maxpool-3/conv_grad/Conv2DBackpropInput8^gradients/conv-maxpool-3/conv_grad/Conv2DBackpropFilter"/device:CPU:0
�
;gradients/conv-maxpool-3/conv_grad/tuple/control_dependencyIdentity6gradients/conv-maxpool-3/conv_grad/Conv2DBackpropInput4^gradients/conv-maxpool-3/conv_grad/tuple/group_deps"/device:CPU:0*I
_class?
=;loc:@gradients/conv-maxpool-3/conv_grad/Conv2DBackpropInput*
T0*1
_output_shapes
:�����������
�
=gradients/conv-maxpool-3/conv_grad/tuple/control_dependency_1Identity7gradients/conv-maxpool-3/conv_grad/Conv2DBackpropFilter4^gradients/conv-maxpool-3/conv_grad/tuple/group_deps"/device:CPU:0*J
_class@
><loc:@gradients/conv-maxpool-3/conv_grad/Conv2DBackpropFilter*
T0*(
_output_shapes
:��
�
(gradients/conv-maxpool-4/conv_grad/ShapeShapeembedding/ExpandDims"/device:CPU:0*
out_type0*
T0*
_output_shapes
:
�
6gradients/conv-maxpool-4/conv_grad/Conv2DBackpropInputConv2DBackpropInput(gradients/conv-maxpool-4/conv_grad/Shapeconv-maxpool-4/W_conv/read>gradients/conv-maxpool-4/BiasAdd_grad/tuple/control_dependency"/device:CPU:0*J
_output_shapes8
6:4������������������������������������*
data_formatNHWC*
use_cudnn_on_gpu(*
paddingVALID*
strides
*
T0
�
*gradients/conv-maxpool-4/conv_grad/Shape_1Const"/device:CPU:0*
dtype0*%
valueB"   �      �   *
_output_shapes
:
�
7gradients/conv-maxpool-4/conv_grad/Conv2DBackpropFilterConv2DBackpropFilterembedding/ExpandDims*gradients/conv-maxpool-4/conv_grad/Shape_1>gradients/conv-maxpool-4/BiasAdd_grad/tuple/control_dependency"/device:CPU:0*(
_output_shapes
:��*
data_formatNHWC*
use_cudnn_on_gpu(*
paddingVALID*
strides
*
T0
�
3gradients/conv-maxpool-4/conv_grad/tuple/group_depsNoOp7^gradients/conv-maxpool-4/conv_grad/Conv2DBackpropInput8^gradients/conv-maxpool-4/conv_grad/Conv2DBackpropFilter"/device:CPU:0
�
;gradients/conv-maxpool-4/conv_grad/tuple/control_dependencyIdentity6gradients/conv-maxpool-4/conv_grad/Conv2DBackpropInput4^gradients/conv-maxpool-4/conv_grad/tuple/group_deps"/device:CPU:0*I
_class?
=;loc:@gradients/conv-maxpool-4/conv_grad/Conv2DBackpropInput*
T0*1
_output_shapes
:�����������
�
=gradients/conv-maxpool-4/conv_grad/tuple/control_dependency_1Identity7gradients/conv-maxpool-4/conv_grad/Conv2DBackpropFilter4^gradients/conv-maxpool-4/conv_grad/tuple/group_deps"/device:CPU:0*J
_class@
><loc:@gradients/conv-maxpool-4/conv_grad/Conv2DBackpropFilter*
T0*(
_output_shapes
:��
�
(gradients/conv-maxpool-5/conv_grad/ShapeShapeembedding/ExpandDims"/device:CPU:0*
out_type0*
T0*
_output_shapes
:
�
6gradients/conv-maxpool-5/conv_grad/Conv2DBackpropInputConv2DBackpropInput(gradients/conv-maxpool-5/conv_grad/Shapeconv-maxpool-5/W_conv/read>gradients/conv-maxpool-5/BiasAdd_grad/tuple/control_dependency"/device:CPU:0*J
_output_shapes8
6:4������������������������������������*
data_formatNHWC*
use_cudnn_on_gpu(*
paddingVALID*
strides
*
T0
�
*gradients/conv-maxpool-5/conv_grad/Shape_1Const"/device:CPU:0*
dtype0*%
valueB"   �      �   *
_output_shapes
:
�
7gradients/conv-maxpool-5/conv_grad/Conv2DBackpropFilterConv2DBackpropFilterembedding/ExpandDims*gradients/conv-maxpool-5/conv_grad/Shape_1>gradients/conv-maxpool-5/BiasAdd_grad/tuple/control_dependency"/device:CPU:0*(
_output_shapes
:��*
data_formatNHWC*
use_cudnn_on_gpu(*
paddingVALID*
strides
*
T0
�
3gradients/conv-maxpool-5/conv_grad/tuple/group_depsNoOp7^gradients/conv-maxpool-5/conv_grad/Conv2DBackpropInput8^gradients/conv-maxpool-5/conv_grad/Conv2DBackpropFilter"/device:CPU:0
�
;gradients/conv-maxpool-5/conv_grad/tuple/control_dependencyIdentity6gradients/conv-maxpool-5/conv_grad/Conv2DBackpropInput4^gradients/conv-maxpool-5/conv_grad/tuple/group_deps"/device:CPU:0*I
_class?
=;loc:@gradients/conv-maxpool-5/conv_grad/Conv2DBackpropInput*
T0*1
_output_shapes
:�����������
�
=gradients/conv-maxpool-5/conv_grad/tuple/control_dependency_1Identity7gradients/conv-maxpool-5/conv_grad/Conv2DBackpropFilter4^gradients/conv-maxpool-5/conv_grad/tuple/group_deps"/device:CPU:0*J
_class@
><loc:@gradients/conv-maxpool-5/conv_grad/Conv2DBackpropFilter*
T0*(
_output_shapes
:��
�
gradients/AddNAddN;gradients/conv-maxpool-3/conv_grad/tuple/control_dependency;gradients/conv-maxpool-4/conv_grad/tuple/control_dependency;gradients/conv-maxpool-5/conv_grad/tuple/control_dependency"/device:CPU:0*
N*I
_class?
=;loc:@gradients/conv-maxpool-3/conv_grad/Conv2DBackpropInput*
T0*1
_output_shapes
:�����������
�
)gradients/embedding/ExpandDims_grad/ShapeShapeembedding/embedding_lookup"/device:CPU:0*
out_type0*
T0*
_output_shapes
:
�
+gradients/embedding/ExpandDims_grad/ReshapeReshapegradients/AddN)gradients/embedding/ExpandDims_grad/Shape"/device:CPU:0*
Tshape0*
T0*-
_output_shapes
:�����������
�
/gradients/embedding/embedding_lookup_grad/ShapeConst"/device:CPU:0*
dtype0	*-
_class#
!loc:@embedding/embedding_matrix*%
valueB	"	"      �       *
_output_shapes
:
�
1gradients/embedding/embedding_lookup_grad/ToInt32Cast/gradients/embedding/embedding_lookup_grad/Shape"/device:CPU:0*

DstT0*-
_class#
!loc:@embedding/embedding_matrix*

SrcT0	*
_output_shapes
:

.gradients/embedding/embedding_lookup_grad/SizeSizedata_in"/device:CPU:0*
out_type0*
T0*
_output_shapes
: 
�
8gradients/embedding/embedding_lookup_grad/ExpandDims/dimConst"/device:CPU:0*
dtype0*
value	B : *
_output_shapes
: 
�
4gradients/embedding/embedding_lookup_grad/ExpandDims
ExpandDims.gradients/embedding/embedding_lookup_grad/Size8gradients/embedding/embedding_lookup_grad/ExpandDims/dim"/device:CPU:0*

Tdim0*
T0*
_output_shapes
:
�
=gradients/embedding/embedding_lookup_grad/strided_slice/stackConst"/device:CPU:0*
dtype0*
valueB:*
_output_shapes
:
�
?gradients/embedding/embedding_lookup_grad/strided_slice/stack_1Const"/device:CPU:0*
dtype0*
valueB: *
_output_shapes
:
�
?gradients/embedding/embedding_lookup_grad/strided_slice/stack_2Const"/device:CPU:0*
dtype0*
valueB:*
_output_shapes
:
�
7gradients/embedding/embedding_lookup_grad/strided_sliceStridedSlice1gradients/embedding/embedding_lookup_grad/ToInt32=gradients/embedding/embedding_lookup_grad/strided_slice/stack?gradients/embedding/embedding_lookup_grad/strided_slice/stack_1?gradients/embedding/embedding_lookup_grad/strided_slice/stack_2"/device:CPU:0*
new_axis_mask *
Index0*
_output_shapes
:*

begin_mask *
ellipsis_mask *
end_mask*
T0*
shrink_axis_mask 
�
5gradients/embedding/embedding_lookup_grad/concat/axisConst"/device:CPU:0*
dtype0*
value	B : *
_output_shapes
: 
�
0gradients/embedding/embedding_lookup_grad/concatConcatV24gradients/embedding/embedding_lookup_grad/ExpandDims7gradients/embedding/embedding_lookup_grad/strided_slice5gradients/embedding/embedding_lookup_grad/concat/axis"/device:CPU:0*
_output_shapes
:*

Tidx0*
T0*
N
�
1gradients/embedding/embedding_lookup_grad/ReshapeReshape+gradients/embedding/ExpandDims_grad/Reshape0gradients/embedding/embedding_lookup_grad/concat"/device:CPU:0*
Tshape0*
T0*(
_output_shapes
:����������
�
3gradients/embedding/embedding_lookup_grad/Reshape_1Reshapedata_in4gradients/embedding/embedding_lookup_grad/ExpandDims"/device:CPU:0*
Tshape0*
T0*#
_output_shapes
:���������
�
beta1_power/initial_valueConst"/device:CPU:0*
dtype0*(
_class
loc:@conv-maxpool-3/W_conv*
valueB
 *fff?*
_output_shapes
: 
�
beta1_power
VariableV2"/device:CPU:0*
	container *
_output_shapes
: *
dtype0*
shape: *(
_class
loc:@conv-maxpool-3/W_conv*
shared_name 
�
beta1_power/AssignAssignbeta1_powerbeta1_power/initial_value"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-3/W_conv*
use_locking(*
T0*
_output_shapes
: 
�
beta1_power/readIdentitybeta1_power"/device:CPU:0*(
_class
loc:@conv-maxpool-3/W_conv*
T0*
_output_shapes
: 
�
beta2_power/initial_valueConst"/device:CPU:0*
dtype0*(
_class
loc:@conv-maxpool-3/W_conv*
valueB
 *w�?*
_output_shapes
: 
�
beta2_power
VariableV2"/device:CPU:0*
	container *
_output_shapes
: *
dtype0*
shape: *(
_class
loc:@conv-maxpool-3/W_conv*
shared_name 
�
beta2_power/AssignAssignbeta2_powerbeta2_power/initial_value"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-3/W_conv*
use_locking(*
T0*
_output_shapes
: 
�
beta2_power/readIdentitybeta2_power"/device:CPU:0*(
_class
loc:@conv-maxpool-3/W_conv*
T0*
_output_shapes
: 
�
1embedding/embedding_matrix/Adam/Initializer/zerosConst"/device:CPU:0*
dtype0*-
_class#
!loc:@embedding/embedding_matrix*
valueB
�D�*    * 
_output_shapes
:
�D�
�
embedding/embedding_matrix/Adam
VariableV2"/device:CPU:0*
	container * 
_output_shapes
:
�D�*
dtype0*
shape:
�D�*-
_class#
!loc:@embedding/embedding_matrix*
shared_name 
�
&embedding/embedding_matrix/Adam/AssignAssignembedding/embedding_matrix/Adam1embedding/embedding_matrix/Adam/Initializer/zeros"/device:CPU:0*
validate_shape(*-
_class#
!loc:@embedding/embedding_matrix*
use_locking(*
T0* 
_output_shapes
:
�D�
�
$embedding/embedding_matrix/Adam/readIdentityembedding/embedding_matrix/Adam"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0* 
_output_shapes
:
�D�
�
3embedding/embedding_matrix/Adam_1/Initializer/zerosConst"/device:CPU:0*
dtype0*-
_class#
!loc:@embedding/embedding_matrix*
valueB
�D�*    * 
_output_shapes
:
�D�
�
!embedding/embedding_matrix/Adam_1
VariableV2"/device:CPU:0*
	container * 
_output_shapes
:
�D�*
dtype0*
shape:
�D�*-
_class#
!loc:@embedding/embedding_matrix*
shared_name 
�
(embedding/embedding_matrix/Adam_1/AssignAssign!embedding/embedding_matrix/Adam_13embedding/embedding_matrix/Adam_1/Initializer/zeros"/device:CPU:0*
validate_shape(*-
_class#
!loc:@embedding/embedding_matrix*
use_locking(*
T0* 
_output_shapes
:
�D�
�
&embedding/embedding_matrix/Adam_1/readIdentity!embedding/embedding_matrix/Adam_1"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0* 
_output_shapes
:
�D�
�
,conv-maxpool-3/W_conv/Adam/Initializer/zerosConst"/device:CPU:0*
dtype0*(
_class
loc:@conv-maxpool-3/W_conv*'
valueB��*    *(
_output_shapes
:��
�
conv-maxpool-3/W_conv/Adam
VariableV2"/device:CPU:0*
	container *(
_output_shapes
:��*
dtype0*
shape:��*(
_class
loc:@conv-maxpool-3/W_conv*
shared_name 
�
!conv-maxpool-3/W_conv/Adam/AssignAssignconv-maxpool-3/W_conv/Adam,conv-maxpool-3/W_conv/Adam/Initializer/zeros"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-3/W_conv*
use_locking(*
T0*(
_output_shapes
:��
�
conv-maxpool-3/W_conv/Adam/readIdentityconv-maxpool-3/W_conv/Adam"/device:CPU:0*(
_class
loc:@conv-maxpool-3/W_conv*
T0*(
_output_shapes
:��
�
.conv-maxpool-3/W_conv/Adam_1/Initializer/zerosConst"/device:CPU:0*
dtype0*(
_class
loc:@conv-maxpool-3/W_conv*'
valueB��*    *(
_output_shapes
:��
�
conv-maxpool-3/W_conv/Adam_1
VariableV2"/device:CPU:0*
	container *(
_output_shapes
:��*
dtype0*
shape:��*(
_class
loc:@conv-maxpool-3/W_conv*
shared_name 
�
#conv-maxpool-3/W_conv/Adam_1/AssignAssignconv-maxpool-3/W_conv/Adam_1.conv-maxpool-3/W_conv/Adam_1/Initializer/zeros"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-3/W_conv*
use_locking(*
T0*(
_output_shapes
:��
�
!conv-maxpool-3/W_conv/Adam_1/readIdentityconv-maxpool-3/W_conv/Adam_1"/device:CPU:0*(
_class
loc:@conv-maxpool-3/W_conv*
T0*(
_output_shapes
:��
�
,conv-maxpool-3/b_conv/Adam/Initializer/zerosConst"/device:CPU:0*
dtype0*(
_class
loc:@conv-maxpool-3/b_conv*
valueB�*    *
_output_shapes	
:�
�
conv-maxpool-3/b_conv/Adam
VariableV2"/device:CPU:0*
	container *
_output_shapes	
:�*
dtype0*
shape:�*(
_class
loc:@conv-maxpool-3/b_conv*
shared_name 
�
!conv-maxpool-3/b_conv/Adam/AssignAssignconv-maxpool-3/b_conv/Adam,conv-maxpool-3/b_conv/Adam/Initializer/zeros"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-3/b_conv*
use_locking(*
T0*
_output_shapes	
:�
�
conv-maxpool-3/b_conv/Adam/readIdentityconv-maxpool-3/b_conv/Adam"/device:CPU:0*(
_class
loc:@conv-maxpool-3/b_conv*
T0*
_output_shapes	
:�
�
.conv-maxpool-3/b_conv/Adam_1/Initializer/zerosConst"/device:CPU:0*
dtype0*(
_class
loc:@conv-maxpool-3/b_conv*
valueB�*    *
_output_shapes	
:�
�
conv-maxpool-3/b_conv/Adam_1
VariableV2"/device:CPU:0*
	container *
_output_shapes	
:�*
dtype0*
shape:�*(
_class
loc:@conv-maxpool-3/b_conv*
shared_name 
�
#conv-maxpool-3/b_conv/Adam_1/AssignAssignconv-maxpool-3/b_conv/Adam_1.conv-maxpool-3/b_conv/Adam_1/Initializer/zeros"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-3/b_conv*
use_locking(*
T0*
_output_shapes	
:�
�
!conv-maxpool-3/b_conv/Adam_1/readIdentityconv-maxpool-3/b_conv/Adam_1"/device:CPU:0*(
_class
loc:@conv-maxpool-3/b_conv*
T0*
_output_shapes	
:�
�
,conv-maxpool-4/W_conv/Adam/Initializer/zerosConst"/device:CPU:0*
dtype0*(
_class
loc:@conv-maxpool-4/W_conv*'
valueB��*    *(
_output_shapes
:��
�
conv-maxpool-4/W_conv/Adam
VariableV2"/device:CPU:0*
	container *(
_output_shapes
:��*
dtype0*
shape:��*(
_class
loc:@conv-maxpool-4/W_conv*
shared_name 
�
!conv-maxpool-4/W_conv/Adam/AssignAssignconv-maxpool-4/W_conv/Adam,conv-maxpool-4/W_conv/Adam/Initializer/zeros"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-4/W_conv*
use_locking(*
T0*(
_output_shapes
:��
�
conv-maxpool-4/W_conv/Adam/readIdentityconv-maxpool-4/W_conv/Adam"/device:CPU:0*(
_class
loc:@conv-maxpool-4/W_conv*
T0*(
_output_shapes
:��
�
.conv-maxpool-4/W_conv/Adam_1/Initializer/zerosConst"/device:CPU:0*
dtype0*(
_class
loc:@conv-maxpool-4/W_conv*'
valueB��*    *(
_output_shapes
:��
�
conv-maxpool-4/W_conv/Adam_1
VariableV2"/device:CPU:0*
	container *(
_output_shapes
:��*
dtype0*
shape:��*(
_class
loc:@conv-maxpool-4/W_conv*
shared_name 
�
#conv-maxpool-4/W_conv/Adam_1/AssignAssignconv-maxpool-4/W_conv/Adam_1.conv-maxpool-4/W_conv/Adam_1/Initializer/zeros"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-4/W_conv*
use_locking(*
T0*(
_output_shapes
:��
�
!conv-maxpool-4/W_conv/Adam_1/readIdentityconv-maxpool-4/W_conv/Adam_1"/device:CPU:0*(
_class
loc:@conv-maxpool-4/W_conv*
T0*(
_output_shapes
:��
�
,conv-maxpool-4/b_conv/Adam/Initializer/zerosConst"/device:CPU:0*
dtype0*(
_class
loc:@conv-maxpool-4/b_conv*
valueB�*    *
_output_shapes	
:�
�
conv-maxpool-4/b_conv/Adam
VariableV2"/device:CPU:0*
	container *
_output_shapes	
:�*
dtype0*
shape:�*(
_class
loc:@conv-maxpool-4/b_conv*
shared_name 
�
!conv-maxpool-4/b_conv/Adam/AssignAssignconv-maxpool-4/b_conv/Adam,conv-maxpool-4/b_conv/Adam/Initializer/zeros"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-4/b_conv*
use_locking(*
T0*
_output_shapes	
:�
�
conv-maxpool-4/b_conv/Adam/readIdentityconv-maxpool-4/b_conv/Adam"/device:CPU:0*(
_class
loc:@conv-maxpool-4/b_conv*
T0*
_output_shapes	
:�
�
.conv-maxpool-4/b_conv/Adam_1/Initializer/zerosConst"/device:CPU:0*
dtype0*(
_class
loc:@conv-maxpool-4/b_conv*
valueB�*    *
_output_shapes	
:�
�
conv-maxpool-4/b_conv/Adam_1
VariableV2"/device:CPU:0*
	container *
_output_shapes	
:�*
dtype0*
shape:�*(
_class
loc:@conv-maxpool-4/b_conv*
shared_name 
�
#conv-maxpool-4/b_conv/Adam_1/AssignAssignconv-maxpool-4/b_conv/Adam_1.conv-maxpool-4/b_conv/Adam_1/Initializer/zeros"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-4/b_conv*
use_locking(*
T0*
_output_shapes	
:�
�
!conv-maxpool-4/b_conv/Adam_1/readIdentityconv-maxpool-4/b_conv/Adam_1"/device:CPU:0*(
_class
loc:@conv-maxpool-4/b_conv*
T0*
_output_shapes	
:�
�
,conv-maxpool-5/W_conv/Adam/Initializer/zerosConst"/device:CPU:0*
dtype0*(
_class
loc:@conv-maxpool-5/W_conv*'
valueB��*    *(
_output_shapes
:��
�
conv-maxpool-5/W_conv/Adam
VariableV2"/device:CPU:0*
	container *(
_output_shapes
:��*
dtype0*
shape:��*(
_class
loc:@conv-maxpool-5/W_conv*
shared_name 
�
!conv-maxpool-5/W_conv/Adam/AssignAssignconv-maxpool-5/W_conv/Adam,conv-maxpool-5/W_conv/Adam/Initializer/zeros"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-5/W_conv*
use_locking(*
T0*(
_output_shapes
:��
�
conv-maxpool-5/W_conv/Adam/readIdentityconv-maxpool-5/W_conv/Adam"/device:CPU:0*(
_class
loc:@conv-maxpool-5/W_conv*
T0*(
_output_shapes
:��
�
.conv-maxpool-5/W_conv/Adam_1/Initializer/zerosConst"/device:CPU:0*
dtype0*(
_class
loc:@conv-maxpool-5/W_conv*'
valueB��*    *(
_output_shapes
:��
�
conv-maxpool-5/W_conv/Adam_1
VariableV2"/device:CPU:0*
	container *(
_output_shapes
:��*
dtype0*
shape:��*(
_class
loc:@conv-maxpool-5/W_conv*
shared_name 
�
#conv-maxpool-5/W_conv/Adam_1/AssignAssignconv-maxpool-5/W_conv/Adam_1.conv-maxpool-5/W_conv/Adam_1/Initializer/zeros"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-5/W_conv*
use_locking(*
T0*(
_output_shapes
:��
�
!conv-maxpool-5/W_conv/Adam_1/readIdentityconv-maxpool-5/W_conv/Adam_1"/device:CPU:0*(
_class
loc:@conv-maxpool-5/W_conv*
T0*(
_output_shapes
:��
�
,conv-maxpool-5/b_conv/Adam/Initializer/zerosConst"/device:CPU:0*
dtype0*(
_class
loc:@conv-maxpool-5/b_conv*
valueB�*    *
_output_shapes	
:�
�
conv-maxpool-5/b_conv/Adam
VariableV2"/device:CPU:0*
	container *
_output_shapes	
:�*
dtype0*
shape:�*(
_class
loc:@conv-maxpool-5/b_conv*
shared_name 
�
!conv-maxpool-5/b_conv/Adam/AssignAssignconv-maxpool-5/b_conv/Adam,conv-maxpool-5/b_conv/Adam/Initializer/zeros"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-5/b_conv*
use_locking(*
T0*
_output_shapes	
:�
�
conv-maxpool-5/b_conv/Adam/readIdentityconv-maxpool-5/b_conv/Adam"/device:CPU:0*(
_class
loc:@conv-maxpool-5/b_conv*
T0*
_output_shapes	
:�
�
.conv-maxpool-5/b_conv/Adam_1/Initializer/zerosConst"/device:CPU:0*
dtype0*(
_class
loc:@conv-maxpool-5/b_conv*
valueB�*    *
_output_shapes	
:�
�
conv-maxpool-5/b_conv/Adam_1
VariableV2"/device:CPU:0*
	container *
_output_shapes	
:�*
dtype0*
shape:�*(
_class
loc:@conv-maxpool-5/b_conv*
shared_name 
�
#conv-maxpool-5/b_conv/Adam_1/AssignAssignconv-maxpool-5/b_conv/Adam_1.conv-maxpool-5/b_conv/Adam_1/Initializer/zeros"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-5/b_conv*
use_locking(*
T0*
_output_shapes	
:�
�
!conv-maxpool-5/b_conv/Adam_1/readIdentityconv-maxpool-5/b_conv/Adam_1"/device:CPU:0*(
_class
loc:@conv-maxpool-5/b_conv*
T0*
_output_shapes	
:�
�
#output/W_out/Adam/Initializer/zerosConst"/device:CPU:0*
dtype0*
_class
loc:@output/W_out*
valueB	�*    *
_output_shapes
:	�
�
output/W_out/Adam
VariableV2"/device:CPU:0*
	container *
_output_shapes
:	�*
dtype0*
shape:	�*
_class
loc:@output/W_out*
shared_name 
�
output/W_out/Adam/AssignAssignoutput/W_out/Adam#output/W_out/Adam/Initializer/zeros"/device:CPU:0*
validate_shape(*
_class
loc:@output/W_out*
use_locking(*
T0*
_output_shapes
:	�
�
output/W_out/Adam/readIdentityoutput/W_out/Adam"/device:CPU:0*
_class
loc:@output/W_out*
T0*
_output_shapes
:	�
�
%output/W_out/Adam_1/Initializer/zerosConst"/device:CPU:0*
dtype0*
_class
loc:@output/W_out*
valueB	�*    *
_output_shapes
:	�
�
output/W_out/Adam_1
VariableV2"/device:CPU:0*
	container *
_output_shapes
:	�*
dtype0*
shape:	�*
_class
loc:@output/W_out*
shared_name 
�
output/W_out/Adam_1/AssignAssignoutput/W_out/Adam_1%output/W_out/Adam_1/Initializer/zeros"/device:CPU:0*
validate_shape(*
_class
loc:@output/W_out*
use_locking(*
T0*
_output_shapes
:	�
�
output/W_out/Adam_1/readIdentityoutput/W_out/Adam_1"/device:CPU:0*
_class
loc:@output/W_out*
T0*
_output_shapes
:	�
�
#output/b_out/Adam/Initializer/zerosConst"/device:CPU:0*
dtype0*
_class
loc:@output/b_out*
valueB*    *
_output_shapes
:
�
output/b_out/Adam
VariableV2"/device:CPU:0*
	container *
_output_shapes
:*
dtype0*
shape:*
_class
loc:@output/b_out*
shared_name 
�
output/b_out/Adam/AssignAssignoutput/b_out/Adam#output/b_out/Adam/Initializer/zeros"/device:CPU:0*
validate_shape(*
_class
loc:@output/b_out*
use_locking(*
T0*
_output_shapes
:
�
output/b_out/Adam/readIdentityoutput/b_out/Adam"/device:CPU:0*
_class
loc:@output/b_out*
T0*
_output_shapes
:
�
%output/b_out/Adam_1/Initializer/zerosConst"/device:CPU:0*
dtype0*
_class
loc:@output/b_out*
valueB*    *
_output_shapes
:
�
output/b_out/Adam_1
VariableV2"/device:CPU:0*
	container *
_output_shapes
:*
dtype0*
shape:*
_class
loc:@output/b_out*
shared_name 
�
output/b_out/Adam_1/AssignAssignoutput/b_out/Adam_1%output/b_out/Adam_1/Initializer/zeros"/device:CPU:0*
validate_shape(*
_class
loc:@output/b_out*
use_locking(*
T0*
_output_shapes
:
�
output/b_out/Adam_1/readIdentityoutput/b_out/Adam_1"/device:CPU:0*
_class
loc:@output/b_out*
T0*
_output_shapes
:
f
Adam/learning_rateConst"/device:CPU:0*
dtype0*
valueB
 *��8*
_output_shapes
: 
^

Adam/beta1Const"/device:CPU:0*
dtype0*
valueB
 *fff?*
_output_shapes
: 
^

Adam/beta2Const"/device:CPU:0*
dtype0*
valueB
 *w�?*
_output_shapes
: 
`
Adam/epsilonConst"/device:CPU:0*
dtype0*
valueB
 *w�+2*
_output_shapes
: 
�
-Adam/update_embedding/embedding_matrix/UniqueUnique3gradients/embedding/embedding_lookup_grad/Reshape_1"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
out_idx0*
T0*2
_output_shapes 
:���������:���������
�
,Adam/update_embedding/embedding_matrix/ShapeShape-Adam/update_embedding/embedding_matrix/Unique"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
out_type0*
T0*
_output_shapes
:
�
:Adam/update_embedding/embedding_matrix/strided_slice/stackConst"/device:CPU:0*
dtype0*-
_class#
!loc:@embedding/embedding_matrix*
valueB: *
_output_shapes
:
�
<Adam/update_embedding/embedding_matrix/strided_slice/stack_1Const"/device:CPU:0*
dtype0*-
_class#
!loc:@embedding/embedding_matrix*
valueB:*
_output_shapes
:
�
<Adam/update_embedding/embedding_matrix/strided_slice/stack_2Const"/device:CPU:0*
dtype0*-
_class#
!loc:@embedding/embedding_matrix*
valueB:*
_output_shapes
:
�
4Adam/update_embedding/embedding_matrix/strided_sliceStridedSlice,Adam/update_embedding/embedding_matrix/Shape:Adam/update_embedding/embedding_matrix/strided_slice/stack<Adam/update_embedding/embedding_matrix/strided_slice/stack_1<Adam/update_embedding/embedding_matrix/strided_slice/stack_2"/device:CPU:0*
new_axis_mask *
Index0*
_output_shapes
: *

begin_mask *
ellipsis_mask *
end_mask *
T0*
shrink_axis_mask*-
_class#
!loc:@embedding/embedding_matrix
�
9Adam/update_embedding/embedding_matrix/UnsortedSegmentSumUnsortedSegmentSum1gradients/embedding/embedding_lookup_grad/Reshape/Adam/update_embedding/embedding_matrix/Unique:14Adam/update_embedding/embedding_matrix/strided_slice"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
Tindices0*
T0*(
_output_shapes
:����������
�
,Adam/update_embedding/embedding_matrix/sub/xConst"/device:CPU:0*
dtype0*-
_class#
!loc:@embedding/embedding_matrix*
valueB
 *  �?*
_output_shapes
: 
�
*Adam/update_embedding/embedding_matrix/subSub,Adam/update_embedding/embedding_matrix/sub/xbeta2_power/read"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0*
_output_shapes
: 
�
+Adam/update_embedding/embedding_matrix/SqrtSqrt*Adam/update_embedding/embedding_matrix/sub"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0*
_output_shapes
: 
�
*Adam/update_embedding/embedding_matrix/mulMulAdam/learning_rate+Adam/update_embedding/embedding_matrix/Sqrt"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0*
_output_shapes
: 
�
.Adam/update_embedding/embedding_matrix/sub_1/xConst"/device:CPU:0*
dtype0*-
_class#
!loc:@embedding/embedding_matrix*
valueB
 *  �?*
_output_shapes
: 
�
,Adam/update_embedding/embedding_matrix/sub_1Sub.Adam/update_embedding/embedding_matrix/sub_1/xbeta1_power/read"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0*
_output_shapes
: 
�
.Adam/update_embedding/embedding_matrix/truedivRealDiv*Adam/update_embedding/embedding_matrix/mul,Adam/update_embedding/embedding_matrix/sub_1"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0*
_output_shapes
: 
�
.Adam/update_embedding/embedding_matrix/sub_2/xConst"/device:CPU:0*
dtype0*-
_class#
!loc:@embedding/embedding_matrix*
valueB
 *  �?*
_output_shapes
: 
�
,Adam/update_embedding/embedding_matrix/sub_2Sub.Adam/update_embedding/embedding_matrix/sub_2/x
Adam/beta1"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0*
_output_shapes
: 
�
,Adam/update_embedding/embedding_matrix/mul_1Mul9Adam/update_embedding/embedding_matrix/UnsortedSegmentSum,Adam/update_embedding/embedding_matrix/sub_2"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0*(
_output_shapes
:����������
�
,Adam/update_embedding/embedding_matrix/mul_2Mul$embedding/embedding_matrix/Adam/read
Adam/beta1"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0* 
_output_shapes
:
�D�
�
-Adam/update_embedding/embedding_matrix/AssignAssignembedding/embedding_matrix/Adam,Adam/update_embedding/embedding_matrix/mul_2"/device:CPU:0*
validate_shape(*-
_class#
!loc:@embedding/embedding_matrix*
use_locking( *
T0* 
_output_shapes
:
�D�
�
1Adam/update_embedding/embedding_matrix/ScatterAdd
ScatterAddembedding/embedding_matrix/Adam-Adam/update_embedding/embedding_matrix/Unique,Adam/update_embedding/embedding_matrix/mul_1.^Adam/update_embedding/embedding_matrix/Assign"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
Tindices0*
use_locking( *
T0* 
_output_shapes
:
�D�
�
,Adam/update_embedding/embedding_matrix/mul_3Mul9Adam/update_embedding/embedding_matrix/UnsortedSegmentSum9Adam/update_embedding/embedding_matrix/UnsortedSegmentSum"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0*(
_output_shapes
:����������
�
.Adam/update_embedding/embedding_matrix/sub_3/xConst"/device:CPU:0*
dtype0*-
_class#
!loc:@embedding/embedding_matrix*
valueB
 *  �?*
_output_shapes
: 
�
,Adam/update_embedding/embedding_matrix/sub_3Sub.Adam/update_embedding/embedding_matrix/sub_3/x
Adam/beta2"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0*
_output_shapes
: 
�
,Adam/update_embedding/embedding_matrix/mul_4Mul,Adam/update_embedding/embedding_matrix/mul_3,Adam/update_embedding/embedding_matrix/sub_3"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0*(
_output_shapes
:����������
�
,Adam/update_embedding/embedding_matrix/mul_5Mul&embedding/embedding_matrix/Adam_1/read
Adam/beta2"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0* 
_output_shapes
:
�D�
�
/Adam/update_embedding/embedding_matrix/Assign_1Assign!embedding/embedding_matrix/Adam_1,Adam/update_embedding/embedding_matrix/mul_5"/device:CPU:0*
validate_shape(*-
_class#
!loc:@embedding/embedding_matrix*
use_locking( *
T0* 
_output_shapes
:
�D�
�
3Adam/update_embedding/embedding_matrix/ScatterAdd_1
ScatterAdd!embedding/embedding_matrix/Adam_1-Adam/update_embedding/embedding_matrix/Unique,Adam/update_embedding/embedding_matrix/mul_40^Adam/update_embedding/embedding_matrix/Assign_1"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
Tindices0*
use_locking( *
T0* 
_output_shapes
:
�D�
�
-Adam/update_embedding/embedding_matrix/Sqrt_1Sqrt3Adam/update_embedding/embedding_matrix/ScatterAdd_1"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0* 
_output_shapes
:
�D�
�
,Adam/update_embedding/embedding_matrix/mul_6Mul.Adam/update_embedding/embedding_matrix/truediv1Adam/update_embedding/embedding_matrix/ScatterAdd"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0* 
_output_shapes
:
�D�
�
*Adam/update_embedding/embedding_matrix/addAdd-Adam/update_embedding/embedding_matrix/Sqrt_1Adam/epsilon"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0* 
_output_shapes
:
�D�
�
0Adam/update_embedding/embedding_matrix/truediv_1RealDiv,Adam/update_embedding/embedding_matrix/mul_6*Adam/update_embedding/embedding_matrix/add"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0* 
_output_shapes
:
�D�
�
0Adam/update_embedding/embedding_matrix/AssignSub	AssignSubembedding/embedding_matrix0Adam/update_embedding/embedding_matrix/truediv_1"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
use_locking( *
T0* 
_output_shapes
:
�D�
�
1Adam/update_embedding/embedding_matrix/group_depsNoOp1^Adam/update_embedding/embedding_matrix/AssignSub2^Adam/update_embedding/embedding_matrix/ScatterAdd4^Adam/update_embedding/embedding_matrix/ScatterAdd_1"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix
�
+Adam/update_conv-maxpool-3/W_conv/ApplyAdam	ApplyAdamconv-maxpool-3/W_convconv-maxpool-3/W_conv/Adamconv-maxpool-3/W_conv/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon=gradients/conv-maxpool-3/conv_grad/tuple/control_dependency_1"/device:CPU:0*
use_nesterov( *(
_class
loc:@conv-maxpool-3/W_conv*
use_locking( *
T0*(
_output_shapes
:��
�
+Adam/update_conv-maxpool-3/b_conv/ApplyAdam	ApplyAdamconv-maxpool-3/b_convconv-maxpool-3/b_conv/Adamconv-maxpool-3/b_conv/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon@gradients/conv-maxpool-3/BiasAdd_grad/tuple/control_dependency_1"/device:CPU:0*
use_nesterov( *(
_class
loc:@conv-maxpool-3/b_conv*
use_locking( *
T0*
_output_shapes	
:�
�
+Adam/update_conv-maxpool-4/W_conv/ApplyAdam	ApplyAdamconv-maxpool-4/W_convconv-maxpool-4/W_conv/Adamconv-maxpool-4/W_conv/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon=gradients/conv-maxpool-4/conv_grad/tuple/control_dependency_1"/device:CPU:0*
use_nesterov( *(
_class
loc:@conv-maxpool-4/W_conv*
use_locking( *
T0*(
_output_shapes
:��
�
+Adam/update_conv-maxpool-4/b_conv/ApplyAdam	ApplyAdamconv-maxpool-4/b_convconv-maxpool-4/b_conv/Adamconv-maxpool-4/b_conv/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon@gradients/conv-maxpool-4/BiasAdd_grad/tuple/control_dependency_1"/device:CPU:0*
use_nesterov( *(
_class
loc:@conv-maxpool-4/b_conv*
use_locking( *
T0*
_output_shapes	
:�
�
+Adam/update_conv-maxpool-5/W_conv/ApplyAdam	ApplyAdamconv-maxpool-5/W_convconv-maxpool-5/W_conv/Adamconv-maxpool-5/W_conv/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon=gradients/conv-maxpool-5/conv_grad/tuple/control_dependency_1"/device:CPU:0*
use_nesterov( *(
_class
loc:@conv-maxpool-5/W_conv*
use_locking( *
T0*(
_output_shapes
:��
�
+Adam/update_conv-maxpool-5/b_conv/ApplyAdam	ApplyAdamconv-maxpool-5/b_convconv-maxpool-5/b_conv/Adamconv-maxpool-5/b_conv/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon@gradients/conv-maxpool-5/BiasAdd_grad/tuple/control_dependency_1"/device:CPU:0*
use_nesterov( *(
_class
loc:@conv-maxpool-5/b_conv*
use_locking( *
T0*
_output_shapes	
:�
�
"Adam/update_output/W_out/ApplyAdam	ApplyAdamoutput/W_outoutput/W_out/Adamoutput/W_out/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon7gradients/output/MatMul_grad/tuple/control_dependency_1"/device:CPU:0*
use_nesterov( *
_class
loc:@output/W_out*
use_locking( *
T0*
_output_shapes
:	�
�
"Adam/update_output/b_out/ApplyAdam	ApplyAdamoutput/b_outoutput/b_out/Adamoutput/b_out/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon4gradients/output/add_grad/tuple/control_dependency_1"/device:CPU:0*
use_nesterov( *
_class
loc:@output/b_out*
use_locking( *
T0*
_output_shapes
:
�
Adam/mulMulbeta1_power/read
Adam/beta12^Adam/update_embedding/embedding_matrix/group_deps,^Adam/update_conv-maxpool-3/W_conv/ApplyAdam,^Adam/update_conv-maxpool-3/b_conv/ApplyAdam,^Adam/update_conv-maxpool-4/W_conv/ApplyAdam,^Adam/update_conv-maxpool-4/b_conv/ApplyAdam,^Adam/update_conv-maxpool-5/W_conv/ApplyAdam,^Adam/update_conv-maxpool-5/b_conv/ApplyAdam#^Adam/update_output/W_out/ApplyAdam#^Adam/update_output/b_out/ApplyAdam"/device:CPU:0*(
_class
loc:@conv-maxpool-3/W_conv*
T0*
_output_shapes
: 
�
Adam/AssignAssignbeta1_powerAdam/mul"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-3/W_conv*
use_locking( *
T0*
_output_shapes
: 
�

Adam/mul_1Mulbeta2_power/read
Adam/beta22^Adam/update_embedding/embedding_matrix/group_deps,^Adam/update_conv-maxpool-3/W_conv/ApplyAdam,^Adam/update_conv-maxpool-3/b_conv/ApplyAdam,^Adam/update_conv-maxpool-4/W_conv/ApplyAdam,^Adam/update_conv-maxpool-4/b_conv/ApplyAdam,^Adam/update_conv-maxpool-5/W_conv/ApplyAdam,^Adam/update_conv-maxpool-5/b_conv/ApplyAdam#^Adam/update_output/W_out/ApplyAdam#^Adam/update_output/b_out/ApplyAdam"/device:CPU:0*(
_class
loc:@conv-maxpool-3/W_conv*
T0*
_output_shapes
: 
�
Adam/Assign_1Assignbeta2_power
Adam/mul_1"/device:CPU:0*
validate_shape(*(
_class
loc:@conv-maxpool-3/W_conv*
use_locking( *
T0*
_output_shapes
: 
�
AdamNoOp2^Adam/update_embedding/embedding_matrix/group_deps,^Adam/update_conv-maxpool-3/W_conv/ApplyAdam,^Adam/update_conv-maxpool-3/b_conv/ApplyAdam,^Adam/update_conv-maxpool-4/W_conv/ApplyAdam,^Adam/update_conv-maxpool-4/b_conv/ApplyAdam,^Adam/update_conv-maxpool-5/W_conv/ApplyAdam,^Adam/update_conv-maxpool-5/b_conv/ApplyAdam#^Adam/update_output/W_out/ApplyAdam#^Adam/update_output/b_out/ApplyAdam^Adam/Assign^Adam/Assign_1"/device:CPU:0
a
ArgMax/dimensionConst"/device:CPU:0*
dtype0*
value	B :*
_output_shapes
: 
�
ArgMaxArgMaxoutput/SoftmaxArgMax/dimension"/device:CPU:0*
output_type0	*

Tidx0*
T0*#
_output_shapes
:���������
c
ArgMax_1/dimensionConst"/device:CPU:0*
dtype0*
value	B :*
_output_shapes
: 
�
ArgMax_1ArgMaxdata_outArgMax_1/dimension"/device:CPU:0*
output_type0	*

Tidx0*
T0*#
_output_shapes
:���������
]
EqualEqualArgMaxArgMax_1"/device:CPU:0*
T0	*#
_output_shapes
:���������
_
CastCastEqual"/device:CPU:0*

DstT0*

SrcT0
*#
_output_shapes
:���������
`
Const_1Const"/device:CPU:0*
dtype0*
valueB: *
_output_shapes
:
h
MeanMeanCastConst_1"/device:CPU:0*

Tidx0*
T0*
	keep_dims( *
_output_shapes
: 
I
RankRankPlaceholder"/device:CPU:0*
T0*
_output_shapes
: 
\
range/startConst"/device:CPU:0*
dtype0*
value	B : *
_output_shapes
: 
\
range/deltaConst"/device:CPU:0*
dtype0*
value	B :*
_output_shapes
: 
n
rangeRangerange/startRankrange/delta"/device:CPU:0*

Tidx0*#
_output_shapes
:���������
q
Mean_1MeanPlaceholderrange"/device:CPU:0*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:
M
Rank_1RankPlaceholder_1"/device:CPU:0*
T0*
_output_shapes
: 
^
range_1/startConst"/device:CPU:0*
dtype0*
value	B : *
_output_shapes
: 
^
range_1/deltaConst"/device:CPU:0*
dtype0*
value	B :*
_output_shapes
: 
v
range_1Rangerange_1/startRank_1range_1/delta"/device:CPU:0*

Tidx0*#
_output_shapes
:���������
u
Mean_2MeanPlaceholder_1range_1"/device:CPU:0*

Tidx0*
T0*
	keep_dims( *
_output_shapes
:
�
initNoOp"^embedding/embedding_matrix/Assign^conv-maxpool-3/W_conv/Assign^conv-maxpool-3/b_conv/Assign^conv-maxpool-4/W_conv/Assign^conv-maxpool-4/b_conv/Assign^conv-maxpool-5/W_conv/Assign^conv-maxpool-5/b_conv/Assign^output/W_out/Assign^output/b_out/Assign^beta1_power/Assign^beta2_power/Assign'^embedding/embedding_matrix/Adam/Assign)^embedding/embedding_matrix/Adam_1/Assign"^conv-maxpool-3/W_conv/Adam/Assign$^conv-maxpool-3/W_conv/Adam_1/Assign"^conv-maxpool-3/b_conv/Adam/Assign$^conv-maxpool-3/b_conv/Adam_1/Assign"^conv-maxpool-4/W_conv/Adam/Assign$^conv-maxpool-4/W_conv/Adam_1/Assign"^conv-maxpool-4/b_conv/Adam/Assign$^conv-maxpool-4/b_conv/Adam_1/Assign"^conv-maxpool-5/W_conv/Adam/Assign$^conv-maxpool-5/W_conv/Adam_1/Assign"^conv-maxpool-5/b_conv/Adam/Assign$^conv-maxpool-5/b_conv/Adam_1/Assign^output/W_out/Adam/Assign^output/W_out/Adam_1/Assign^output/b_out/Adam/Assign^output/b_out/Adam_1/Assign"/device:CPU:0
`
Training_loss/tagsConst*
dtype0*
valueB BTraining_loss*
_output_shapes
: 
X
Training_lossScalarSummaryTraining_loss/tagsNeg*
T0*
_output_shapes
: 
d
Validation_loss/tagsConst*
dtype0* 
valueB BValidation_loss*
_output_shapes
: 
_
Validation_lossScalarSummaryValidation_loss/tagsMean_2*
T0*
_output_shapes
: 
l
Validation_accuracy/tagsConst*
dtype0*$
valueB BValidation_accuracy*
_output_shapes
: 
g
Validation_accuracyScalarSummaryValidation_accuracy/tagsMean_1*
T0*
_output_shapes
: ""
train_op

Adam"�
	variables��
d
embedding/embedding_matrix:0!embedding/embedding_matrix/Assign!embedding/embedding_matrix/read:0
U
conv-maxpool-3/W_conv:0conv-maxpool-3/W_conv/Assignconv-maxpool-3/W_conv/read:0
U
conv-maxpool-3/b_conv:0conv-maxpool-3/b_conv/Assignconv-maxpool-3/b_conv/read:0
U
conv-maxpool-4/W_conv:0conv-maxpool-4/W_conv/Assignconv-maxpool-4/W_conv/read:0
U
conv-maxpool-4/b_conv:0conv-maxpool-4/b_conv/Assignconv-maxpool-4/b_conv/read:0
U
conv-maxpool-5/W_conv:0conv-maxpool-5/W_conv/Assignconv-maxpool-5/W_conv/read:0
U
conv-maxpool-5/b_conv:0conv-maxpool-5/b_conv/Assignconv-maxpool-5/b_conv/read:0
:
output/W_out:0output/W_out/Assignoutput/W_out/read:0
:
output/b_out:0output/b_out/Assignoutput/b_out/read:0
7
beta1_power:0beta1_power/Assignbeta1_power/read:0
7
beta2_power:0beta2_power/Assignbeta2_power/read:0
s
!embedding/embedding_matrix/Adam:0&embedding/embedding_matrix/Adam/Assign&embedding/embedding_matrix/Adam/read:0
y
#embedding/embedding_matrix/Adam_1:0(embedding/embedding_matrix/Adam_1/Assign(embedding/embedding_matrix/Adam_1/read:0
d
conv-maxpool-3/W_conv/Adam:0!conv-maxpool-3/W_conv/Adam/Assign!conv-maxpool-3/W_conv/Adam/read:0
j
conv-maxpool-3/W_conv/Adam_1:0#conv-maxpool-3/W_conv/Adam_1/Assign#conv-maxpool-3/W_conv/Adam_1/read:0
d
conv-maxpool-3/b_conv/Adam:0!conv-maxpool-3/b_conv/Adam/Assign!conv-maxpool-3/b_conv/Adam/read:0
j
conv-maxpool-3/b_conv/Adam_1:0#conv-maxpool-3/b_conv/Adam_1/Assign#conv-maxpool-3/b_conv/Adam_1/read:0
d
conv-maxpool-4/W_conv/Adam:0!conv-maxpool-4/W_conv/Adam/Assign!conv-maxpool-4/W_conv/Adam/read:0
j
conv-maxpool-4/W_conv/Adam_1:0#conv-maxpool-4/W_conv/Adam_1/Assign#conv-maxpool-4/W_conv/Adam_1/read:0
d
conv-maxpool-4/b_conv/Adam:0!conv-maxpool-4/b_conv/Adam/Assign!conv-maxpool-4/b_conv/Adam/read:0
j
conv-maxpool-4/b_conv/Adam_1:0#conv-maxpool-4/b_conv/Adam_1/Assign#conv-maxpool-4/b_conv/Adam_1/read:0
d
conv-maxpool-5/W_conv/Adam:0!conv-maxpool-5/W_conv/Adam/Assign!conv-maxpool-5/W_conv/Adam/read:0
j
conv-maxpool-5/W_conv/Adam_1:0#conv-maxpool-5/W_conv/Adam_1/Assign#conv-maxpool-5/W_conv/Adam_1/read:0
d
conv-maxpool-5/b_conv/Adam:0!conv-maxpool-5/b_conv/Adam/Assign!conv-maxpool-5/b_conv/Adam/read:0
j
conv-maxpool-5/b_conv/Adam_1:0#conv-maxpool-5/b_conv/Adam_1/Assign#conv-maxpool-5/b_conv/Adam_1/read:0
I
output/W_out/Adam:0output/W_out/Adam/Assignoutput/W_out/Adam/read:0
O
output/W_out/Adam_1:0output/W_out/Adam_1/Assignoutput/W_out/Adam_1/read:0
I
output/b_out/Adam:0output/b_out/Adam/Assignoutput/b_out/Adam/read:0
O
output/b_out/Adam_1:0output/b_out/Adam_1/Assignoutput/b_out/Adam_1/read:0"J
	summaries=
;
Training_loss:0
Validation_loss:0
Validation_accuracy:0"�
trainable_variables��
d
embedding/embedding_matrix:0!embedding/embedding_matrix/Assign!embedding/embedding_matrix/read:0
U
conv-maxpool-3/W_conv:0conv-maxpool-3/W_conv/Assignconv-maxpool-3/W_conv/read:0
U
conv-maxpool-3/b_conv:0conv-maxpool-3/b_conv/Assignconv-maxpool-3/b_conv/read:0
U
conv-maxpool-4/W_conv:0conv-maxpool-4/W_conv/Assignconv-maxpool-4/W_conv/read:0
U
conv-maxpool-4/b_conv:0conv-maxpool-4/b_conv/Assignconv-maxpool-4/b_conv/read:0
U
conv-maxpool-5/W_conv:0conv-maxpool-5/W_conv/Assignconv-maxpool-5/W_conv/read:0
U
conv-maxpool-5/b_conv:0conv-maxpool-5/b_conv/Assignconv-maxpool-5/b_conv/read:0
:
output/W_out:0output/W_out/Assignoutput/W_out/read:0
:
output/b_out:0output/b_out/Assignoutput/b_out/read:0���#       ��wC	'�A�4��A*

Training_loss�DCs�6#       ��wC	Ξ�4��A*

Training_loss C��'#       ��wC	m���4��A*

Training_lossU�.C��+#       ��wC	�V�4��A*

Training_loss�#C��\#       ��wC	���4��A*

Training_loss�$�Bխ�#       ��wC	G<�4��A*

Training_lossP-�B�Pv�#       ��wC	W
j�4��A*

Training_loss
�>CF1e#       ��wC	�i��4��A*

Training_loss}�HC�x�!#       ��wC	�!�4��A	*

Training_loss���BxU#       ��wC	��}�4��A
*

Training_loss�$C����#       ��wC	����4��A*

Training_loss��C("��#       ��wC	�95 5��A*

Training_loss��C�j�#       ��wC	�{� 5��A*

Training_loss��C��g�#       ��wC	� � 5��A*

Training_loss`\�B.�fk#       ��wC	�LI5��A*

Training_loss�;C7L�v#       ��wC	��5��A*

Training_loss�%?B���#       ��wC	B�5��A*

Training_lossR5�B`n�9#       ��wC	?9]5��A*

Training_loss �BS�}�#       ��wC	�*�5��A*

Training_lossOi,C��P�#       ��wC	�5��A*

Training_loss�R�B�^_#       ��wC	�#s5��A*

Training_lossQ"C��	g#       ��wC	M��5��A*

Training_lossI�B��#       ��wC	�+5��A*

Training_loss�k,C�F�)#       ��wC	�'�5��A*

Training_loss�?C8��K#       ��wC	7��5��A*

Training_loss`��B58#       ��wC	��=5��A*

Training_lossE��BP�f�#       ��wC	��5��A*

Training_lossC�C%?��#       ��wC	���5��A*

Training_loss��B�'�I#       ��wC	.sR5��A*

Training_loss}4�B4��#       ��wC	`ͭ5��A*

Training_loss��C���#       ��wC	l
5��A*

Training_loss��B����#       ��wC	�45��A *

Training_loss�чB70�\)       7�_ 	V�5��A *

Validation_accuracy0_?B�Ы%       �6�	Y�5��A *

Validation_lossA`�BA�)�#       ��wC	AW5��A!*

Training_lossc�B���#       ��wC	Ú�5��A"*

Training_lossK�B��#       ��wC	��	5��A#*

Training_loss;��B�I�#       ��wC	�Nx	5��A$*

Training_loss2;�B~�,I#       ��wC	��	5��A%*

Training_lossL:�B)��#       ��wC	
�/
5��A&*

Training_loss_��BK;w�#       ��wC	���
5��A'*

Training_lossl�(C�_8�#       ��wC	&��
5��A(*

Training_loss�Z�B�O�>#       ��wC	�D5��A)*

Training_losspO�B�?,#       ��wC	솠5��A**

Training_lossڬCP�9�#       ��wC	Z�5��A+*

Training_loss0�B�끲#       ��wC	Z�W5��A,*

Training_lossH�B�׿#       ��wC	ɓ�5��A-*

Training_loss��B␡8#       ��wC	_�5��A.*

Training_loss���B��E#       ��wC	�nl5��A/*

Training_loss3I�B���#       ��wC	%�5��A0*

Training_lossf�CY��#       ��wC	�	$5��A1*

Training_loss�ۯBJ��J#       ��wC	BZ�5��A2*

Training_loss4�!CU��#       ��wC	�&�5��A3*

Training_loss�aC�m�#       ��wC	��75��A4*

Training_loss���B��#       ��wC	K�5��A5*

Training_loss��B8Q��#       ��wC	�	�5��A6*

Training_loss�i�B3�~U#       ��wC	"6L5��A7*

Training_loss�#�B�8�#       ��wC	�C�5��A8*

Training_losse��B �Q#       ��wC	$'5��A9*

Training_loss�j�B��R>#       ��wC	�Fa5��A:*

Training_losseC4w�#       ��wC	�5��A;*

Training_loss]C<uR#       ��wC	�c5��A<*

Training_loss��C��D�#       ��wC	5�t5��A=*

Training_loss�6�BO�#       ��wC	���5��A>*

Training_loss��B��.#       ��wC	�-5��A?*

Training_loss���Bd߰#       ��wC	K̈5��A@*

Training_loss�dC(��)       7�_ 	?�N5��A@*

Validation_accuracy�a?99�%       �6�	�N5��A@*

Validation_loss�ʘB�Z�#       ��wC	y�y5��AA*

Training_loss�pzB� #       ��wC	h �5��AB*

Training_lossǠ�B����#       ��wC	�l25��AC*

Training_lossr�Cq8
�#       ��wC	�>�5��AD*

Training_loss6�C��#       ��wC	1��5��AE*

Training_loss���BE�v�#       ��wC	�F5��AF*

Training_loss@��B�Od�#       ��wC	d�5��AG*

Training_loss�B�O�#       ��wC	 �5��AH*

Training_lossё�BH���#       ��wC	;�[5��AI*

Training_loss�C��e2#       ��wC	�F�5��AJ*

Training_loss@YJCg�!#       ��wC	��5��AK*

Training_lossω�B��j�#       ��wC	��n5��AL*

Training_loss���B��#       ��wC	���5��AM*

Training_loss���B����#       ��wC	�@&5��AN*

Training_loss���B�;nC#       ��wC	嗂5��AO*

Training_loss��B�ș�#       ��wC	r�5��AP*

Training_loss]�C�,^�#       ��wC	�;5��AQ*

Training_loss`�BJ@�#       ��wC	?�5��AR*

Training_loss��B��:�#       ��wC		��5��AS*

Training_loss�T�B���	#       ��wC	6�N5��AT*

Training_loss��B��H#       ��wC	�֪5��AU*

Training_losst�.C����#       ��wC	��5��AV*

Training_loss �'C>�}#       ��wC	�xh5��AW*

Training_loss���BI�}[#       ��wC	���5��AX*

Training_loss�0�B`�Xg#       ��wC	�q65��AY*

Training_loss�Cv��#       ��wC	�'�5��AZ*

Training_loss��B���#       ��wC	!�5��A[*

Training_lossǩB��I*#       ��wC	oKd5��A\*

Training_lossś�B�c�#       ��wC	S��5��A]*

Training_loss���BC42m#       ��wC	��X5��A^*

Training_lossƙ�B�n~5#       ��wC	+��5��A_*

Training_loss�NC�
��#       ��wC	�n_ 5��A`*

Training_loss0DC?���)       7�_ 	��k!5��A`*

Validation_accuracy�`?�RD�%       �6�	L�k!5��A`*

Validation_loss�h�Bd���#       ��wC	���!5��Aa*

Training_lossg�B7��#       ��wC	��$"5��Ab*

Training_loss�aB�j#       ��wC	���"5��Ac*

Training_loss��B�*� #       ��wC	
H#5��Ad*

Training_lossRg�B�uy#       ��wC	�ks#5��Ae*

Training_loss�Y=C�ʠ#       ��wC	��#5��Af*

Training_loss���B��P#       ��wC	��5$5��Ag*

Training_loss��Cs�}�#       ��wC	sK�$5��Ah*

Training_loss&�B΍)�#       ��wC	T��$5��Ai*

Training_loss�Cg� �#       ��wC	��i%5��Aj*

Training_loss�B8�2#       ��wC	)��%5��Ak*

Training_loss��BZ@Jq#       ��wC	�z*&5��Al*

Training_loss��C�6Z	#       ��wC	L�&5��Am*

Training_loss�&�B�\ۀ#       ��wC	X��&5��An*

Training_loss�B]WY#       ��wC	�C'5��Ao*

Training_loss�gtB~l#       ��wC	Z��'5��Ap*

Training_loss|2�B�Y#       ��wC	�N�'5��Aq*

Training_loss�,dB[d�#       ��wC	�{h(5��Ar*

Training_lossr�B���o#       ��wC	�:�(5��As*

Training_loss�B9J�#       ��wC	H�K)5��At*

Training_loss�u�Bf��[#       ��wC	y=�)5��Au*

Training_loss�z�B(�pj#       ��wC	<k4*5��Av*

Training_loss���B�P#       ��wC	s0�*5��Aw*

Training_lossj��B2+RE#       ��wC	��
+5��Ax*

Training_loss�C�K�#       ��wC	A��+5��Ay*

Training_lossn��Bj�v]#       ��wC	��+5��Az*

Training_loss���B��O#       ��wC		qj,5��A{*

Training_loss>�B�I��#       ��wC	2��,5��A|*

Training_loss�t�B�|��#       ��wC	�_:-5��A}*

Training_lossຓB;Е#       ��wC	���-5��A~*

Training_loss���B(�ז#       ��wC	�w(.5��A*

Training_loss�J�BŨam$       B+�M	�Ԥ.5��A�*

Training_loss�4�B�N��*       ����	p#�/5��A�*

Validation_accuracy��`?�k �&       sO� 	�%�/5��A�*

Validation_loss(S�B�t�$       B+�M	�05��A�*

Training_loss�r�Bޜvq$       B+�M	��x05��A�*

Training_lossl$�Br5$       B+�M	�Y�05��A�*

Training_loss?@�B���$       B+�M	z�15��A�*

Training_lossqxB��T $       B+�M	mom15��A�*

Training_loss.�C��|�$       B+�M	˿�15��A�*

Training_loss���BT��a$       B+�M	|�025��A�*

Training_lossz�B�ؗ�$       B+�M	 �25��A�*

Training_loss���B���z$       B+�M	į35��A�*

Training_loss*Y�B�ڢ�$       B+�M	�hy35��A�*

Training_lossp!%CS�F�$       B+�M	D��35��A�*

Training_lossUC�B��-c$       B+�M	(245��A�*

Training_loss��B��V$       B+�M	 �45��A�*

Training_lossH�BhA�R$       B+�M	�l�45��A�*

Training_loss棛B��q$       B+�M	L�X55��A�*

Training_loss<�B8$e.$       B+�M	 ��55��A�*

Training_loss��BV���$       B+�M	1%065��A�*

Training_loss6�B�($       B+�M	,��65��A�*

Training_lossr�Bm	�$       B+�M	CY75��A�*

Training_lossس�B@�d$       B+�M	��75��A�*

Training_loss���BT²�$       B+�M	���85��A�*

Training_loss�i�BL�2�$       B+�M	C�95��A�*

Training_loss��B�*Y$       B+�M	?�95��A�*

Training_loss$%�B:8^$       B+�M	{:5��A�*

Training_loss�} CD͸�$       B+�M	(��:5��A�*

Training_loss�}�B<�H�$       B+�M	�
;5��A�*

Training_loss��B�d��$       B+�M	�v�;5��A�*

Training_lossXo�B�MZ�$       B+�M	��<5��A�*

Training_loss���B�Q8?$       B+�M	�dt<5��A�*

Training_loss���B�A}�$       B+�M	�f�<5��A�*

Training_loss��Bg�#5$       B+�M	�O=5��A�*

Training_lossRQ�B�l9$       B+�M	��=5��A�*

Training_loss���B�ɔ*       ����	`�>5��A�*

Validation_accuracykTa?4���&       sO� 	Jb�>5��A�*

Validation_loss�s�B�z_�$       B+�M	|�8?5��A�*

Training_lossz�]B���$       B+�M	�?5��A�*

Training_loss Z�B:aU�$       B+�M	�A-@5��A�*

Training_loss��9Ch2\}$       B+�M	�<b@5��A�*

Training_loss7�BƂ��$       B+�M	�(�@5��A�*

Training_loss���B�r$$       B+�M	P�1A5��A�*

Training_loss'XC��8�$       B+�M	GƕA5��A�*

Training_loss��B��\�$       B+�M	�:�A5��A�*

Training_loss��BQYR�$       B+�M	��]B5��A�*

Training_lossV�C���*$       B+�M	7l�B5��A�*

Training_loss I�B��d$       B+�M	�7C5��A�*

Training_loss���B�w~�$       B+�M	���C5��A�*

Training_lossođB��Ě$       B+�M	�D5��A�*

Training_loss��pB��-*$       B+�M	b�zD5��A�*

Training_loss$��B���E$       B+�M	J~�D5��A�*

Training_lossC����$       B+�M	�ZE5��A�*

Training_loss�C�x�,$       B+�M	�g�E5��A�*

Training_loss� �B�牅$       B+�M	R�0F5��A�*

Training_lossG�VB	O��$       B+�M	^0�F5��A�*

Training_loss.��B��R$       B+�M	�FG5��A�*

Training_loss�$�B]�~�$       B+�M	��fG5��A�*

Training_lossV��B5X�$       B+�M	F	�G5��A�*

Training_losspj[B��Ì$       B+�M	��.H5��A�*

Training_loss��FB�z�$       B+�M	]ëH5��A�*

Training_lossp�XB?i�$       B+�M	׆+I5��A�*

Training_lossPv�BE��1$       B+�M	i7�I5��A�*

Training_loss`3�B
C�A$       B+�M	6W�I5��A�*

Training_loss���BeF��$       B+�M	�TJ5��A�*

Training_loss�¨B#�t$       B+�M	���J5��A�*

Training_losslj�B�YEJ$       B+�M	'�?K5��A�*

Training_loss���Bݙs�$       B+�M	�]�K5��A�*

Training_loss��B$�$       B+�M	u�+L5��A�*

Training_lossPx�B"���*       ����	S�HM5��A�*

Validation_accuracy�`?K�sa&       sO� 	��HM5��A�*

Validation_lossAz�B\S$       B+�M	V}�M5��A�*

Training_loss���B��\^$       B+�M	�CN5��A�*

Training_loss���B8m��$       B+�M	�.�N5��A�*

Training_loss���BF�$       B+�M	�@O5��A�*

Training_lossy��BU��$       B+�M	�~O5��A�*

Training_loss���A�{��$       B+�M	�
�O5��A�*

Training_loss{�B�8:�$       B+�M	�^{P5��A�*

Training_loss�E�B�h�h$       B+�M	�Q5��A�*

Training_loss0X�Bo�ز$       B+�M	ܼhQ5��A�*

Training_loss���B$[��$       B+�M	�A�Q5��A�*

Training_losstDwB�܏$       B+�M	R:R5��A�*

Training_loss��@B۾KR$       B+�M		��R5��A�*

Training_loss0#�B7�S�$       B+�M	j�S5��A�*

Training_loss�b�B�[��$       B+�M	9�|S5��A�*

Training_loss7}�B�ؖ�$       B+�M	��S5��A�*

Training_loss�n�BZG6�$       B+�M	cDgT5��A�*

Training_lossl�B+�'T$       B+�M	�F�T5��A�*

Training_loss�C�B����$       B+�M	�59U5��A�*

Training_loss��B��<$       B+�M	�ܜU5��A�*

Training_loss�A�B�W+l$       B+�M	]��U5��A�*

Training_loss�/sB�|��$       B+�M	-`dV5��A�*

Training_loss6��B;9�$       B+�M	j��V5��A�*

Training_loss(ՔB{�$       B+�M	�BW5��A�*

Training_loss�7�B��iE$       B+�M	��W5��A�*

Training_loss&=�B�}u�$       B+�M	�X5��A�*

Training_loss�U�B�a��$       B+�M	�z�X5��A�*

Training_loss��BV��$       B+�M	��X5��A�*

Training_lossn#�B�D@�$       B+�M	K;EY5��A�*

Training_lossq:�B����$       B+�M	Z��Y5��A�*

Training_loss+֙B�yZ$       B+�M	B�Z5��A�*

Training_loss�RyB�9�$       B+�M	LR{Z5��A�*

Training_loss!^kB�'L$       B+�M	���Z5��A�*

Training_loss���Bի�*       ����	�?�[5��A�*

Validation_accuracykTa?�v�&       sO� 	�A�[5��A�*

Validation_loss�̈BR!>$       B+�M	*:1\5��A�*

Training_losseԻB'I�$$       B+�M	<0�\5��A�*

Training_loss4�B�Z� $       B+�M	.7]5��A�*

Training_loss4��B
#$       B+�M	v�]5��A�*

Training_loss��Bw;�
$       B+�M	���]5��A�*

Training_loss��Ba�J�$       B+�M	�^5��A�*

Training_loss�[YB�ޱT$       B+�M	�s^5��A�*

Training_loss?x�BͶ�r$       B+�M	��^5��A�*

Training_lossz�B��4�$       B+�M	��J_5��A�*

Training_loss���BPˣ�$       B+�M	��_5��A�*

Training_loss��B�+�P$       B+�M	�N0`5��A�*

Training_loss��B�� �$       B+�M	�>�`5��A�*

Training_lossh�_BPɐJ$       B+�M	�(a5��A�*

Training_loss�7�Bk��$       B+�M	_�a5��A�*

Training_lossˊ�B�9��$       B+�M	M�&b5��A�*

Training_loss�&�Bu!Y�$       B+�M	T�b5��A�*

Training_loss���B5?g�$       B+�M	�)�b5��A�*

Training_loss���B�xju$       B+�M	��Cc5��A�*

Training_loss�zcBH�=�$       B+�M	W$�c5��A�*

Training_loss�\�B{�A�$       B+�M	�d5��A�*

Training_lossT�B�0��$       B+�M	�Vvd5��A�*

Training_lossZC�B�q�$       B+�M	'�d5��A�*

Training_loss\+�BF]��$       B+�M	^�]e5��A�*

Training_loss".�B'i�$       B+�M	�{�e5��A�*

Training_loss�ēB�kt�$       B+�M	�.Vf5��A�*

Training_loss���B~��R$       B+�M	H��f5��A�*

Training_loss)��B���$       B+�M	��:g5��A�*

Training_loss�w�B��ٲ$       B+�M	�	�g5��A�*

Training_loss�
MB�t�$       B+�M	�:<h5��A�*

Training_loss�-hB,6�[$       B+�M	d̢h5��A�*

Training_loss���B�#�$       B+�M	��i5��A�*

Training_loss�F�B`j/$       B+�M	�Koi5��A�*

Training_loss`�Bj�<�*       ����	G�Kj5��A�*

Validation_accuracykTa?�	j�&       sO� 	�Lj5��A�*

Validation_lossu�B�%��$       B+�M	���j5��A�*

Training_loss��C
��$       B+�M	 8k5��A�*

Training_loss즫B�♷$       B+�M	���k5��A�*

Training_loss�	qB���$       B+�M	��l5��A�*

Training_lossu�B�b��$       B+�M	��l5��A�*

Training_loss��Bw��$       B+�M	X��l5��A�*

Training_loss���Bj��$       B+�M	1�*m5��A�*

Training_loss\QB��hR$       B+�M	歕m5��A�*

Training_lossZ��B^�Q$       B+�M	_An5��A�*

Training_loss�WB�9:$       B+�M	�Z]n5��A�*

Training_loss[?�BԪ�x$       B+�M	�t�n5��A�*

Training_loss
��B�qKt$       B+�M	H5o5��A�*

Training_loss&ìB�eA�$       B+�M	��o5��A�*

Training_loss�0�B��o$       B+�M	\�p5��A�*

Training_losss��B{�H$       B+�M	d@xp5��A�*

Training_loss�Z�B���$       B+�M	�"�p5��A�*

Training_loss�+�B߃ۑ$       B+�M	�VPq5��A�*

Training_loss���B��`5$       B+�M	gH�q5��A�*

Training_loss��B��;$       B+�M	
�,r5��A�*

Training_loss�BQ G�$       B+�M	��r5��A�*

Training_loss�̮Bż��$       B+�M	K��r5��A�*

Training_loss	��B��B�$       B+�M	<kgs5��A�*

Training_loss��B�q$       B+�M	nR�s5��A�*

Training_loss�,_Bpܓ�$       B+�M	��:t5��A�*

Training_lossS��B|y��$       B+�M	9�t5��A�*

Training_loss���B1�$       B+�M	�u5��A�*

Training_loss���B>�a6$       B+�M	�lru5��A�*

Training_loss~*�B[g��$       B+�M	��u5��A�*

Training_loss�!�B,͋@$       B+�M	��Mv5��A�*

Training_loss>3C�2�$       B+�M	k��v5��A�*

Training_loss�B1B��ʿ$       B+�M	)^9w5��A�*

Training_loss��PB:�ʑ$       B+�M	?�w5��A�*

Training_loss)�B;@0*       ����	��yx5��A�*

Validation_accuracy��a?�3&       sO� 	@�yx5��A�*

Validation_loss�zB��i�$       B+�M	8.�x5��A�*

Training_lossƷ�BT}�q$       B+�M	˞^y5��A�*

Training_loss��FB~8!$       B+�M	���y5��A�*

Training_losspC6_O�$       B+�M	Z�Cz5��A�*

Training_loss7��Bv|M$       B+�M	s�z5��A�*

Training_lossug�B�{��$       B+�M	�~{5��A�*

Training_lossH6�B@IT$       B+�M	��o{5��A�*

Training_loss���B
��$       B+�M	��{5��A�*

Training_loss,�BH��$       B+�M	��|5��A�*

Training_lossw�B�5�$       B+�M	�q|5��A�*

Training_lossX��B�D$       B+�M	�+�|5��A�*

Training_loss��Cf'B$       B+�M	�0L}5��A�*

Training_loss��Bk��$       B+�M	~q�}5��A�*

Training_loss��B���$       B+�M	NA~5��A�*

Training_loss#��B���j$       B+�M	��{~5��A�*

Training_loss�1�B�?�$       B+�M	���~5��A�*

Training_lossܠ�B�&M$       B+�M	pJ5��A�*

Training_lossَoB�[,B$       B+�M	C�5��A�*

Training_lossjS,B�t��$       B+�M	 ��5��A�*

Training_loss�4�BX��$       B+�M	��`�5��A�*

Training_loss̣�B���$       B+�M	D5��A�*

Training_loss��B&��$       B+�M	�#�5��A�*

Training_lossꔂB�lo|$       B+�M	���5��A�*

Training_loss���B����$       B+�M	@ہ5��A�*

Training_loss1�B�J\�$       B+�M	H�6�5��A�*

Training_loss��kB�+��$       B+�M	a㗂5��A�*

Training_loss���B��l$       B+�M	���5��A�*

Training_lossT�B�n��$       B+�M	>P�5��A�*

Training_lossp��BKۻ�$       B+�M	���5��A�*

Training_lossk��B�A��$       B+�M	O�5��A�*

Training_loss&��Bx`ZA$       B+�M	\m�5��A�*

Training_loss�PB��Yl$       B+�M	��Ȅ5��A�*

Training_loss[�IB����*       ����	"��5��A�*

Validation_accuracy��a?�B&m&       sO� 	%��5��A�*

Validation_loss�]�B��2$       B+�M	���5��A�*

Training_loss�A�Bw��K$       B+�M	J�G�5��A�*

Training_lossf��Bk]Rr$       B+�M	u���5��A�*

Training_loss�B�vk:$       B+�M	1y�5��A�*

Training_loss� "Bǔ�Y$       B+�M	�`�5��A�*

Training_loss��CFEՕ$       B+�M	����5��A�*

Training_loss�ǼB�J�$       B+�M	��#�5��A�*

Training_lossK�B��i3$       B+�M	u ��5��A�*

Training_loss%�B��_�$       B+�M	�;��5��A�*

Training_loss�ҀA��o�