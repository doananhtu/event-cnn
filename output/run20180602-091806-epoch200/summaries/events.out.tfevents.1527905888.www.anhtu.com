       �K"	   ���Abrain.Event:2���u7     ,4+3	�9���A"��
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
valueB"c'  �   *
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
�N�
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
�N�
�
embedding/random_uniformAddembedding/random_uniform/mulembedding/random_uniform/min"/device:CPU:0*
T0* 
_output_shapes
:
�N�
�
embedding/embedding_matrix
VariableV2"/device:CPU:0*
dtype0*
shape:
�N�*
	container *
shared_name * 
_output_shapes
:
�N�
�
!embedding/embedding_matrix/AssignAssignembedding/embedding_matrixembedding/random_uniform"/device:CPU:0*
validate_shape(*-
_class#
!loc:@embedding/embedding_matrix*
use_locking(*
T0* 
_output_shapes
:
�N�
�
embedding/embedding_matrix/readIdentityembedding/embedding_matrix"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0* 
_output_shapes
:
�N�
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
valueB	"c'      �       *
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
�N�*    * 
_output_shapes
:
�N�
�
embedding/embedding_matrix/Adam
VariableV2"/device:CPU:0*
	container * 
_output_shapes
:
�N�*
dtype0*
shape:
�N�*-
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
�N�
�
$embedding/embedding_matrix/Adam/readIdentityembedding/embedding_matrix/Adam"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0* 
_output_shapes
:
�N�
�
3embedding/embedding_matrix/Adam_1/Initializer/zerosConst"/device:CPU:0*
dtype0*-
_class#
!loc:@embedding/embedding_matrix*
valueB
�N�*    * 
_output_shapes
:
�N�
�
!embedding/embedding_matrix/Adam_1
VariableV2"/device:CPU:0*
	container * 
_output_shapes
:
�N�*
dtype0*
shape:
�N�*-
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
�N�
�
&embedding/embedding_matrix/Adam_1/readIdentity!embedding/embedding_matrix/Adam_1"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0* 
_output_shapes
:
�N�
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
�N�
�
-Adam/update_embedding/embedding_matrix/AssignAssignembedding/embedding_matrix/Adam,Adam/update_embedding/embedding_matrix/mul_2"/device:CPU:0*
validate_shape(*-
_class#
!loc:@embedding/embedding_matrix*
use_locking( *
T0* 
_output_shapes
:
�N�
�
1Adam/update_embedding/embedding_matrix/ScatterAdd
ScatterAddembedding/embedding_matrix/Adam-Adam/update_embedding/embedding_matrix/Unique,Adam/update_embedding/embedding_matrix/mul_1.^Adam/update_embedding/embedding_matrix/Assign"/device:CPU:0*
Tindices0*
use_locking( *
T0* 
_output_shapes
:
�N�*-
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
�N�
�
/Adam/update_embedding/embedding_matrix/Assign_1Assign!embedding/embedding_matrix/Adam_1,Adam/update_embedding/embedding_matrix/mul_5"/device:CPU:0*
validate_shape(*-
_class#
!loc:@embedding/embedding_matrix*
use_locking( *
T0* 
_output_shapes
:
�N�
�
3Adam/update_embedding/embedding_matrix/ScatterAdd_1
ScatterAdd!embedding/embedding_matrix/Adam_1-Adam/update_embedding/embedding_matrix/Unique,Adam/update_embedding/embedding_matrix/mul_40^Adam/update_embedding/embedding_matrix/Assign_1"/device:CPU:0*
Tindices0*
use_locking( *
T0* 
_output_shapes
:
�N�*-
_class#
!loc:@embedding/embedding_matrix
�
-Adam/update_embedding/embedding_matrix/Sqrt_1Sqrt3Adam/update_embedding/embedding_matrix/ScatterAdd_1"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0* 
_output_shapes
:
�N�
�
,Adam/update_embedding/embedding_matrix/mul_6Mul.Adam/update_embedding/embedding_matrix/truediv1Adam/update_embedding/embedding_matrix/ScatterAdd"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0* 
_output_shapes
:
�N�
�
*Adam/update_embedding/embedding_matrix/addAdd-Adam/update_embedding/embedding_matrix/Sqrt_1Adam/epsilon"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0* 
_output_shapes
:
�N�
�
0Adam/update_embedding/embedding_matrix/truediv_1RealDiv,Adam/update_embedding/embedding_matrix/mul_6*Adam/update_embedding/embedding_matrix/add"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0* 
_output_shapes
:
�N�
�
0Adam/update_embedding/embedding_matrix/AssignSub	AssignSubembedding/embedding_matrix0Adam/update_embedding/embedding_matrix/truediv_1"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
use_locking( *
T0* 
_output_shapes
:
�N�
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
: "��}\     ��#	�
S���AJ�
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
valueB"c'  �   *
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
�N�
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
�N�
�
embedding/random_uniformAddembedding/random_uniform/mulembedding/random_uniform/min"/device:CPU:0*
T0* 
_output_shapes
:
�N�
�
embedding/embedding_matrix
VariableV2"/device:CPU:0*
dtype0*
shape:
�N�*
shared_name *
	container * 
_output_shapes
:
�N�
�
!embedding/embedding_matrix/AssignAssignembedding/embedding_matrixembedding/random_uniform"/device:CPU:0*
validate_shape(*-
_class#
!loc:@embedding/embedding_matrix*
use_locking(*
T0* 
_output_shapes
:
�N�
�
embedding/embedding_matrix/readIdentityembedding/embedding_matrix"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0* 
_output_shapes
:
�N�
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
valueB	"c'      �       *
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
�N�*    * 
_output_shapes
:
�N�
�
embedding/embedding_matrix/Adam
VariableV2"/device:CPU:0*
	container * 
_output_shapes
:
�N�*
dtype0*
shape:
�N�*-
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
�N�
�
$embedding/embedding_matrix/Adam/readIdentityembedding/embedding_matrix/Adam"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0* 
_output_shapes
:
�N�
�
3embedding/embedding_matrix/Adam_1/Initializer/zerosConst"/device:CPU:0*
dtype0*-
_class#
!loc:@embedding/embedding_matrix*
valueB
�N�*    * 
_output_shapes
:
�N�
�
!embedding/embedding_matrix/Adam_1
VariableV2"/device:CPU:0*
	container * 
_output_shapes
:
�N�*
dtype0*
shape:
�N�*-
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
�N�
�
&embedding/embedding_matrix/Adam_1/readIdentity!embedding/embedding_matrix/Adam_1"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0* 
_output_shapes
:
�N�
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
�N�
�
-Adam/update_embedding/embedding_matrix/AssignAssignembedding/embedding_matrix/Adam,Adam/update_embedding/embedding_matrix/mul_2"/device:CPU:0*
validate_shape(*-
_class#
!loc:@embedding/embedding_matrix*
use_locking( *
T0* 
_output_shapes
:
�N�
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
�N�
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
�N�
�
/Adam/update_embedding/embedding_matrix/Assign_1Assign!embedding/embedding_matrix/Adam_1,Adam/update_embedding/embedding_matrix/mul_5"/device:CPU:0*
validate_shape(*-
_class#
!loc:@embedding/embedding_matrix*
use_locking( *
T0* 
_output_shapes
:
�N�
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
�N�
�
-Adam/update_embedding/embedding_matrix/Sqrt_1Sqrt3Adam/update_embedding/embedding_matrix/ScatterAdd_1"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0* 
_output_shapes
:
�N�
�
,Adam/update_embedding/embedding_matrix/mul_6Mul.Adam/update_embedding/embedding_matrix/truediv1Adam/update_embedding/embedding_matrix/ScatterAdd"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0* 
_output_shapes
:
�N�
�
*Adam/update_embedding/embedding_matrix/addAdd-Adam/update_embedding/embedding_matrix/Sqrt_1Adam/epsilon"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0* 
_output_shapes
:
�N�
�
0Adam/update_embedding/embedding_matrix/truediv_1RealDiv,Adam/update_embedding/embedding_matrix/mul_6*Adam/update_embedding/embedding_matrix/add"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
T0* 
_output_shapes
:
�N�
�
0Adam/update_embedding/embedding_matrix/AssignSub	AssignSubembedding/embedding_matrix0Adam/update_embedding/embedding_matrix/truediv_1"/device:CPU:0*-
_class#
!loc:@embedding/embedding_matrix*
use_locking( *
T0* 
_output_shapes
:
�N�
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
output/b_out:0output/b_out/Assignoutput/b_out/read:0F��#       ��wC	�iژ��A*

Training_loss�`�C�;׃#       ��wC	��J���A*

Training_losssєC�z.#       ��wC	�n����A*

Training_loss�L�Cd��I#       ��wC	̙���A*

Training_loss���C��mJ#       ��wC	��j���A*

Training_loss
��CĠ1�#       ��wC	��К��A*

Training_loss/5�CÓ7�#       ��wC	O 5���A*

Training_lossT�SC�t�#       ��wC	괖���A*

Training_loss���Cݻ��#       ��wC	�t���A	*

Training_loss��Cز�#       ��wC	'MV���A
*

Training_loss5orC�2�#       ��wC	~�����A*

Training_loss�>�C�M��#       ��wC	�����A*

Training_lossb�C}#)z#       ��wC	k|���A*

Training_loss�nxC ��#       ��wC	iVٝ��A*

Training_loss�heC�jg#       ��wC	�56���A*

Training_lossEnC�(Q�#       ��wC	A�����A*

Training_loss%��Cb���#       ��wC	+����A*

Training_loss{sXC��U�#       ��wC	�^L���A*

Training_loss�~�CY�+�#       ��wC	� ����A*

Training_loss1��Cv9#       ��wC	�q'���A*

Training_loss7l�C�R	#       ��wC	嶒���A*

Training_loss��oC���5#       ��wC	r����A*

Training_lossאC���#       ��wC	�Y���A*

Training_lossD`CܥF�#       ��wC	)�ߡ��A*

Training_lossi�iC]���#       ��wC	�v���A*

Training_lossefxC���#       ��wC	r����A*

Training_loss�u�C
#       ��wC	�p����A*

Training_loss+?bC���#       ��wC	 ����A*

Training_loss��nC�:��#       ��wC	1��A*

Training_lossTd]C% ��#       ��wC	����A*

Training_lossk�C���<#       ��wC	������A*

Training_loss��C���7#       ��wC	m<���A *

Training_loss�-C��O#       ��wC	�y����A!*

Training_lossխLC"��p#       ��wC	
���A"*

Training_lossp��C�_mi#       ��wC	�>����A#*

Training_lossH[}C�q].#       ��wC	Ѐ���A$*

Training_loss�ŲCC��#       ��wC	Id����A%*

Training_loss	��C�}'U#       ��wC	<0���A&*

Training_loss�RNC��#       ��wC	������A'*

Training_lossTC��i#       ��wC	�I���A(*

Training_loss8(dCa�GQ#       ��wC	�ͪ��A)*

Training_loss�W�C���C#       ��wC	w�O���A**

Training_loss@��C�,=�#       ��wC	��ѫ��A+*

Training_loss�GmC����#       ��wC	['T���A,*

Training_loss$hKC�cX#       ��wC	�K٬��A-*

Training_loss� �C����#       ��wC	��Z���A.*

Training_loss¦~C����#       ��wC	3ۭ��A/*

Training_loss�5ECҰ�q#       ��wC	'�\���A0*

Training_loss��|C��%#       ��wC	?�ݮ��A1*

Training_loss�JC쐗�#       ��wC	�Z���A2*

Training_losstcC��8�)       7�_ 	~Th���A2*

Validation_accuracyss9?2�e�%       �6�	%Yh���A2*

Validation_loss�M�B�ǀ#       ��wC	�K(���A3*

Training_loss�faC���#       ��wC	c)����A4*

Training_loss��eC֥(J#       ��wC	��+���A5*

Training_lossHyCOσ#       ��wC	wH����A6*

Training_loss�*LCAR31#       ��wC	
�(���A7*

Training_lossՅC�J�#       ��wC	�-����A8*

Training_loss}�GCj<Fq#       ��wC	�W0���A9*

Training_loss�jCAJ�V#       ��wC	������A:*

Training_lossf�eC>��y#       ��wC	��1���A;*

Training_loss(p�C��`#       ��wC	ɬ����A<*

Training_loss���Ca��#       ��wC	i0���A=*

Training_lossqb�CB�#       ��wC	����A>*

Training_loss\mC���#       ��wC	6���A?*

Training_lossA6TC��Z$#       ��wC	������A@*

Training_loss}�C	rUb#       ��wC	�y4���AA*

Training_loss��VC�1��#       ��wC	������AB*

Training_lossZ��C0�#       ��wC	�6���AC*

Training_lossJriC�t#       ��wC	�F����AD*

Training_loss!_C
yF�#       ��wC	�DE���AE*

Training_loss?EC��I#       ��wC	�ź��AF*

Training_lossɺ<C����#       ��wC	��F���AG*

Training_loss`quC�\\�#       ��wC	�U̻��AH*

Training_loss�~9C'��#       ��wC	��L���AI*

Training_loss"�dCY��#       ��wC	Xqм��AJ*

Training_lossj;oC���#       ��wC	=_S���AK*

Training_loss�=QCk��q#       ��wC	��׽��AL*

Training_loss��HC+[�#       ��wC	u:[���AM*

Training_lossHvC05�l#       ��wC	����AN*

Training_loss�\C9��#       ��wC	o-^���AO*

Training_lossh�rC�V�#       ��wC	�����AP*

Training_loss�EC/׿f#       ��wC	�q���AQ*

Training_loss�SCp���#       ��wC	�s���AR*

Training_lossZ�Cy|F�#       ��wC	/�����AS*

Training_loss;.lC�^H�#       ��wC	�6���AT*

Training_lossH'7C��G#       ��wC	;Ñ���AU*

Training_loss�(nC��6�#       ��wC	�����AV*

Training_lossH�^CIJ�V#       ��wC	�q����AW*

Training_loss�L�C B�#       ��wC	�N"���AX*

Training_loss��wCYV��#       ��wC	�����AY*

Training_lossU�JCj{�#       ��wC	�R*���AZ*

Training_loss��uC9�Ue#       ��wC	Ƥ���A[*

Training_loss�&hCވ�#       ��wC	ƿ(���A\*

Training_loss��YC�*Y�#       ��wC	�z����A]*

Training_lossne6C����#       ��wC	hZ-���A^*

Training_lossz=C��F#       ��wC	������A_*

Training_loss��LC����#       ��wC	?�9���A`*

Training_loss:YC���b#       ��wC	�?����Aa*

Training_lossnq7CPق#       ��wC	�,;���Ab*

Training_loss��fC��9�#       ��wC	������Ac*

Training_loss�SC��g#       ��wC	Kv?���Ad*

Training_loss>@?C���f)       7�_ 	�qS���Ad*

Validation_accuracy��;?ܳ%       �6�	�uS���Ad*

Validation_loss�0�B�'�3#       ��wC	� ���Ae*

Training_loss�s?Cʚ��#       ��wC	,����Af*

Training_loss<�C�Ty�#       ��wC	t�(���Ag*

Training_loss�BDC�z0f#       ��wC	R�����Ah*

Training_lossDz�C��#       ��wC	:;F���Ai*

Training_lossxJCX�$�#       ��wC	*�����Aj*

Training_loss��kCۍP~#       ��wC	��X���Ak*

Training_loss� <C�%#       ��wC	������Al*

Training_loss�>VC��#       ��wC	�gm���Am*

Training_lossQ�7C&S
#       ��wC	�����An*

Training_loss�AC,��#       ��wC	q {���Ao*

Training_loss*CgC�ؑ#       ��wC	�q���Ap*

Training_loss�mrC�V�m#       ��wC	�Ή���Aq*

Training_loss��5C����#       ��wC	�-���Ar*

Training_loss5'C��#       ��wC	������As*

Training_loss{�dCl/M#       ��wC	����At*

Training_losseC'��_#       ��wC	 8����Au*

Training_loss��zCvT��#       ��wC	(*&���Av*

Training_lossv�DC�8v#       ��wC	=a����Aw*

Training_lossun�Ci/��#       ��wC	ۇ0���Ax*

Training_lossƗdC�.�^#       ��wC	����Ay*

Training_loss��?Cr	Yr#       ��wC	,EA���Az*

Training_loss,%C_0�#       ��wC	I�����A{*

Training_loss�r\C�?#       ��wC	&�P���A|*

Training_lossVIdC;��J#       ��wC	N����A}*

Training_lossj�sC� �#       ��wC	u�J���A~*

Training_loss"�\C_�	�#       ��wC	؁����A*

Training_lossP�OCu�L$       B+�M	�'���A�*

Training_loss�MC��&$       B+�M	en����A�*

Training_lossc�0C(	4
$       B+�M	rp����A�*

Training_loss�4VC�|�$       B+�M	*RO���A�*

Training_loss��FC	`X�$       B+�M	�����A�*

Training_loss�*DC͜*$       B+�M	�����A�*

Training_loss�1\C�`��$       B+�M	jMe���A�*

Training_lossn DCx, �$       B+�M	l�����A�*

Training_loss&iC�#�$       B+�M	����A�*

Training_loss��sC���$       B+�M	�z���A�*

Training_lossEcbC �#�$       B+�M	�	����A�*

Training_loss9�C�J�h$       B+�M	�64���A�*

Training_loss�P�Ca�V$       B+�M	�-����A�*

Training_loss1�]CR4Vq$       B+�M	�����A�*

Training_loss
EC��>�$       B+�M	(�G���A�*

Training_loss(�FC���$$       B+�M	�ף���A�*

Training_loss-&KC9s$       B+�M	�����A�*

Training_lossh�5C���$       B+�M	��[���A�*

Training_loss�RLC���$       B+�M	�u����A�*

Training_loss�kSC��M!$       B+�M	Um���A�*

Training_loss�u!C��U-$       B+�M	~�p���A�*

Training_lossT Cr���$       B+�M	à����A�*

Training_loss�:C�¬$       B+�M	��(���A�*

Training_loss�RC_��*       ����	�����A�*

Validation_accuracyss>?4n�&       sO� 	������A�*

Validation_loss ��B
��b$       B+�M	�S����A�*

Training_lossV2C�Oӆ$       B+�M	�����A�*

Training_loss�Z[C_�t$       B+�M	�;���A�*

Training_lossd�5C $�$       B+�M	kd����A�*

Training_loss�ZUCr���$       B+�M	�)����A�*

Training_lossMMJCZ��$       B+�M	�O���A�*

Training_loss m'C��m�$       B+�M	����A�*

Training_loss��vCXhb�$       B+�M	ӄ���A�*

Training_lossU�QC��o$       B+�M	��d���A�*

Training_loss�\PCL�{$       B+�M	?�����A�*

Training_loss��qCJ���$       B+�M	i���A�*

Training_loss�nyC\��K$       B+�M	V�z���A�*

Training_loss��0C-���$       B+�M	����A�*

Training_loss��C�Z�\$       B+�M	^h3���A�*

Training_loss�C���$       B+�M	�z����A�*

Training_loss+wC�,�$       B+�M	,g����A�*

Training_lossS!uC���$       B+�M	6�G���A�*

Training_lossR6C(�[f$       B+�M	6<����A�*

Training_lossirgC�lT$       B+�M	�A ���A�*

Training_loss�P�C�b�$       B+�M	��\���A�*

Training_loss^~6C*��$       B+�M	������A�*

Training_lossG5C�O�$       B+�M	�|���A�*

Training_loss�nCqdE$       B+�M	7�q���A�*

Training_lossR8C����$       B+�M	������A�*

Training_loss)�WC��$       B+�M	|�)���A�*

Training_loss�OQC����$       B+�M	,Յ���A�*

Training_loss�P0C4��$       B+�M	u�����A�*

Training_loss�HxC唭G$       B+�M	�u>���A�*

Training_loss��C�G$       B+�M	N����A�*

Training_loss�,=C5� $       B+�M	�����A�*

Training_lossc�GC}�E�$       B+�M	~�Q���A�*

Training_lossLaKCUz[$       B+�M	�9����A�*

Training_loss�'hC�F��$       B+�M	o�	���A�*

Training_loss�*CB�c$       B+�M	�ze���A�*

Training_loss��Ch���$       B+�M	�����A�*

Training_loss��?CX8��$       B+�M	�����A�*

Training_loss�-PC�Nw$       B+�M	G�y���A�*

Training_lossmS@C���Z$       B+�M	7�����A�*

Training_lossXaC�a$       B+�M	Y�1���A�*

Training_loss�?NC\��$       B+�M	�����A�*

Training_lossv�C���$       B+�M	�e����A�*

Training_loss	�[C��v�$       B+�M	�D���A�*

Training_loss��0C/��$       B+�M	�"����A�*

Training_lossN/C9���$       B+�M	V����A�*

Training_loss;J\C�ҸN$       B+�M	��X���A�*

Training_loss��C@-N�$       B+�M	�9����A�*

Training_loss3L&C	��E$       B+�M	�����A�*

Training_lossƜ#Cg~B$       B+�M	=�m���A�*

Training_loss@�[C�^��$       B+�M	%�����A�*

Training_lossi9C�;&�$       B+�M	�~$���A�*

Training_loss^1(CK%�*       ����	������A�*

Validation_accuracy@?�|��&       sO� 	������A�*

Validation_loss�o�BC�-$       B+�M	������A�*

Training_loss0�6C ���$       B+�M	������A�*

Training_loss��?C9�'$       B+�M	�[E���A�*

Training_losso�kC,�f$       B+�M	�����A�*

Training_loss��JCF�y�$       B+�M	Qg����A�*

Training_loss#��C�)L$       B+�M	Y���A�*

Training_losszC�tw$       B+�M	������A�*

Training_lossu�HC�l$       B+�M	�	���A�*

Training_lossX�>C�w$       B+�M	��l���A�*

Training_loss�>C���$       B+�M	ۣ����A�*

Training_loss�QC�V�$       B+�M	��$���A�*

Training_lossڛ4C�ȩ$       B+�M	S�����A�*

Training_loss�|BC�|�j$       B+�M	|����A�*

Training_lossl@�C\hN$       B+�M	��7���A�*

Training_loss;wQC��+($       B+�M	�����A�*

Training_loss�;IC`+Y�$       B+�M	������A�*

Training_loss��9C��!S$       B+�M	.sK���A�*

Training_loss��7C�]�$       B+�M	K=����A�*

Training_loss��7C}i�$       B+�M	���A�*

Training_loss�5%C�Rv$       B+�M	d[`���A�*

Training_loss��9C#.��$       B+�M	�I����A�*

Training_loss	�#C�X�I$       B+�M	l=���A�*

Training_loss/�cC���$       B+�M	l�s���A�*

Training_loss_U C'x6�$       B+�M	b-����A�*

Training_lossX�OCEuh$       B+�M	��,���A�*

Training_lossP�BJ��u$       B+�M	������A�*

Training_loss��GC�-]$       B+�M	������A�*

Training_loss
c%C�p��$       B+�M	/�@ ���A�*

Training_loss�cWCnW�$       B+�M	N�� ���A�*

Training_loss?0C�L�$       B+�M	�F� ���A�*

Training_lossRC"���$       B+�M	=�S���A�*

Training_loss0m4C�.��$       B+�M	������A�*

Training_loss�d5Cd��$       B+�M	%����A�*

Training_loss�C�%�B$       B+�M	T6k���A�*

Training_loss�<UC����$       B+�M	����A�*

Training_lossv�BC����$       B+�M	3o#���A�*

Training_loss@�%CMr�W$       B+�M	����A�*

Training_loss�JC���+$       B+�M	z�����A�*

Training_loss�W�CM�w�$       B+�M	�8���A�*

Training_loss�iNC	R}�$       B+�M	�����A�*

Training_loss�4FC�9�Q$       B+�M	E�����A�*

Training_loss�9yC�&�$       B+�M	�L���A�*

Training_loss
vaC��!�$       B+�M	Lm����A�*

Training_loss$bCW��$       B+�M	+����A�*

Training_loss+,Cn|oP$       B+�M	|�a���A�*

Training_loss�5C?���$       B+�M	ro����A�*

Training_lossl�@C���($       B+�M	S����A�*

Training_loss��C���$       B+�M	�>v���A�*

Training_loss��@C��^C$       B+�M	�����A�*

Training_loss�6?C�)�$       B+�M	��-���A�*

Training_loss��#C5K*       ����	������A�*

Validation_accuracyIIA?�L��&       sO� 	������A�*

Validation_loss��Bԃu�$       B+�M	7l�	���A�*

Training_loss�.C(�Q$       B+�M	�Z�	���A�*

Training_loss�	Cf��$       B+�M	��S
���A�*

Training_loss��BC�@�$       B+�M	)&�
���A�*

Training_loss7TC�Wb$       B+�M	F����A�*

Training_loss�B`Cq���$       B+�M	��g���A�*

Training_loss��XCN��$       B+�M	�����A�*

Training_lossp2'C8�d�$       B+�M	�5���A�*

Training_lossXe>CK:�$       B+�M	��z���A�*

Training_loss�bC)N�
$       B+�M	�[����A�*

Training_loss�lvC-U�R$       B+�M	g�2���A�*

Training_loss��VC����$       B+�M	
����A�*

Training_loss(�]C���$       B+�M	������A�*

Training_loss�-C�V�$       B+�M	}�F���A�*

Training_loss��	C_[;($       B+�M	:\����A�*

Training_lossH=[C���$       B+�M	~� ���A�*

Training_loss1QCW�w�$       B+�M	��[���A�*

Training_loss�0C�j��$       B+�M	�H����A�*

Training_loss�� C��B{$       B+�M	Ɔ���A�*

Training_loss��/CTcn�$       B+�M	�lp���A�*

Training_lossxr(CA�7a$       B+�M	����A�*

Training_loss�jbC?�ii$       B+�M	#(���A�*

Training_loss�C�W�b$       B+�M	q����A�*

Training_lossY2C�y4�$       B+�M	������A�*

Training_lossJ�BC���$       B+�M	e�@���A�*

Training_loss2/C�3�$       B+�M	�A����A�*

Training_loss��CC3�q|$       B+�M	(����A�*

Training_loss��UC�xa$       B+�M	�CU���A�*

Training_loss"6C�P�P$       B+�M	i6����A�*

Training_loss�YC&-�$       B+�M	�����A�*

Training_lossb�EC-� $       B+�M	#/k���A�*

Training_loss�ACo�(�$       B+�M	9�����A�*

Training_loss@7C>�G@$       B+�M	31#���A�*

Training_loss��OC8_خ$       B+�M	[�~���A�*

Training_loss�&AC��֠$       B+�M	:y����A�*

Training_loss�/UC����$       B+�M	R6���A�*

Training_lossZiC���$       B+�M	7����A�*

Training_loss���C�g��$       B+�M	`����A�*

Training_loss�hC�#d$       B+�M	+J���A�*

Training_loss�VCt+$       B+�M	(E����A�*

Training_loss`�BC�pY$       B+�M	|c���A�*

Training_loss�<Cu wn$       B+�M	�K^���A�*

Training_loss�O$C>h�w$       B+�M	������A�*

Training_loss`P1C�e��$       B+�M	�����A�*

Training_loss�\C_
�$       B+�M	7�r���A�*

Training_loss
{KC@'$       B+�M	������A�*

Training_loss��'C|�|!$       B+�M	Tp+���A�*

Training_loss��C�e�$       B+�M	&����A�*

Training_loss�PC{Xp�$       B+�M	�w����A�*

Training_loss�&1C���-$       B+�M	�J@���A�*

Training_loss��TCu|K�*       ����	q����A�*

Validation_accuracy C?>�xD&       sO� 	G����A�*

Validation_loss�p�B\��q$       B+�M	uʬ���A�*

Training_losst�?C�4�$       B+�M	�]	���A�*

Training_loss��5C��y$       B+�M	�	e���A�*

Training_loss��1C�~y$       B+�M	�a����A�*

Training_loss02/C�Í$       B+�M	>����A�*

Training_loss#�LC�d�F$       B+�M	Py���A�*

Training_loss�r$CY���$       B+�M	k�����A�*

Training_loss��]C=4�$       B+�M	}u1���A�*

Training_loss��+C���$       B+�M	&�����A�*

Training_loss��B�؉�$       B+�M	������A�*

Training_loss�dNC��r$       B+�M	�E ���A�*

Training_losse�C��y$       B+�M	cG� ���A�*

Training_loss�!,C���$       B+�M	n�� ���A�*

Training_loss��;Cf%�$       B+�M	��X!���A�*

Training_loss�A>Cq�$O$       B+�M	��!���A�*

Training_loss(�EC��3>$       B+�M	3�"���A�*

Training_lossLsaC�J:8$       B+�M	T�m"���A�*

Training_loss#kC�U�<$       B+�M	���"���A�*

Training_lossG&qC��T�$       B+�M	��&#���A�*

Training_loss��fC���$       B+�M	U/�#���A�*

Training_lossr�aC^Ph$       B+�M	�$�#���A�*

Training_lossTCCf-�H$       B+�M	n<$���A�*

Training_loss1�GC2a(�$       B+�M	���$���A�*

Training_loss�\CC���$       B+�M	��$���A�*

Training_loss�YpCJ�S�$       B+�M	�W%���A�*

Training_lossx�-C��b!$       B+�M	�ٲ%���A�*

Training_loss�C�_��$       B+�M	��&���A�*

Training_loss��C�8��$       B+�M	6j&���A�*

Training_loss�J8C���$       B+�M	���&���A�*

Training_loss�iCkDf�$       B+�M	G!'���A�*

Training_lossN�.C �B$       B+�M	mV}'���A�*

Training_loss�$CO��`$       B+�M	2��'���A�*

Training_loss��?C$��Q$       B+�M	��9(���A�*

Training_lossz�C�W�R$       B+�M	k��(���A�*

Training_lossK��B���$       B+�M	���(���A�*

Training_lossP�8C���$       B+�M	�8O)���A�*

Training_loss�*C.i$       B+�M	��)���A�*

Training_loss�]!C�R�z$       B+�M	f�*���A�*

Training_loss�"@C���H$       B+�M	*�c*���A�*

Training_loss��0C,^v$       B+�M	n߿*���A�*

Training_loss�C��Wh$       B+�M	�+���A�*

Training_lossr�=C+�[�$       B+�M	��w+���A�*

Training_loss�U6C���$       B+�M	�E�+���A�*

Training_lossJCLv"$       B+�M	VD1,���A�*

Training_loss~+C݉�$       B+�M	m�,���A�*

Training_loss_ C�f-$       B+�M	���,���A�*

Training_losst�5C:�W�$       B+�M	�RD-���A�*

Training_lossPCl�$       B+�M	b�-���A�*

Training_lossE��B{MOV$       B+�M	�(�-���A�*

Training_loss$C>�$       B+�M	�QX.���A�*

Training_loss��/C߂��*       ����	G /���A�*

Validation_accuracy��D?S��&       sO� 	S#/���A�*

Validation_loss�ӘBT�TH$       B+�M	���/���A�*

Training_loss~�C�h��$       B+�M	!�.0���A�*

Training_loss�C=��$       B+�M	�ڊ0���A�*

Training_lossPj4CW��$       B+�M	_(�0���A�*

Training_lossڑDCm�n$       B+�M	PC1���A�*

Training_loss�CĐ$       B+�M	��1���A�*

Training_lossZAC�q�$       B+�M	@��1���A�*

Training_lossv0CQ�}9$       B+�M	�@V2���A�*

Training_lossF <C�:Y$       B+�M	r�2���A�*

Training_loss�1C��*$       B+�M	�3���A�*

Training_loss.4C �e�$       B+�M	k3���A�*

Training_loss��0Ch�$       B+�M	v��3���A�*

Training_loss��1C�=V�$       B+�M	&p"4���A�*

Training_loss��*C76$       B+�M	��~4���A�*

Training_loss�DCb�I$       B+�M	v7�4���A�*

Training_loss��CĦf$       B+�M	5C65���A�*

Training_lossAPC@7'a$       B+�M	�d�5���A�*

Training_lossr�C3?�$       B+�M	���5���A�*

Training_lossC��^$       B+�M	/iJ6���A�*

Training_loss�4C����$       B+�M	8g�6���A�*

Training_loss�/C&��{$       B+�M	817���A�*

Training_loss�4Ca���$       B+�M	W$^7���A�*

Training_loss'CuO��$       B+�M	�\�7���A�*

Training_loss��!C��$       B+�M	M�8���A�*

Training_loss/�CAE�$       B+�M	]2r8���A�*

Training_loss��tC=�(=$       B+�M	̛�8���A�*

Training_loss�#C�'5$       B+�M	�*9���A�*

Training_lossH!8C�ꡣ$       B+�M	T�9���A�*

Training_loss;'C��Q�$       B+�M	-!�9���A�*

Training_loss��C��$       B+�M	��>:���A�*

Training_loss�uC��o$       B+�M	�ʚ:���A�*

Training_loss�%C܍+�$       B+�M	=�:���A�*

Training_loss�}AC�-ib$       B+�M	�xS;���A�*

Training_lossfVACڳ�$       B+�M	�q�;���A�*

Training_loss�P.C�]H,$       B+�M	%�<���A�*

Training_loss� C�:��$       B+�M	�g<���A�*

Training_lossX�SC:�+�$       B+�M	���<���A�*

Training_lossRY!Ch��$       B+�M	�W=���A�*

Training_loss=SC؉Ki$       B+�M	4-{=���A�*

Training_loss��/CNj�$       B+�M	��=���A�*

Training_loss�%C���o$       B+�M	uZ3>���A�*

Training_lossD-"C��.$       B+�M	�!�>���A�*

Training_loss��9C!9��$       B+�M	%�>���A�*

Training_loss��.C-�o$       B+�M	�G?���A�*

Training_loss/0C��$       B+�M	�ۢ?���A�*

Training_lossa�!C�\Ak$       B+�M	�P�?���A�*

Training_losse�YC)��%$       B+�M	R_Z@���A�*

Training_loss�C����$       B+�M	%�@���A�*

Training_lossV�C�{�$       B+�M	��A���A�*

Training_loss&19C>��$       B+�M	��pA���A�*

Training_loss{_�BQ� *       ����	n�5B���A�*

Validation_accuracy F?X�e�&       sO� 	��5B���A�*

Validation_lossl6�Bn�N\$       B+�M	]�B���A�*

Training_loss1�CXy4,$       B+�M	�4RC���A�*

Training_loss�@C�w�$       B+�M	Q��C���A�*

Training_loss��.C8�&$       B+�M	*�	D���A�*

Training_loss��C��n�$       B+�M	w�eD���A�*

Training_loss�WC�<�S$       B+�M	b��D���A�*

Training_loss��GC�m6$       B+�M	��E���A�*

Training_lossR]C�
*W$       B+�M	��xE���A�*

Training_loss,k0C�<�{$       B+�M	���E���A�*

Training_loss�\0C�$[�$       B+�M	O1F���A�*

Training_loss�F7C��a$       B+�M	���F���A�*

Training_lossbKCRzs$       B+�M	!�F���A�*

Training_loss��CЃȽ$       B+�M	O�DG���A�*

Training_loss��@C?
��$       B+�M	' G���A�*

Training_lossq�/C�.@$       B+�M	H��G���A�*

Training_loss/�'C`u��$       B+�M	��XH���A�*

Training_loss�/C����$       B+�M	��H���A�*

Training_loss6Cjح$       B+�M	�+I���A�*

Training_loss�/C��\$       B+�M	b�kI���A�*

Training_lossΔ(CG�$       B+�M	��I���A�*

Training_loss]�#C��9$       B+�M	�$J���A�*

Training_loss	�C*���$       B+�M	�}�J���A�*

Training_lossh�C3\,$       B+�M	�8�J���A�*

Training_loss�$C��LQ$       B+�M	�>8K���A�*

Training_loss@4C�[�$       B+�M	�3�K���A�*

Training_loss?-C��m$       B+�M	���K���A�*

Training_losst<GC;��3$       B+�M	�KL���A�*

Training_loss�"+C+$       B+�M	��L���A�*

Training_loss*7=C���@$       B+�M	�kM���A�*

Training_loss���Bև)$       B+�M	�w`M���A�*

Training_lossοC�e�[$       B+�M	 �M���A�*

Training_loss�� C��$       B+�M	X�N���A�*

Training_loss`BCO�$$       B+�M	f-wN���A�*

Training_loss~[C���$       B+�M	"��N���A�*

Training_loss/J Cpo�I$       B+�M	��1O���A�*

Training_loss�vC��\�$       B+�M	W�O���A�*

Training_loss`�0C%��$       B+�M	��O���A�*

Training_loss�C~k��$       B+�M	�FP���A�*

Training_loss��+Cs �X$       B+�M	]��P���A�*

Training_loss6,C���$       B+�M	�X�P���A�*

Training_losss�C��3�$       B+�M	
�XQ���A�*

Training_loss�Cj�D$       B+�M	��Q���A�*

Training_loss�9C
G�-$       B+�M	�R���A�*

Training_loss�%C%-$       B+�M	��mR���A�*

Training_lossO�MC��o*$       B+�M	o��R���A�*

Training_loss!f(C+�q/$       B+�M	{�%S���A�*

Training_lossd@$C��P$       B+�M	6��S���A�*

Training_loss:�Cd16�$       B+�M	5��S���A�*

Training_lossI�#CA���$       B+�M	j�7T���A�*

Training_loss�C44��$       B+�M	�ȓT���A�*

Training_loss��3CL�t�*       ����	$WU���A�*

Validation_accuracy��F?����&       sO� 	�WU���A�*

Validation_loss�>�B�g��$       B+�M	�WV���A�*

Training_loss�?1C���$       B+�M	�|tV���A�*

Training_loss�C�k�$       B+�M	��V���A�*

Training_loss��3C��D�$       B+�M	��,W���A�*

Training_loss6�=C�GD$       B+�M	$E�W���A�*

Training_loss8B2C@\�$       B+�M	G��W���A�*

Training_lossʩ C~=h�$       B+�M	�I@X���A�*

Training_loss��5C�?�;$       B+�M	9�X���A�*

Training_loss8�C�7�$       B+�M	X8�X���A�*

Training_loss��C"t�>$       B+�M	�TY���A�*

Training_loss�C���$       B+�M	��Y���A�*

Training_loss'$C�h�$       B+�M	�}Z���A�*

Training_loss��C͚B�$       B+�M	�gZ���A�*

Training_loss�^	C���1$       B+�M	#.�Z���A�*

Training_lossrz7C$wm$       B+�M	h�[���A�*

Training_loss�>CI�$       B+�M	8�z[���A�*

Training_loss�CK��J$       B+�M	��[���A�*

Training_loss�r;C�{vV$       B+�M	Q�2\���A�*

Training_loss��-C�`��$       B+�M	�\���A�*

Training_loss�BTQ�$       B+�M	ޑ�\���A�*

Training_loss���B���$       B+�M	>>F]���A�*

Training_loss�>2C`�$       B+�M	���]���A�*

Training_lossF�PCޑ�+$       B+�M	U0�]���A�*

Training_loss-�&C�^�$       B+�M	�Z^���A�*

Training_lossS{C��/$       B+�M	�m�^���A�*

Training_lossFv(CX�l#$       B+�M	/�_���A�*

Training_loss�b�Bv睁$       B+�M	So_���A�*

Training_loss�?RC�$       B+�M	*��_���A�*

Training_loss��)C��kd$       B+�M	\�'`���A�*

Training_loss�PCJ���$       B+�M	���`���A�*

Training_lossP]<Cgj��$       B+�M	�@�`���A�*

Training_lossdC�k?�$       B+�M	(;a���A�*

Training_loss�CJq��$       B+�M	i�a���A�*

Training_loss�C�9��$       B+�M	Ԛ�a���A�*

Training_loss�C�=/$       B+�M	��Mb���A�*

Training_loss}6C�HK$       B+�M	�t�b���A�*

Training_loss�C��G$       B+�M	$�c���A�*

Training_lossg�CO$       B+�M	|�`c���A�*

Training_loss��XC�IW$       B+�M	G��c���A�*

Training_loss��
C]s�$       B+�M	Bd���A�*

Training_loss��+CGA <$       B+�M	�Sud���A�*

Training_lossb[C���$       B+�M	.��d���A�*

Training_loss�h(C��4S$       B+�M	|
.e���A�*

Training_loss<�FC����$       B+�M	���e���A�*

Training_loss��C.$�I$       B+�M	��e���A�*

Training_loss:�C���$       B+�M	T�Bf���A�*

Training_lossB/+C���>$       B+�M	3�f���A�*

Training_loss@�:Cb�Q$       B+�M	���f���A�*

Training_lossb*Cھ��$       B+�M	N�Vg���A�*

Training_loss�.�B�^�$       B+�M	+��g���A�*

Training_loss��B�Ό*       ����	��uh���A�*

Validation_accuracy��F?�X�&       sO� 	�uh���A�*

Validation_loss�BQ
N$       B+�M	�a=i���A�*

Training_loss��+Cㄶ�$       B+�M	��i���A�*

Training_lossICڙ��$       B+�M	;�i���A�*

Training_loss�5[C���$       B+�M	6Qj���A�*

Training_loss�)Cz��!$       B+�M	�Ѭj���A�*

Training_loss&hHC�G�i$       B+�M	�:	k���A�*

Training_loss#!C4�9�$       B+�M	��dk���A�*

Training_loss5�7C�!W$       B+�M	���k���A�*

Training_loss@JHCEm$       B+�M	?�l���A�*

Training_loss��C��7$       B+�M	�_zl���A�*

Training_loss��CWq�$       B+�M	���l���A�*

Training_loss���BٵnS$       B+�M	�+3m���A�*

Training_loss8{C7�m$       B+�M	Ŏ�m���A�*

Training_loss@S
C{���$       B+�M	%[�m���A�*

Training_loss�C���2$       B+�M	�Fn���A�*

Training_loss�"C��d$       B+�M	�o�n���A�*

Training_loss��C�{Ҍ$       B+�M	���n���A�*

Training_loss�Cx�~$       B+�M	��[o���A�*

Training_loss;r�B�^�N$       B+�M	%=�o���A�*

Training_loss~C�GGN$       B+�M	�_!p���A�*

Training_loss��C�@$       B+�M	��}p���A�*

Training_lossM�(C&Yi$       B+�M	@��p���A�*

Training_loss�5C���$       B+�M	�6q���A�*

Training_loss��CK�$       B+�M	I,�q���A�*

Training_loss��B�*6�$       B+�M	�;�q���A�*

Training_lossy�C{&��$       B+�M	�Ir���A�*

Training_loss֟(C�(��$       B+�M	�ݥr���A�*

Training_loss��C`?�$       B+�M	"qs���A�*

Training_loss@�C|(P]$       B+�M	��\s���A�*

Training_loss��BA0�C$       B+�M	Cu�s���A�*

Training_loss`� CT}��$       B+�M	�ut���A�*

Training_lossgC��LP$       B+�M	:xqt���A�*

Training_loss�FCۃ��$       B+�M	���t���A�*

Training_loss �$Cp1#�$       B+�M	%*u���A�*

Training_loss���B뜩�$       B+�M	/m�u���A�*

Training_loss˝�B�ӣ$       B+�M	^��u���A�*

Training_loss�^Cv�a�$       B+�M	��=v���A�*

Training_loss8!CL��$       B+�M	���v���A�*

Training_loss2�<CW/�m$       B+�M	�9�v���A�*

Training_loss�|:Cj��$       B+�M	0HRw���A�*

Training_losst$Cno0F$       B+�M	��w���A�*

Training_lossTC� :8$       B+�M	�	x���A�*

Training_loss�C����$       B+�M	�Mex���A�*

Training_loss��B���Y$       B+�M	}��x���A�*

Training_loss6�1C^rH�$       B+�M	��y���A�*

Training_loss�[C�[<$       B+�M	��xy���A�*

Training_loss.�C�2u�$       B+�M	c��y���A�*

Training_loss��C�D�$       B+�M	[�0z���A�*

Training_loss0�*C����$       B+�M	x|�z���A�*

Training_loss�K C��$       B+�M	���z���A�*

Training_lossR��B8}�'*       ����	���{���A�*

Validation_accuracyIIG?��/F&       sO� 	r��{���A�*

Validation_loss7�B��U�$       B+�M	�r�|���A�*

Training_loss��-CuZ	�$       B+�M	AE�|���A�*

Training_loss�`C���=$       B+�M	�?:}���A�*

Training_loss�)Ce�'$       B+�M	���}���A�*

Training_loss��C��ţ$       B+�M	d>�}���A�*

Training_losst�CG���$       B+�M	�)N~���A�*

Training_loss�GC~):$       B+�M	��~���A�*

Training_loss�jC�h��$       B+�M	l
���A�*

Training_loss�LC�s��$       B+�M	*�a���A�*

Training_loss��/C)�V$       B+�M	?ż���A�*

Training_lossU�C��M$       B+�M	�����A�*

Training_loss\�CQ �H$       B+�M	is����A�*

Training_loss#=�B��Z$       B+�M	��΀���A�*

Training_loss��CC��x�$       B+�M	m +����A�*

Training_lossx�@C�Y�V$       B+�M	�T�����A�*

Training_loss��CF�)�$       B+�M	�L぀��A�*

Training_lossC�/C�Y��$       B+�M	n�>����A�*

Training_lossRV�B&�k$       B+�M	㨛����A�*

Training_lossCk_g$       B+�M	;Q�����A�*

Training_loss�X�B
f�+$       B+�M	`vS����A�*

Training_loss�B�B��G$       B+�M	kd�����A�*

Training_loss�CUc{�$       B+�M	h����A�*

Training_loss��CS)��$       B+�M	��g����A�*

Training_loss4�C�P^$       B+�M	��Ä���A�*

Training_loss/�8CX��1$       B+�M	�r����A�*

Training_loss+C�8$       B+�M	"|����A�*

Training_loss�@%C����$       B+�M	�B؅���A�*

Training_loss^=<C��x	$       B+�M	%A4����A�*

Training_lossE$C#��$       B+�M	mW�����A�*

Training_loss��C�ه$       B+�M	b/솀��A�*

Training_loss�2C�E�$       B+�M	y�H����A�*

Training_loss�FC) d1$       B+�M	~�����A�*

Training_loss��C<1�y$       B+�M	� ����A�*

Training_lossƸCVENf$       B+�M	3�\����A�*

Training_lossھ C�:b$       B+�M	������A�*

Training_loss��Ci�y~$       B+�M	\>����A�*

Training_loss�BۮT$       B+�M		4q����A�*

Training_lossr8C�E��$       B+�M	��̉���A�*

Training_loss|�+C lA $       B+�M	c�(����A�*

Training_loss�[C���$       B+�M	)������A�*

Training_loss;C
��>$       B+�M	ኀ��A�*

Training_lossv�Bƻ�n$       B+�M	�=����A�*

Training_loss�C�oAP$       B+�M	�p�����A�*

Training_loss��*CK��$       B+�M	H������A�*

Training_loss��Cs��c$       B+�M	R����A�*

Training_lossPC�Oh\$       B+�M	c������A�*

Training_loss4�Cg>�$       B+�M	��
����A�*

Training_loss�"CX㏒$       B+�M	B�f����A�*

Training_loss;�C�Zp�$       B+�M	�:Í���A�*

Training_lossXFC�
�Q$       B+�M	�����A�*

Training_loss7p>Cm�ѳ*       ����	ˢ⎀��A�*

Validation_accuracyIIH?@ʓ&       sO� 	ץ⎀��A�*

Validation_loss�܅B!�cS$       B+�M	u�����A�*

Training_lossl�%C;���$       B+�M	b����A�*

Training_lossx��B����$       B+�M	jPp����A�*

Training_lossO�C���$       B+�M	K�ː���A�*

Training_loss���B���$       B+�M	��'����A�*

Training_loss���Bbɀ�$       B+�M	i�����A�*

Training_lossV�#C$�h3$       B+�M	��ߑ���A�*

Training_loss^$C���$       B+�M	W�:����A�*

Training_loss4}0Co�2�$       B+�M	ۅ�����A�*

Training_loss� C��3�$       B+�M	B\���A�*

Training_loss��\C�ǲ�$       B+�M	�[M����A�*

Training_loss'
C
�$       B+�M	R������A�*

Training_loss�u&C�;F$       B+�M	!�����A�*

Training_loss�eC'���$       B+�M	��`����A�*

Training_loss�&�BW��$       B+�M	�X�����A�*

Training_loss���B���$       B+�M	�����A�*

Training_loss��C�r�+$       B+�M	E.u����A�*

Training_loss��$C���$       B+�M	�ѕ���A�*

Training_loss��C�:��$       B+�M	�:-����A�*

Training_lossB�C_4ү$       B+�M	辉����A�*

Training_loss�CVG>$       B+�M	��䖀��A�*

Training_loss�~�B��@$       B+�M	�a@����A�*

Training_loss-C)�O$       B+�M	]j�����A�*

Training_lossX�
CD�$       B+�M	������A�*

Training_loss'^�B�{$       B+�M	�T����A�*

Training_lossҁ�B���$       B+�M	�*�����A�*

Training_lossb�B_�l$       B+�M	��
����A�*

Training_loss]uC&�7Q$       B+�M	�g����A�*

Training_lossV	Co�pZ$       B+�M	�����A�*

Training_loss-h�BqBġ$       B+�M	�v����A�*

Training_lossm+Ck��X$       B+�M	6�z����A�*

Training_loss�Cà�M$       B+�M	�
ך���A�*

Training_loss�CE?�$       B+�M	;�3����A�*

Training_lossCC�JĄ$       B+�M	������A�*

Training_losscB	C����$       B+�M	��움��A�*

Training_loss7wC�p�k$       B+�M	I����A�*

Training_loss�q�B_t�$       B+�M	!Y�����A�*

Training_lossH�CR{W $       B+�M	�����A�*

Training_loss�GCK�!r$       B+�M	�]����A�*

Training_loss�C���$       B+�M	ލ�����A�*

Training_loss|Z�Bm�$       B+�M	Y6����A�*

Training_lossmf1CX��$       B+�M	p#s����A�*

Training_loss|GCt���$       B+�M	�qϞ���A�*

Training_lossx�!Cjc�$       B+�M	F'+����A�*

Training_loss�4Chrr"$       B+�M	7ņ����A�*

Training_loss���B��$       B+�M	N�ៀ��A�*

Training_loss޻,C
�$       B+�M	�>����A�*

Training_loss�XC��?$       B+�M	q�����A�*

Training_loss��	C�>��$       B+�M	W�����A�*

Training_loss �Cֈ*0$       B+�M	m�Q����A�*

Training_loss� 0C��wf*       ����	������A�*

Validation_accuracyIII?j��&       sO� 	!�����A�*

Validation_loss/�B[[�$       B+�M	����A�*

Training_lossC~�$       B+�M	��M����A�*

Training_loss��C�>��$       B+�M	3������A�*

Training_loss^u�B���q$       B+�M	֋����A�*

Training_loss��BCi��D$       B+�M	W�a����A�*

Training_losspCޮP�$       B+�M	 X�����A�*

Training_loss4�6C���$       B+�M	7�����A�*

Training_loss�C���$       B+�M	Iv����A�*

Training_lossD�C׆0�$       B+�M	e�ҥ���A�*

Training_loss�*CD]$       B+�M	��-����A�*

Training_lossfJ�B"�A $       B+�M	؝�����A�*

Training_loss%��Bɲ��$       B+�M	�䦀��A�*

Training_loss��Cʷ�$       B+�M	��?����A�*

Training_loss6�C>ޫ�$       B+�M	Z�����A�*

Training_lossyaC�)�P$       B+�M	Do�����A�*

Training_loss�sC�r�)$       B+�M	5U����A�*

Training_loss��B@��S$       B+�M	�Z�����A�*

Training_loss��C�1!$       B+�M	�����A�*

Training_loss670Ckh��$       B+�M	�k����A�*

Training_loss�@%C�O�]$       B+�M	��ǩ���A�*

Training_loss5�C���$       B+�M	�#����A�*

Training_loss�% C;�c$       B+�M	������A�*

Training_lossZ3C��x$       B+�M	�Iܪ���A�*

Training_loss� �B��;�$       B+�M	��7����A�*

Training_loss��C@�(�$       B+�M	�ɓ����A�*

Training_loss��C�̻�$       B+�M	?����A�*

Training_lossa��B��5�$       B+�M	6?L����A�*

Training_loss�o>Co|p�$       B+�M	�秬���A�*

Training_loss���B�z�f$       B+�M	s�����A�*

Training_loss�� CX�9�$       B+�M	_����A�*

Training_loss��B��:$       B+�M	�ٺ����A�*

Training_loss���B�G4'$       B+�M	�7����A�*

Training_lossi�C��w�$       B+�M	��q����A�*

Training_loss��C��a4$       B+�M	�wͮ���A�*

Training_loss@�BK���$       B+�M	��(����A�*

Training_lossp� Cj$$       B+�M	�����A�*

Training_lossf��Bt��$       B+�M	/ீ��A�*

Training_loss��C���$       B+�M	+�<����A�*

Training_loss��Bh�U�$       B+�M	�Y�����A�*

Training_lossC:^��$       B+�M	�����A�*

Training_lossvL
Caх�$       B+�M	�P����A�*

Training_loss_BC�}ê$       B+�M	�"�����A�*

Training_loss�Ci�$       B+�M	�;����A�*

Training_loss�C�@��$       B+�M	�d����A�*

Training_loss��C9���$       B+�M	y�����A�*

Training_loss�&C�#�>$       B+�M	d�����A�*

Training_loss��B��$       B+�M	jw����A�*

Training_loss[2�B��R�$       B+�M	4�ҳ���A�*

Training_loss���B���$       B+�M	ZF/����A�*

Training_loss�]_C�(�"$       B+�M	? �����A�*

Training_lossQV�B��4�*       ����	�KN����A�*

Validation_accuracy H?��w&       sO� 	8NN����A�*

Validation_loss�̎Bw��r$       B+�M	O�6����A�*

Training_loss1� Cz���$       B+�M	�蒶���A�*

Training_loss<\�B�O�`$       B+�M	�2ﶀ��A�*

Training_loss��C��p$       B+�M	$L����A�*

Training_loss�C�pmc$       B+�M		5�����A�*

Training_lossđ	CW:o�$       B+�M	������A�*

Training_loss�o1C=R+�$       B+�M	��_����A�*

Training_loss���B�2�F$       B+�M	h������A�*

Training_loss�n�B�@!�$       B+�M	Q�����A�*

Training_loss�C��F7$       B+�M	��t����A�*

Training_loss���BИ%$       B+�M	rpѹ���A�*

Training_loss�j1C)�D7$       B+�M	�R-����A�*

Training_loss& C���=$       B+�M	�b�����A�*

Training_loss�C~,�$       B+�M	ϣ뺀��A�*

Training_loss�e�B�m�e$       B+�M	sO����A�*

Training_loss�2(CI��$       B+�M	������A�*

Training_lossw��B3���$       B+�M	������A�*

Training_loss�C�N��$       B+�M	��l����A�*

Training_loss��B��-$       B+�M	dɼ���A�*

Training_loss��)C�J��$       B+�M	�%����A�*

Training_loss|�C*N�$       B+�M	������A�*

Training_lossDu�B�4�$       B+�M	sG޽���A�*

Training_loss7�B��$       B+�M	�0:����A�*

Training_loss�s-Cy�S�$       B+�M	KW�����A�*

Training_loss#�Cӊ�a$       B+�M	�����A�*

Training_loss�BLb�$       B+�M	�N����A�*

Training_loss��%C���$       B+�M	������A�*

Training_lossg�B�c�$       B+�M	8�
����A�*

Training_loss8p�B�[�$       B+�M	�f����A�*

Training_loss�H�B~��q$       B+�M	�������A�*

Training_lossL�B��ލ$       B+�M	|`����A�*

Training_lossl�
C��($       B+�M	W]{����A�*

Training_loss�$C'C$       B+�M	r������A�*

Training_lossP�Cɂ$       B+�M	N�4��A�*

Training_loss22�B�$       B+�M	�ǐ��A�*

Training_loss�<�BY�$       B+�M	�S���A�*

Training_loss?�C,���$       B+�M	pwIÀ��A�*

Training_loss���B��O$       B+�M	�#�À��A�*

Training_loss�CK�{�$       B+�M	�Ā��A�*

Training_loss.�CĨc�$       B+�M	��\Ā��A�*

Training_loss��B����$       B+�M	ӽ�Ā��A�*

Training_loss-N�B�_��$       B+�M	Ylŀ��A�*

Training_loss��CK�|$       B+�M	�Ppŀ��A�*

Training_lossv'C�y�$       B+�M	�A�ŀ��A�*

Training_losst�C�\)B$       B+�M	c^)ƀ��A�*

Training_loss�F�B���.$       B+�M	���ƀ��A�*

Training_loss��B�"cr$       B+�M	���ƀ��A�*

Training_loss�wCs�$�$       B+�M	�8=ǀ��A�*

Training_loss>��B���$       B+�M	�֘ǀ��A�*

Training_lossPC���$       B+�M	�#�ǀ��A�*

Training_loss(�C���?*       ����	Ū�Ȁ��A�*

Validation_accuracyutH?x��&       sO� 	m��Ȁ��A�*

Validation_loss�/�B��6$       B+�M	���ɀ��A�*

Training_loss�^�BB��$       B+�M	�]ʀ��A�*

Training_loss��
CW�$       B+�M	�aʀ��A�*

Training_loss���B��y$       B+�M	�(�ʀ��A�*

Training_loss��Bn��,$       B+�M	9|ˀ��A�*

Training_loss���BۭB&$       B+�M	��vˀ��A�*

Training_lossps&Cf�$       B+�M	�q�ˀ��A�*

Training_loss��+C�0$       B+�M	�m.̀��A�*

Training_loss�C���$       B+�M	�b�̀��A�*

Training_loss��B��3$       B+�M	:#�̀��A�*

Training_lossĹC�C�.$       B+�M	��@̀��A�*

Training_loss+- Cߓ�%$       B+�M	'��̀��A�*

Training_lossT3�B� $       B+�M	���̀��A�*

Training_lossCf�B�]�$       B+�M	aOT΀��A�*

Training_loss�o)C�s��$       B+�M	i5�΀��A�*

Training_loss�}C�E��$       B+�M	�mπ��A�*

Training_loss��C���x$       B+�M	�biπ��A�*

Training_losskqC�h�$       B+�M	|�π��A�*

Training_lossԡ�BA��$       B+�M	��#Ѐ��A�*

Training_loss6�C{`�\$       B+�M	p�Ѐ��A�*

Training_lossl�C	 �$       B+�M	��Ѐ��A�*

Training_loss���Br�|$       B+�M	M�7р��A�*

Training_loss��	Cӕh�$       B+�M	攙р��A�*

Training_loss�@�B��q$       B+�M	�d�р��A�*

Training_lossB�-CɦF$       B+�M	
iQҀ��A�*

Training_loss�<�BS$       B+�M	tz�Ҁ��A�*

Training_loss�C}ZN$       B+�M	��	Ӏ��A�*

Training_lossH�B��_'$       B+�M	��eӀ��A�*

Training_loss�C��ՠ$       B+�M	\:�Ӏ��A�*

Training_loss���B��(�$       B+�M	��Ԁ��A�*

Training_lossNkC�J$       B+�M	O"{Ԁ��A�*

Training_loss�C-�C$       B+�M	�u�Ԁ��A�*

Training_loss�C�O�$       B+�M	��3Հ��A�*

Training_loss*0�BE���$       B+�M	Ǻ�Հ��A�*

Training_lossRJ/C�
q$       B+�M	R��Հ��A�*

Training_lossbl�B�Г#$       B+�M	 �Gր��A�*

Training_lossq�B+L�$       B+�M	�}�ր��A�*

Training_lossR,�B掩�$       B+�M	v׀��A�*

Training_loss�/�BK��$       B+�M	�1^׀��A�*

Training_loss*F�B\\��$       B+�M	���׀��A�*

Training_loss4�CL�$       B+�M	�؀��A�*

Training_loss7�C׽�E$       B+�M	��r؀��A�*

Training_losszSC���$       B+�M	#k�؀��A�*

Training_loss6�C�H�$       B+�M	�s+ـ��A�*

Training_loss���B�ǄK$       B+�M	q��ـ��A�*

Training_loss��B�km$       B+�M	a��ـ��A�*

Training_loss�'C6c�e$       B+�M	�g?ڀ��A�*

Training_loss3Y�Bi5�$       B+�M	e��ڀ��A�*

Training_loss�?�Bd;ڈ$       B+�M	e��ڀ��A�*

Training_loss�Z�B�.�$       B+�M	�VTۀ��A�*

Training_loss�~C��D*       ����	�t܀��A�*

Validation_accuracyIIH?ʋZ�&       sO� 	�v܀��A�*

Validation_loss?J�B����$       B+�M	�݀��A�*

Training_lossZ��B��b$       B+�M	�c݀��A�*

Training_loss��B�?X$       B+�M	ƿ݀��A�*

Training_lossU.�Bq�@$       B+�M	�ހ��A�*

Training_lossfC<^�$       B+�M	|Exހ��A�*

Training_lossZ��BV�Q$       B+�M	�V�ހ��A�*

Training_lossZC}�!$       B+�M	�/߀��A�*

Training_loss4C���$       B+�M	CV�߀��A�*

Training_loss<4�B��$       B+�M	ܠ�߀��A�*

Training_loss�r	Cy���$       B+�M	F�D����A�*

Training_loss�C�(�$       B+�M	�������A�*

Training_loss^�C)��$       B+�M	�������A�*

Training_loss���BOþK$       B+�M	�PZ���A�*

Training_loss�ɢBu�m$       B+�M	5����A�*

Training_loss Cp{�$       B+�M	{���A�*

Training_lossTn�Bd��3$       B+�M	��m���A�*

Training_lossn�C=*K$       B+�M	������A�*

Training_lossy�B�>$       B+�M	�%���A�*

Training_loss1ìB���$       B+�M	 ����A�*

Training_loss��B� �J$       B+�M	!�����A�*

Training_lossMm�B�"�$       B+�M	a�9���A�*

Training_loss�5C�tf�$       B+�M	b-����A�*

Training_lossx81C,W_$       B+�M	�����A�*

Training_loss���BMت�$       B+�M	� P���A�*

Training_loss��B9X*V$       B+�M	ˠ����A�*

Training_loss V�B�yU$       B+�M	Χ���A�*

Training_loss��B���4$       B+�M	��d���A�*

Training_loss�#�B�Z:�$       B+�M	ߣ����A�*

Training_loss9�B�p��$       B+�M	s���A�*

Training_loss��B���#$       B+�M	P8z���A�*

Training_lossf��B�>�L$       B+�M	�u����A�*

Training_loss�I�B�w$       B+�M	�2���A�*

Training_loss�r�B���z$       B+�M	x����A�*

Training_lossx�C����$       B+�M	Y�����A�*

Training_loss���B�d�P$       B+�M	��F���A�*

Training_loss��Cs��$       B+�M	�U����A�*

Training_loss��C{��$       B+�M	z����A�*

Training_loss���B���N$       B+�M	��[���A�*

Training_loss;�B)�I>$       B+�M	i�����A�*

Training_loss!�B�x�+$       B+�M	�L���A�*

Training_lossֹ%Ci�H�$       B+�M	�-o���A�*

Training_loss�CJ���$       B+�M	�m����A�*

Training_losspB�B�K��$       B+�M	C(���A�*

Training_loss4�ZB����$       B+�M	̓���A�*

Training_loss�B����$       B+�M	!�����A�*

Training_loss�� C��v$       B+�M	By=���A�*

Training_loss���B�bj�$       B+�M	ퟙ���A�*

Training_lossj�C<��$       B+�M	 �����A�*

Training_lossNt�B�G�$       B+�M	��Q���A�*

Training_loss��B����$       B+�M	�����A�*

Training_lossRC6R-	*       ����	�'r���A�*

Validation_accuracy��H?9���&       sO� 	s*r���A�*

Validation_loss�.�B�Fg�$       B+�M	��l����A�*

Training_loss}��B� "r$       B+�M	������A�*

Training_loss���B��}d$       B+�M	uZ$���A�*

Training_lossCv C���$       B+�M	YM����A�*

Training_lossw\C��r�$       B+�M	�M����A�*

Training_loss���B�) W$       B+�M	9b8���A�*

Training_loss8�Bb�h+$       B+�M	࢔���A�*

Training_loss�?�B���$       B+�M	o�����A�*

Training_loss���By��u$       B+�M	�L���A�*

Training_loss��$C���$       B+�M	�����A�*

Training_loss�%Cwz��$       B+�M	�S���A�*

Training_lossb��B9�$       B+�M	��`���A�*

Training_loss��B
T�$       B+�M	G<����A�*

Training_lossʺC�X�$       B+�M	tz����A�*

Training_lossd�B�J�$       B+�M	�Rv����A�*

Training_lossu'C�4E�$       B+�M	������A�*

Training_loss3a�Bl��$       B+�M	�.����A�*

Training_loss�	�B�׻�$       B+�M	S�����A�*

Training_loss�
�B�^$�$       B+�M	a������A�*

Training_loss�q�B�eݧ$       B+�M	ͬC����A�*

Training_lossT��B4��$       B+�M	������A�*

Training_loss\K�Br%F�$       B+�M		������A�*

Training_lossX��Bc��$       B+�M	�WW����A�*

Training_loss�FCx�\$       B+�M	�������A�*

Training_lossF�,Cge�S$       B+�M	������A�*

Training_lossO�B�cS$       B+�M	k����A�*

Training_lossh1�B�2�^$       B+�M	w������A�*

Training_loss	C�l�V$       B+�M	�<#����A�*

Training_loss �B]�5$       B+�M	.����A�*

Training_loss�nC��"�$       B+�M	`������A�*

Training_lossHC��}�$       B+�M	E+7����A�*

Training_loss��C���.$       B+�M	�B�����A�*

Training_lossr�B~P�%$       B+�M	�.�����A�*

Training_loss���Bdl�K$       B+�M	ϻK����A�*

Training_loss^VC��U$       B+�M	�N�����A�*

Training_loss�}�B����$       B+�M	�b����A�*

Training_lossoCD�S�$       B+�M	@`����A�*

Training_loss�C��.$       B+�M	������A�*

Training_lossD��B�0O�$       B+�M	�J����A�*

Training_loss� C*5�$       B+�M	�.t����A�*

Training_loss��BK���$       B+�M	�Z�����A�*

Training_lossVoC����$       B+�M	�P,����A�*

Training_lossM�B�Bz$       B+�M	%�����A�*

Training_loss���B(�'�$       B+�M	�,�����A�*

Training_loss��CT(�3$       B+�M	�+A ���A�*

Training_lossB�Ch�$       B+�M	�ٜ ���A�*

Training_loss���B�gG�$       B+�M	><� ���A�*

Training_loss B�Bk���$       B+�M	N�T���A�*

Training_lossFB�B`c�K$       B+�M	������A�*

Training_loss� C�,$       B+�M	����A�*

Training_loss�Ct�*       ����	j�����A�*

Validation_accuracy��H?��db&       sO� 	v�����A�*

Validation_loss�{B��gx$       B+�M	������A�*

Training_loss���B�g1$       B+�M	ta1���A�*

Training_loss�<�B^ ~$       B+�M	�D����A�*

Training_loss�x�B!) $       B+�M	J�����A�*

Training_loss���B����$       B+�M	�D���A�*

Training_loss)tC��e$       B+�M	�����A�*

Training_loss^B�Blh�$       B+�M	o~���A�*

Training_loss���B$�Y$       B+�M	.�`���A�*

Training_loss�C�5A�$       B+�M	c�����A�*

Training_loss{�B�Ʊ0$       B+�M	����A�*

Training_loss��C׸�$       B+�M	�0t���A�*

Training_loss$�BSj^�$       B+�M	&S����A�*

Training_lossh>�B��B$       B+�M	Eb,���A�*

Training_lossDgC�-h]$       B+�M	�����A�*

Training_loss)E�BR�Pl$       B+�M	�v����A�*

Training_loss+�BMA=Q$       B+�M	d?	���A�*

Training_lossN�Bbb��$       B+�M	X;�	���A�*

Training_lossJOC��$       B+�M	Z��	���A�*

Training_loss�E�B�6G$       B+�M	��R
���A�*

Training_loss�[�B-!�5$       B+�M	~W�
���A�*

Training_loss8x
CF��$$       B+�M	�W
���A�*

Training_loss 1�B���J$       B+�M	�f���A�*

Training_lossGK�BN�X&$       B+�M	������A�*

Training_loss�Z�B*J��$       B+�M	غ���A�*

Training_loss���B�G>$       B+�M	ũz���A�*

Training_loss��BnlF�$       B+�M	������A�*

Training_loss �B��0�$       B+�M	��2���A�*

Training_lossV`�Bx�j.$       B+�M	�؎���A�*

Training_loss�.�B�e�$       B+�M	������A�*

Training_loss s�B��$       B+�M	��F���A�*

Training_loss�t�B7Ƹ@$       B+�M	F����A�*

Training_loss
b
C) }$       B+�M	�!����A�*

Training_loss]x�B�m9m$       B+�M	��Z���A�*

Training_loss�^�B��-$       B+�M	4�����A�*

Training_loss!/C#{$       B+�M	V����A�*

Training_loss��B����$       B+�M	gEn���A�*

Training_loss�CE)�$       B+�M	�V����A�*

Training_lossL>#C2i�`$       B+�M	��&���A�*

Training_lossB�B���$       B+�M	E�����A�*

Training_losshi�B�~p$       B+�M	|�����A�*

Training_lossx��B� ��$       B+�M	��:���A�*

Training_loss���B&� 9$       B+�M	*����A�*

Training_loss�ޭB��$       B+�M	�����A�*

Training_loss2�B����$       B+�M	�vO���A�*

Training_loss���B��.h$       B+�M	ѫ���A�*

Training_loss�s�B'bu$       B+�M	/����A�*

Training_loss�z�Bq+�$       B+�M	��c���A�*

Training_loss2$�B�^h$       B+�M	�C����A�*

Training_loss���B�w�$       B+�M	�@���A�*

Training_loss1M
C���$       B+�M	v�v���A�*

Training_loss��B~� ~*       ����	��:���A�*

Validation_accuracy��H?oF&       sO� 	��:���A�*

Validation_loss9!~B�K	/$       B+�M	��;���A�*

Training_lossXy�B� q�$       B+�M	g����A�*

Training_loss�g�Bo��0$       B+�M	l�����A�*

Training_losst2�B��$       B+�M	�O���A�*

Training_lossf��B��O$       B+�M	�
����A�*

Training_lossp�B�tp�$       B+�M	�q���A�*

Training_loss��C�}�1$       B+�M	(Gd���A�*

Training_loss��B��j$       B+�M	�,����A�*

Training_lossfCY� $       B+�M	}?���A�*

Training_loss�b C�Bt$       B+�M	B�x���A�*

Training_loss|��B:I[�$       B+�M	Ԙ����A�*

Training_loss��B�B�$       B+�M	�/���A�*

Training_loss~I�BݬV$       B+�M	C����A�*

Training_lossp��B�7�R$       B+�M	l����A�*

Training_loss��B�U$       B+�M	e�B���A�*

Training_loss6�
C�KP$       B+�M	s����A�*

Training_loss�U�B�?C$       B+�M	�e����A�*

Training_loss4&dB�uk�$       B+�M	^V���A�*

Training_loss��C7�<1$       B+�M	e����A�*

Training_loss
��B���$       B+�M	P����A�*

Training_loss#�B%�t�$       B+�M	��k���A�*

Training_loss~T�B?�/�$       B+�M	�e����A�*

Training_loss�n�B�ӄ�$       B+�M	8�#���A�*

Training_loss�')C����$       B+�M	j����A�*

Training_loss.��B��j$       B+�M	_�����A�*

Training_losszf�BMh�<$       B+�M	�j7 ���A�*

Training_loss���B�t��$       B+�M	��� ���A�*

Training_loss��B<�R�$       B+�M	o� ���A�*

Training_loss�}�B��z�$       B+�M	g�M!���A�*

Training_loss�3�B�~�-$       B+�M	r��!���A�*

Training_lossZ��Bb�ہ$       B+�M	�y"���A�*

Training_lossD��B7cYY$       B+�M	�d"���A�*

Training_loss�#�B�
ih$       B+�M	!˿"���A�*

Training_loss0�C�W��$       B+�M	��#���A�*

Training_loss��B�$y�$       B+�M	�bx#���A�*

Training_loss��C�M�$       B+�M	?7�#���A�*

Training_loss^r�BF|/$       B+�M	�<0$���A�*

Training_lossLC^��$       B+�M	*��$���A�*

Training_loss�C({��$       B+�M	�i�$���A�*

Training_loss%�BMa�4$       B+�M	Z�D%���A�*

Training_loss��B��$       B+�M	4�%���A�*

Training_loss��B�Rr�$       B+�M	?8�%���A�*

Training_loss�4�B@��.$       B+�M	��X&���A�*

Training_loss�tC��bw$       B+�M	�>�&���A�*

Training_lossa�BR3$       B+�M	}X'���A�*

Training_loss���Bha$       B+�M	5}l'���A�*

Training_loss���BI{G�$       B+�M	N��'���A�*

Training_loss�!�B�3Z9$       B+�M	9�$(���A�*

Training_loss���B|�N�$       B+�M	��(���A�*

Training_loss��CoA��$       B+�M	���(���A�*

Training_loss�!C	�08*       ����	胟)���A�*

Validation_accuracy��J?D:�&       sO� 	���)���A�*

Validation_loss�MqB����$       B+�M	d��*���A�*

Training_loss,>�B^8,$       B+�M	s�+���A�*

Training_loss4V�B�3�R$       B+�M	��p+���A�*

Training_loss�^ C�yR$       B+�M	��+���A�*

Training_losskC�_x�$       B+�M	(,���A�*

Training_loss�W�B�$       B+�M	�+�,���A�*

Training_lossD��B���K$       B+�M	���,���A�*

Training_lossQ��Bˮ��$       B+�M	4<-���A�*

Training_lossS�B���$       B+�M	�ܘ-���A�*

Training_loss&��B�F+�$       B+�M	e��-���A�*

Training_loss^��B�Hs$       B+�M	�P.���A�*

Training_loss��BY�>�$       B+�M	~�.���A�*

Training_loss=F�B,8$�$       B+�M	�	/���A�*

Training_lossl�B(��$       B+�M	:�d/���A�*

Training_loss�9�B	Zv�$       B+�M	<�/���A�*

Training_loss���B�=�'$       B+�M	��0���A�*

Training_loss4�C]���$       B+�M	�Nx0���A�*

Training_loss,�Bʝv$       B+�M	F��0���A�*

Training_loss,��BE ~�$       B+�M	y$01���A�*

Training_loss
�BR �$       B+�M	��1���A�*

Training_loss�LC�ȋ�$       B+�M	�U�1���A�*

Training_loss�B��3�$       B+�M	mSE2���A�*

Training_loss�^�Bl�3�$       B+�M	<ء2���A�*

Training_loss�+�B;p�'$       B+�M	���2���A�*

Training_lossN�C��
�$       B+�M	3�Y3���A�*

Training_loss��B�އ'$       B+�M	�3���A�*

Training_lossɚ�B�.oK$       B+�M	ǻ4���A�*

Training_loss��B@r�G$       B+�M	��n4���A�*

Training_lossz=�B��e�$       B+�M	D�4���A�*

Training_lossTCݴ��$       B+�M	�t'5���A�*

Training_loss�4�Bϫ��$       B+�M	��5���A�*

Training_lossX��B���\$       B+�M	)@�5���A�*

Training_loss
C���$       B+�M	�B6���A�*

Training_losse��B���$       B+�M	ڞ6���A�*

Training_loss���B���$       B+�M	O��6���A�*

Training_loss�^�B6S��$       B+�M	��W7���A�*

Training_lossF)�Bi�$       B+�M	X�7���A�*

Training_loss�{�B�r1$       B+�M	VJ8���A�*

Training_lossވC�c$       B+�M	7Rl8���A�*

Training_loss���BH��$       B+�M	���8���A�*

Training_loss&a�Bĸ$       B+�M	7�#9���A�*

Training_lossn2�B���Z$       B+�M	5р9���A�*

Training_loss��B���$       B+�M	̲�9���A�*

Training_loss�u�Bu� $       B+�M	��8:���A�*

Training_losst6�B�]��$       B+�M	�:���A�*

Training_loss,��B���7$       B+�M	d!�:���A�*

Training_loss�7�Bԁ��$       B+�M	��L;���A�*

Training_lossNu�B�9 z$       B+�M	E��;���A�*

Training_lossT��BH5��$       B+�M	-{<���A�*

Training_loss��B��'k$       B+�M	`�`<���A�*

Training_loss�`�B���*       ����	��#=���A�*

Validation_accuracy��I?�I&       sO� 	��#=���A�*

Validation_loss"xBg|C_$       B+�M	��=>���A�*

Training_loss�-C@6[�$       B+�M	�Y�>���A�*

Training_loss�j�B���O$       B+�M	s��>���A�*

Training_loss��B��b�$       B+�M	��R?���A�*

Training_loss�m�B17�$       B+�M	76�?���A�*

Training_lossN�B@���$       B+�M	oJ@���A�*

Training_lossV��B�Ek$       B+�M	8g@���A�*

Training_loss3��BXJ�$       B+�M	[y�@���A�*

Training_lossd��B�٥V$       B+�M	�YA���A�*

Training_loss���B�]x$       B+�M	5�zA���A�*

Training_loss���B�ޯ�$       B+�M	L��A���A�*

Training_loss ��B�k��$       B+�M	�W3B���A�*

Training_lossf� CDN�$       B+�M	k��B���A�*

Training_loss��B6�Ƈ$       B+�M	h!�B���A�*

Training_lossx.�B��$       B+�M	��FC���A�*

Training_loss�Bx'�$       B+�M	��C���A�*

Training_loss$VCr)�F$       B+�M	W>�C���A�*

Training_loss��B�5l$       B+�M	��ZD���A�*

Training_loss�P�B(��=$       B+�M	�ԶD���A�*

Training_loss���B�n�$       B+�M	
�E���A�*

Training_loss��BQ��$       B+�M	�mE���A�*

Training_loss�u
C��$       B+�M	Ll�E���A�*

Training_loss��Bq��$       B+�M	�c%F���A�*

Training_loss"�Bl/J$       B+�M	�'�F���A�*

Training_loss׸B�pV$       B+�M	U��F���A�*

Training_loss[ �B`��$       B+�M	�l8G���A�*

Training_loss��B:*©$       B+�M	~�G���A�*

Training_loss���Bu�'$       B+�M	J��G���A�*

Training_lossC�B���\$       B+�M	>ZLH���A�*

Training_loss��B�X<�$       B+�M	�H���A�*

Training_loss�GCP�H~$       B+�M	��I���A�*

Training_loss��B��� $       B+�M	jg_I���A�*

Training_lossVj�B���$       B+�M	�<�I���A�*

Training_loss�P�B��A$       B+�M	mJ���A�*

Training_loss��B�u,$       B+�M	}�sJ���A�*

Training_lossޒ�B�%%|$       B+�M	J��J���A�*

Training_loss@z�B�N��$       B+�M	,K���A�*

Training_loss�_�BR��$       B+�M	��K���A�*

Training_loss)L�B_3�$       B+�M	Z��K���A�*

Training_loss /�B��Z$       B+�M	e�?L���A�*

Training_loss��B�|�$       B+�M	ȗ�L���A�*

Training_loss�k�BŹ�C$       B+�M	���L���A�*

Training_loss߉�BvYD$       B+�M	OUM���A�*

Training_loss�j�B�!$       B+�M	qʰM���A�*

Training_loss�N�B��Y$       B+�M	%�N���A�*

Training_loss��BuNC�$       B+�M	z4hN���A�*

Training_lossQ��B���$       B+�M	�`�N���A�*

Training_lossw��BҋX$       B+�M	->!O���A�*

Training_loss�/�B,�wk$       B+�M	�m~O���A�*

Training_loss`�B)�N$       B+�M	S�O���A�*

Training_lossE��Bo%��*       ����	5D�P���A�*

Validation_accuracyKJJ?��]&       sO� 	ZF�P���A�*

Validation_lossH�|B�p��$       B+�M	�ǾQ���A�*

Training_loss�_�B6�$       B+�M	�eR���A�*

Training_loss���B��$       B+�M	�vR���A�*

Training_loss��B{�$       B+�M	%�R���A�*

Training_loss���B1�E$       B+�M	ע.S���A�*

Training_loss ,�B wٲ$       B+�M	���S���A�*

Training_lossy��B<y�$       B+�M	�H�S���A�*

Training_loss�~C���$       B+�M	�nDT���A�*

Training_loss0��B��<h$       B+�M	p�T���A�*

Training_loss���B��̏$       B+�M	K�T���A�*

Training_lossh��B͒g$       B+�M	��XU���A�*

Training_loss���B�"�$       B+�M	�ϵU���A�*

Training_lossC�	OX$       B+�M	a�V���A�*

Training_loss��B��/M$       B+�M	�mV���A�*

Training_loss�|�BXC��$       B+�M	Ք�V���A�*

Training_loss��B��;$       B+�M	a�$W���A�*

Training_lossJ��B�`l7$       B+�M	^�W���A�*

Training_loss�K�B}� B$       B+�M	���W���A�*

Training_loss�΢B	��a$       B+�M	EJ9X���A�*

Training_loss(��B�Bml$       B+�M	8��X���A�*

Training_loss�[�B"��$       B+�M	 ��X���A�*

Training_lossr�C�(�$       B+�M	_�MY���A�*

Training_loss��B�hv
$       B+�M	ڪ�Y���A�*

Training_loss�XC/4�$       B+�M	�Z���A�*

Training_loss�˚B��$       B+�M	��aZ���A�*

Training_loss�G�B�I��$       B+�M	�%�Z���A�*

Training_loss|��B��t�$       B+�M	�p[���A�*

Training_lossQK�B��$       B+�M	��v[���A�*

Training_loss�B��G�$       B+�M	��[���A�*

Training_loss�C��$       B+�M	�/\���A�*

Training_loss�F�B�I_O$       B+�M	8��\���A�*

Training_lossԅ�B$ì�$       B+�M	sc�\���A�*

Training_loss���B3u�i$       B+�M	qC]���A�*

Training_losswM�BB�s1$       B+�M	)!�]���A�*

Training_loss��B�x$$       B+�M	���]���A�*

Training_loss`OC����$       B+�M	�W^���A�*

Training_loss�Y�Bmv��$       B+�M	���^���A�*

Training_loss��B��n$       B+�M	�_���A�*

Training_lossϞB�D�$       B+�M	c�k_���A�*

Training_loss�лB��rl$       B+�M	���_���A�*

Training_loss@��B䳆�$       B+�M	�S#`���A�*

Training_loss�M�B��8+$       B+�M	��`���A�*

Training_loss��C�|��$       B+�M	e5�`���A�*

Training_loss03�B\��P$       B+�M	��7a���A�*

Training_loss�5�B�/�$       B+�M	噓a���A�*

Training_loss|O�B��$       B+�M	*�a���A�*

Training_lossR5�B��O$       B+�M	��Kb���A�*

Training_loss���Bb��$       B+�M	E�b���A�*

Training_loss��B4�G$       B+�M	)$c���A�*

Training_loss�5Cc� �$       B+�M	�^c���A�*

Training_loss&�B��=�*       ����	��"d���A�*

Validation_accuracyuuJ?p�A�&       sO� 	��"d���A�*

Validation_loss� vBDD�'$       B+�M	[�Ee���A�*

Training_loss�C�BJTE�$       B+�M	���e���A�	*

Training_loss01�B���s$       B+�M	�K�e���A�	*

Training_loss�y�B#�2�$       B+�M	CYf���A�	*

Training_loss\6�B9Ȋ $       B+�M	&�f���A�	*

Training_loss��B�;qO$       B+�M	+�g���A�	*

Training_loss��B�i>�$       B+�M	�Qlg���A�	*

Training_loss�p�B\��V$       B+�M	{��g���A�	*

Training_loss �B[�eC$       B+�M	��$h���A�	*

Training_loss�K�B��zw$       B+�M	EH�h���A�	*

Training_loss@��B�	��$       B+�M	8f�h���A�	*

Training_losst1�B{� %$       B+�M	�d:i���A�	*

Training_loss�ՠB��4$       B+�M	��i���A�	*

Training_loss>��BV�ͬ$       B+�M	�_�i���A�	*

Training_lossj�C��w($       B+�M	�Pj���A�	*

Training_loss(�B�8؉$       B+�M	���j���A�	*

Training_loss�(�B�Y$       B+�M	g�k���A�	*

Training_lossٱC�)g�$       B+�M	� ck���A�	*

Training_loss���BX~��$       B+�M	Tþk���A�	*

Training_loss5��B�fg$       B+�M	D�l���A�	*

Training_loss!cC̑�$       B+�M	xFvl���A�	*

Training_loss�۵B{�tj$       B+�M	�H�l���A�	*

Training_loss�-�BkJq$       B+�M	;/m���A�	*

Training_loss�ѼBoM،$       B+�M	�1�m���A�	*

Training_loss��B	�$�$       B+�M	#��m���A�	*

Training_loss�~�Be^�$       B+�M	�ZDn���A�	*

Training_loss���B1q�$       B+�M	���n���A�	*

Training_loss�J�B��&[$       B+�M	���n���A�	*

Training_loss
K�B\�.�$       B+�M	m�Xo���A�	*

Training_loss�E�B�'�$       B+�M	y�o���A�	*

Training_loss,��B3#){$       B+�M	�*p���A�	*

Training_loss���B¦3$       B+�M	lp���A�	*

Training_lossUݥB'Z$       B+�M	�k�p���A�	*

Training_loss�0�Bzo_;$       B+�M	�-$q���A�	*

Training_loss)E�B���$       B+�M	mS�q���A�	*

Training_loss7��Bj���$       B+�M	o~�q���A�	*

Training_lossW�B���H$       B+�M	�9r���A�	*

Training_loss�ѽBY��$       B+�M	�A�r���A�	*

Training_loss�P
C��j�$       B+�M	���r���A�	*

Training_loss�k�B�ˡ~$       B+�M	C�Ks���A�	*

Training_lossl�B T�8$       B+�M	���s���A�	*

Training_loss�;C�߬�$       B+�M	L�t���A�	*

Training_lossV��B�C��$       B+�M	)	`t���A�	*

Training_loss��hB�& $       B+�M	�;�t���A�	*

Training_loss7y�B9`�$       B+�M	�tu���A�	*

Training_loss.<�Br��$       B+�M	8��u���A�	*

Training_lossG�B���$       B+�M	7O v���A�	*

Training_loss�αB��I$       B+�M	!zv���A�	*

Training_lossP�B�N'$       B+�M	7��v���A�	*

Training_loss4;�B���$       B+�M	�Iw���A�	*

Training_loss��Bg��*       ����	�x���A�	*

Validation_accuracyKJK?~��&       sO� 	Q�x���A�	*

Validation_loss��nB�kQ-$       B+�M	�V>y���A�	*

Training_loss�O�B�͏}$       B+�M	���y���A�	*

Training_loss�&�Bp49W$       B+�M	V��y���A�	*

Training_loss�6yB	�T�$       B+�M	J�Rz���A�	*

Training_loss&�Cf��$       B+�M	��z���A�	*

Training_loss�	Ce���$       B+�M	T{���A�	*

Training_loss
��B���$       B+�M	��f{���A�	*

Training_loss�ҿBt�p$       B+�M	���{���A�	*

Training_loss
��BA���$       B+�M	p�|���A�	*

Training_loss~��BU^̣$       B+�M	X�||���A�	*

Training_loss,C(ӛ$       B+�M	�Q�|���A�	*

Training_loss���BÁ� $       B+�M	��4}���A�	*

Training_loss���B�ۚ�$       B+�M	u��}���A�	*

Training_loss�@�BR���$       B+�M	��}���A�	*

Training_loss��B�v��$       B+�M	��H~���A�	*

Training_loss6[�BD��$       B+�M	U�~���A�	*

Training_lossn�B�	$       B+�M	k����A�	*

Training_loss�B�V� $       B+�M	�q]���A�	*

Training_lossB��B<��$       B+�M	�����A�	*

Training_loss�B�B1��$       B+�M	�d����A�	*

Training_lossO?�BP�Ӏ$       B+�M	g�q����A�	*

Training_loss�I�B[1�$       B+�M	̀���A�	*

Training_loss]��BÅ�n$       B+�M	��(����A�	*

Training_lossv��B[Y�$       B+�M	?ȃ����A�	*

Training_loss쮍B�>�$       B+�M	=�߁���A�	*

Training_lossd+�BU���$       B+�M	bH<����A�	*

Training_loss[��BiW�7$       B+�M	������A�	*

Training_loss�7�B|(��$       B+�M	�����A�	*

Training_loss�֪Bܑ\	$       B+�M	�YQ����A�	*

Training_loss���B�1~�$       B+�M	`������A�	*

Training_loss#��B���b$       B+�M	.�	����A�	*

Training_loss�h�B�H��$       B+�M	��e����A�	*

Training_lossx��B~�0[$       B+�M	YL�����A�	*

Training_loss[�B$տN$       B+�M	������A�	*

Training_loss ��B�s��$       B+�M	.7y����A�	*

Training_loss�T Cg�<�$       B+�M	�Յ���A�	*

Training_loss��B	?��$       B+�M	�P1����A�	*

Training_loss���B��$       B+�M	^c�����A�	*

Training_loss��Bv�$       B+�M	%t醁��A�	*

Training_loss���B��hp$       B+�M	I�D����A�	*

Training_loss�͇B���Q$       B+�M	������A�	*

Training_loss�Q�B��D)$       B+�M	W������A�	*

Training_loss�*�Brm�$       B+�M	zX����A�	*

Training_loss���B3.76$       B+�M	y#�����A�	*

Training_lossKY�B�?$       B+�M	�����A�	*

Training_loss7{�B
��$       B+�M	zUl����A�	*

Training_loss"[�B�٠�$       B+�M	�`ȉ���A�	*

Training_lossA�B�m�$       B+�M	�$����A�	*

Training_lossH�BG^�l$       B+�M	d�����A�	*

Training_lossY��Bz��$       B+�M	�`܊���A�	*

Training_loss(�B��{*       ����	�Ѣ����A�	*

Validation_accuracy��L?�Ī'&       sO� 	�Ԣ����A�	*

Validation_loss��`B|M[$       B+�M	gڌ���A�	*

Training_lossNC���$       B+�M	�6����A�	*

Training_loss-2�B����$       B+�M	������A�	*

Training_loss]6�B�ٳ�$       B+�M	�P��A�	*

Training_lossD��BV�'g$       B+�M	�wL����A�	*

Training_loss�h�B�K��$       B+�M	�J�����A�	*

Training_lossN6CcH��$       B+�M	������A�	*

Training_loss�0�B7���$       B+�M	f�`����A�	*

Training_loss��C|[��$       B+�M	Qj�����A�	*

Training_lossRCE�$       B+�M	3����A�	*

Training_loss���B��$       B+�M	A�s����A�	*

Training_lossz��B�=&$       B+�M	��ϐ���A�	*

Training_loss&��B��5p$       B+�M	�+����A�	*

Training_lossd�B�bz$       B+�M	�燑���A�	*

Training_loss+��B�=с$       B+�M	Sz㑁��A�	*

Training_loss�� C3yd|$       B+�M	��>����A�	*

Training_loss�`�BZ4_$       B+�M	s������A�	*

Training_loss5��B�= �$       B+�M	�������A�	*

Training_loss(��B��L+$       B+�M	��Q����A�	*

Training_loss�T�B5���$       B+�M	�������A�	*

Training_loss4��B�T�$       B+�M	@k
����A�	*

Training_lossp.�B��7$       B+�M	UQg����A�	*

Training_lossx�B�ǫQ$       B+�M	OxÔ���A�	*

Training_losss^�B��5$       B+�M	�����A�	*

Training_lossMJ�B�;�$       B+�M	^�z����A�	*

Training_loss֋C�W�d$       B+�M	I�֕���A�	*

Training_lossz��BT��$       B+�M	�R3����A�	*

Training_loss�I�Bo��|$       B+�M	�2�����A�	*

Training_loss��B+�$       B+�M	 $떁��A�	*

Training_loss[��BZi�$       B+�M	E�F����A�
*

Training_lossE�B�`Z�$       B+�M	/������A�
*

Training_loss���B�+n$       B+�M	�G�����A�
*

Training_loss �B����$       B+�M	+[����A�
*

Training_loss�@�B���$       B+�M	ˀ�����A�
*

Training_loss;�B��:-$       B+�M	������A�
*

Training_lossB��B
hhO$       B+�M	D�p����A�
*

Training_loss��B?a5$       B+�M	�CΙ���A�
*

Training_loss�A�B`	��$       B+�M	�y*����A�
*

Training_loss���B�Qh$       B+�M	~�����A�
*

Training_loss�t�Be��_$       B+�M	��⚁��A�
*

Training_lossR��B���$       B+�M	ܷ>����A�
*

Training_loss2�B�
C�$       B+�M	O@�����A�
*

Training_loss^��BD��$       B+�M	�>�����A�
*

Training_loss�q�B��$       B+�M	Gb����A�
*

Training_losss	�B@�X8$       B+�M	�X�����A�
*

Training_loss�!�B`Y��$       B+�M	������A�
*

Training_loss��B4��$       B+�M	�Fv����A�
*

Training_loss��B����$       B+�M	�Fҝ���A�
*

Training_lossY��B����$       B+�M	B.����A�
*

Training_loss�y�B�$       B+�M	�M�����A�
*

Training_loss>��By��*       ����	��N����A�
*

Validation_accuracyKJL?�g�&       sO� 	��N����A�
*

Validation_loss��iBF���$       B+�M	#�����A�
*

Training_loss>��B�G�$       B+�M	�䠁��A�
*

Training_lossO�B?#�$       B+�M	s�?����A�
*

Training_loss��BͲ�$       B+�M	|������A�
*

Training_loss�K�B��y�$       B+�M	�,�����A�
*

Training_loss~՚B��$       B+�M	�@S����A�
*

Training_loss��BcΦ�$       B+�M		������A�
*

Training_loss�=�Ba\K�$       B+�M	��
����A�
*

Training_loss6�BY�5�$       B+�M	B_f����A�
*

Training_loss��B���Y$       B+�M	=�£���A�
*

Training_lossS�B{Wo�$       B+�M	�����A�
*

Training_loss�بB���$       B+�M	��z����A�
*

Training_loss��B�;�'$       B+�M	��֤���A�
*

Training_loss/��B)vi)$       B+�M	�M3����A�
*

Training_loss���B��$       B+�M	5������A�
*

Training_loss�^�B-��}$       B+�M	��륁��A�
*

Training_loss뵢B2��$       B+�M	�HH����A�
*

Training_lossn>�B��=�$       B+�M	����A�
*

Training_lossU��B�zP�$       B+�M	y ����A�
*

Training_loss{D�B����$       B+�M	��_����A�
*

Training_loss�U�B��*�$       B+�M	3�����A�
*

Training_lossX=�B�$��$       B+�M	j�����A�
*

Training_loss'��B��>�$       B+�M	r�s����A�
*

Training_loss�L�B�4��$       B+�M	q8Ϩ���A�
*

Training_loss};�BYu�^$       B+�M	��+����A�
*

Training_loss8m�B;�.�$       B+�M	,������A�
*

Training_loss���B	��$       B+�M	S@䩁��A�
*

Training_loss���B}�٘$       B+�M	�!@����A�
*

Training_loss�v�Be�ف$       B+�M	ͬ�����A�
*

Training_loss���B"	�$       B+�M		������A�
*

Training_loss���B�Θ�$       B+�M	�U����A�
*

Training_loss�ʚBkpv�$       B+�M	�
�����A�
*

Training_loss��Bb�$       B+�M	������A�
*

Training_loss���BNx�5$       B+�M	�th����A�
*

Training_loss��Bޒ0e$       B+�M	��Ĭ���A�
*

Training_lossà�B��$       B+�M	�� ����A�
*

Training_loss^��B,@��$       B+�M	Tr|����A�
*

Training_loss��B:�U$       B+�M	'�ح���A�
*

Training_loss�ɟB���\$       B+�M	$�4����A�
*

Training_loss0��BQ��B$       B+�M	�R�����A�
*

Training_lossrD�B���+$       B+�M	̴쮁��A�
*

Training_loss�߶BjG1�$       B+�M	�kH����A�
*

Training_loss�:�B:a�$       B+�M	�ӣ����A�
*

Training_loss�~�B[�S}$       B+�M	� ����A�
*

Training_lossPO�B2���$       B+�M	8,\����A�
*

Training_lossgB�BX6@q$       B+�M	('�����A�
*

Training_lossn��BO�$       B+�M	Hn����A�
*

Training_loss��BD�|D$       B+�M	g�p����A�
*

Training_lossI��B�U�$       B+�M	�ͱ���A�
*

Training_loss��B>�i!$       B+�M	gE*����A�
*

Training_loss`�BRt~*       ����	�������A�
*

Validation_accuracy��L?t���&       sO� 	�������A�
*

Validation_loss��fB��$       B+�M	I+#����A�
*

Training_loss3��B���$       B+�M	��~����A�
*

Training_loss�K�BYr֕$       B+�M	V�ڴ���A�
*

Training_loss.��Bj�u�$       B+�M	t\6����A�
*

Training_lossL��Be��.$       B+�M	�R�����A�
*

Training_loss!�Bcc"�$       B+�M	�������A�
*

Training_loss<��B�Tv$       B+�M	��I����A�
*

Training_loss�sB`�͜$       B+�M	I������A�
*

Training_loss���B�џ�$       B+�M	�}����A�
*

Training_loss^��B����$       B+�M	�G]����A�
*

Training_loss��B��#�$       B+�M	�j�����A�
*

Training_loss@��B]^|$       B+�M	������A�
*

Training_loss���B~2��$       B+�M	�9u����A�
*

Training_lossAX�B)7��$       B+�M	i�Ѹ���A�
*

Training_loss��Bx��C$       B+�M	�.����A�
*

Training_lossK�B�9s�$       B+�M	|+�����A�
*

Training_loss��B��K�$       B+�M	�鹁��A�
*

Training_loss��BDO�[$       B+�M	��E����A�
*

Training_lossu�BW�$       B+�M	Y������A�
*

Training_loss��B.��$       B+�M	������A�
*

Training_loss/��B��v$       B+�M	U2Y����A�
*

Training_loss䇽B���$       B+�M	������A�
*

Training_loss���B�%\?$       B+�M	S�����A�
*

Training_loss/X�B�t$       B+�M	�m����A�
*

Training_loss9��B�6�$       B+�M	��ȼ���A�
*

Training_lossh��B�mP$       B+�M	�W$����A�
*

Training_loss��By��F$       B+�M	
�����A�
*

Training_lossL�B䝶�$       B+�M	�۽���A�
*

Training_loss���B@��'$       B+�M	�7����A�
*

Training_loss�f�B��+$       B+�M	�L�����A�
*

Training_loss0�B�X% $       B+�M	��ﾁ��A�
*

Training_loss�e�B*V4$       B+�M	5�L����A�
*

Training_loss�m�BI�}$       B+�M	tB�����A�
*

Training_loss���B���$       B+�M	������A�
*

Training_loss0i�B����$       B+�M	��`����A�
*

Training_loss���B7�D$       B+�M	x�����A�
*

Training_loss���B��f$       B+�M	������A�
*

Training_lossؕ�B%ۘ\$       B+�M	��w����A�
*

Training_loss�)�Bޱ2\$       B+�M	�������A�
*

Training_lossb��BH��J$       B+�M	ӈ0��A�
*

Training_lossv�BO�:$       B+�M	Y����A�
*

Training_loss(�B��X$       B+�M	į���A�
*

Training_lossl-hB��S�$       B+�M	cBCÁ��A�
*

Training_loss���Bᯛ�$       B+�M	���Á��A�
*

Training_loss�#�Bx��b$       B+�M	���Á��A�
*

Training_lossc
�B����$       B+�M	�sXā��A�
*

Training_lossA�B�X�$       B+�M	�\�ā��A�
*

Training_lossj5�B���$       B+�M	wŁ��A�
*

Training_loss\��BQ�$       B+�M	� mŁ��A�
*

Training_lossF1�B_�/�$       B+�M	�[�Ł��A�
*

Training_loss �Bc�3I*       ����	�ƋƁ��A�
*

Validation_accuracy  L?r��X&       sO� 	%ɋƁ��A�
*

Validation_loss�kBT��$       B+�M	T��ǁ��A�
*

Training_loss6%�B^W�z$       B+�M	q4ȁ��A�
*

Training_loss��B^�$       B+�M	6ΐȁ��A�
*

Training_loss0�B*,vm$       B+�M	E��ȁ��A�
*

Training_lossC��B/��$       B+�M	�HɁ��A�
*

Training_loss���BX�]$       B+�M	���Ɂ��A�
*

Training_loss�e�B�9��$       B+�M	��Ɂ��A�
*

Training_lossM�B�!6&$       B+�M	�B[ʁ��A�*

Training_loss/��B���$       B+�M	�Ӷʁ��A�*

Training_loss��Bg�?$       B+�M	lˁ��A�*

Training_loss e�B+a��$       B+�M	��mˁ��A�*

Training_loss>��B($       B+�M	a5�ˁ��A�*

Training_loss���BP�$       B+�M	��&́��A�*

Training_loss8��B�M͵$       B+�M	Dj�́��A�*

Training_loss�^�B���$       B+�M	�j�́��A�*

Training_loss��BǴx�$       B+�M		�;́��A�*

Training_loss���BM�$       B+�M	|ԗ́��A�*

Training_loss�m�BJVY�$       B+�M	s��́��A�*

Training_lossz�B� �$       B+�M	��P΁��A�*

Training_loss=�Bt��$       B+�M	f��΁��A�*

Training_lossET�B�HP�$       B+�M	��ρ��A�*

Training_loss(+�B��9c$       B+�M	�Ydρ��A�*

Training_loss\�Bhjp$       B+�M	I��ρ��A�*

Training_loss5�Bs�]c$       B+�M	p�Ё��A�*

Training_loss >�BS�],$       B+�M	DlyЁ��A�*

Training_loss���B��$       B+�M	?��Ё��A�*

Training_loss��B�6�$       B+�M	/�0с��A�*

Training_loss59�B�/$       B+�M	k(�с��A�*

Training_loss�xB���$       B+�M	�R�с��A�*

Training_loss��B`A$       B+�M	�dCҁ��A�*

Training_loss���B�&{U$       B+�M	en�ҁ��A�*

Training_lossiҿB�<:�$       B+�M	�^�ҁ��A�*

Training_lossY��B[J8$       B+�M	�'XӁ��A�*

Training_loss���B��<$       B+�M	#�Ӂ��A�*

Training_loss���B���$       B+�M	/�ԁ��A�*

Training_loss*ŽB�!��$       B+�M	�Kmԁ��A�*

Training_loss���B����$       B+�M	�6�ԁ��A�*

Training_loss w�BP�@$       B+�M	�%Ձ��A�*

Training_lossbj�B#M��$       B+�M	/��Ձ��A�*

Training_loss�&�BXg	$       B+�M	6�Ձ��A�*

Training_lossxZ�B�h��$       B+�M	�<<ց��A�*

Training_loss0��B�%��$       B+�M	x��ց��A�*

Training_loss�ĥB�[�e$       B+�M	�g�ց��A�*

Training_loss�Bs���$       B+�M	_Pׁ��A�*

Training_loss��B3�b$       B+�M	Ϋׁ��A�*

Training_loss���B<�D�$       B+�M	��؁��A�*

Training_loss�R�B$A$       B+�M	Z�c؁��A�*

Training_loss���BR���$       B+�M	���؁��A�*

Training_loss~�B���!$       B+�M	��ف��A�*

Training_loss���B���S$       B+�M	�vف��A�*

Training_lossS٬B��}I*       ����	nR:ځ��A�*

Validation_accuracy��M?��ܗ&       sO� 	�T:ځ��A�*

Validation_lossA�`B�m�$       B+�M	�܅ہ��A�*

Training_loss��B��;�$       B+�M	�P�ہ��A�*

Training_loss뵰BtN{�$       B+�M	��<܁��A�*

Training_loss���Bf(�$       B+�M	m��܁��A�*

Training_lossĦ�B4��$       B+�M	�l�܁��A�*

Training_losskt�BF#�;$       B+�M	-'P݁��A�*

Training_lossG��B��]�$       B+�M	~��݁��A�*

Training_loss69�Br��$       B+�M	�Hށ��A�*

Training_loss��B�ͽ7$       B+�M	_\dށ��A�*

Training_loss7��Bgs5�$       B+�M	M��ށ��A�*

Training_loss�;�B}��!$       B+�M	��߁��A�*

Training_loss��B_tB�$       B+�M	��x߁��A�*

Training_loss�"�B7�#$       B+�M	5%�߁��A�*

Training_loss��B�y�V$       B+�M	-�0����A�*

Training_loss w�BM!c1$       B+�M	Ό����A�*

Training_loss<�B!�m�$       B+�M	[������A�*

Training_loss�#�B6aH$       B+�M	{E���A�*

Training_loss"d�B,�F�$       B+�M	V)����A�*

Training_loss��B|��L$       B+�M	�����A�*

Training_loss�-�B�2��$       B+�M	�TX���A�*

Training_lossᄌB
�$       B+�M	(����A�*

Training_loss�%�B�@��$       B+�M	�����A�*

Training_loss@�B�N�]$       B+�M	��k���A�*

Training_loss�Z�B�C��$       B+�M	d�����A�*

Training_loss�6�B���"$       B+�M	�#���A�*

Training_loss���B�!$       B+�M	�_���A�*

Training_loss�r�B��T�$       B+�M	������A�*

Training_loss;�B�/$       B+�M	�Z8���A�*

Training_loss���B22�$       B+�M	�Ε���A�*

Training_loss�ǽB����$       B+�M	"r����A�*

Training_loss�i�B�P��$       B+�M	�qN���A�*

Training_lossiݓBz�K�$       B+�M	������A�*

Training_loss�B-��v$       B+�M	����A�*

Training_loss�>qB!�`�$       B+�M	}vw���A�*

Training_loss�έB5 ql$       B+�M	+����A�*

Training_loss�)�Br$       B+�M	p�.���A�*

Training_loss��yBOV�$       B+�M	؛����A�*

Training_loss�d�B'��$       B+�M	p�����A�*

Training_lossd�VBT;Tx$       B+�M	(HB���A�*

Training_loss�>�B����$       B+�M	~:����A�*

Training_loss���B���$       B+�M	������A�*

Training_loss���BI>2e$       B+�M	�LX���A�*

Training_loss�V�Bxt$       B+�M	~�����A�*

Training_loss᳡B�MZ�$       B+�M	
����A�*

Training_loss�,�BkF]$       B+�M	�l���A�*

Training_loss�+�BR(�m$       B+�M	������A�*

Training_lossk�iBs��$       B+�M	k$���A�*

Training_losssy�B!xS�$       B+�M	�����A�*

Training_loss�ȌB�p��$       B+�M	r�����A�*

Training_loss?�BIOt�$       B+�M	'�7���A�*

Training_loss�'B���*       ����	������A�*

Validation_accuracy��N?uͤg&       sO� 	ӿ����A�*

Validation_lossh^Bv��$       B+�M	xDJ���A�*

Training_lossx(pB&ط$       B+�M	*����A�*

Training_loss5��B(��$       B+�M	�6����A�*

Training_loss�d�B�3`f$       B+�M	�X^����A�*

Training_loss�E�Ba�$       B+�M	�q�����A�*

Training_lossd��B(�j�$       B+�M	�&���A�*

Training_loss�ˠB���q$       B+�M	��q���A�*

Training_loss��B�rN2$       B+�M	H�����A�*

Training_loss_&�BXݯ�$       B+�M	�)���A�*

Training_loss޾�Bx�j$       B+�M	�����A�*

Training_loss*��Bkiv$       B+�M	�����A�*

Training_loss�n�B^��$       B+�M	�2=���A�*

Training_lossi�B��W$       B+�M	�D����A�*

Training_loss䗉B,��$       B+�M	�G����A�*

Training_loss���B�w�S$       B+�M	�pR���A�*

Training_loss�B��+$       B+�M	�����A�*

Training_lossW�B�s��$       B+�M	+P
����A�*

Training_loss @�B&!>�$       B+�M	�g����A�*

Training_loss��B�<��$       B+�M	�������A�*

Training_loss��BUh�$       B+�M	������A�*

Training_loss�Q�B)��a$       B+�M	0�|����A�*

Training_loss��Bʌ��$       B+�M	3�����A�*

Training_loss!�B��A$       B+�M	L85����A�*

Training_loss�ѹBW�$       B+�M	�������A�*

Training_lossr�B���\$       B+�M	������A�*

Training_lossl��B���$       B+�M	!�H����A�*

Training_loss��B�l��$       B+�M	3������A�*

Training_loss[a[B��T$       B+�M	� ����A�*

Training_loss��B��$       B+�M	��[����A�*

Training_lossA��B���$       B+�M	?o�����A�*

Training_loss�`�Bu�4�$       B+�M	������A�*

Training_lossٍ�B/��D$       B+�M	SBp����A�*

Training_loss
L�B�pğ$       B+�M	������A�*

Training_loss���B���$       B+�M	(����A�*

Training_lossd6�B5�w9$       B+�M	������A�*

Training_lossV��B�p&y$       B+�M	������A�*

Training_lossx�Bu��$       B+�M	�f<����A�*

Training_loss�W�B�&�$       B+�M	U������A�*

Training_loss ܼB���$       B+�M	@�����A�*

Training_loss�W�BH��$       B+�M	[�P����A�*

Training_loss~�Br.$       B+�M	�;�����A�*

Training_lossn<�Bi���$       B+�M	Ct����A�*

Training_loss\V�B���$       B+�M	��c����A�*

Training_loss菪B�|lX$       B+�M	Z�����A�*

Training_loss�ǙB��$       B+�M	������A�*

Training_loss�өB��(,$       B+�M	m�w����A�*

Training_loss�\�Bf�(�$       B+�M	jm�����A�*

Training_loss�~�B0ĉ�$       B+�M	�/ ���A�*

Training_lossEg�B����$       B+�M	>Z� ���A�*

Training_loss��B�Z��$       B+�M	��� ���A�*

Training_lossC��B�9�{*       ����	,����A�*

Validation_accuracy��M?7��&       sO� 	�����A�*

Validation_loss[�hB�#V�$       B+�M	�v���A�*

Training_loss�+�B��6�$       B+�M	��h���A�*

Training_loss���B��7$       B+�M	�0����A�*

Training_lossZ��B �*z$       B+�M	J� ���A�*

Training_lossV8�B��A$       B+�M	��|���A�*

Training_loss���B�D$       B+�M	������A�*

Training_loss��B�ޭ�$       B+�M	k6���A�*

Training_lossa��B`h�$       B+�M	>ϒ���A�*

Training_loss�y�B��N;$       B+�M	З����A�*

Training_lossVe�B�1d�$       B+�M	�K���A�*

Training_loss� �B�|6$       B+�M	g�����A�*

Training_loss˾�B��g $       B+�M	�%���A�*

Training_loss�_�B���,$       B+�M	s�^���A�*

Training_loss~��BM�zt$       B+�M	�����A�*

Training_lossDp�B��jF$       B+�M	�����A�*

Training_loss���B��P$       B+�M	�tr���A�*

Training_loss��B�2/�$       B+�M	�2����A�*

Training_loss80�B�)�$       B+�M	G�)	���A�*

Training_loss*�Bgk�6$       B+�M	$*�	���A�*

Training_lossK4jB	��$       B+�M	�Z�	���A�*

Training_loss*[�B�z�-$       B+�M	
=
���A�*

Training_lossIW�B�0�$       B+�M	��
���A�*

Training_loss�ԶB���$       B+�M	f��
���A�*

Training_loss2�B�"��$       B+�M	�8Q���A�*

Training_loss���B�P�$       B+�M	�����A�*

Training_loss�HB��4�$       B+�M	�
	���A�*

Training_loss@��Bg�%`$       B+�M	j�e���A�*

Training_lossh�kB�ӧ�$       B+�M	�����A�*

Training_loss恚By��$       B+�M	Sv���A�*

Training_lossu��B����$       B+�M	�y���A�*

Training_loss��BIq��$       B+�M	�j����A�*

Training_loss�+�B}��$       B+�M	�m1���A�*

Training_loss�!xB?�'�$       B+�M	̴����A�*

Training_loss��B���$       B+�M	Z�����A�*

Training_lossL@�BM��$       B+�M	?pF���A�*

Training_loss�u�B����$       B+�M	�����A�*

Training_loss��BH��$       B+�M	F{����A�*

Training_loss��B�8{�$       B+�M	uZZ���A�*

Training_loss�l�B<�&$       B+�M	mW����A�*

Training_loss��BGV]$       B+�M	�T���A�*

Training_loss�6�B�7C$       B+�M	�Fn���A�*

Training_lossLʱB���$       B+�M	�)����A�*

Training_loss��B�u�|$       B+�M	T'���A�*

Training_loss���Br�t$       B+�M	�-����A�*

Training_loss��B�}�$       B+�M	^�����A�*

Training_loss�<�Bt�F�$       B+�M	�S=���A�*

Training_lossvszB���*$       B+�M	 7����A�*

Training_lossk�nB���$       B+�M	�����A�*

Training_loss�6�B��}$       B+�M	�Q���A�*

Training_lossc PB���$       B+�M	y����A�*

Training_loss�ɠB����*       ����	q���A�*

Validation_accuracyuuM?�$_&       sO� 	eq���A�*

Validation_loss�n^Bt��$       B+�M		�����A�*

Training_loss���B���$       B+�M	�� ���A�*

Training_loss��B�ӈ$       B+�M	�(}���A�*

Training_loss �Bs�j�$       B+�M	g����A�*

Training_loss�h�B��l$       B+�M	��4���A�*

Training_loss��By��$       B+�M	������A�*

Training_lossƓB�>��$       B+�M	������A�*

Training_loss\�B���$       B+�M	nL���A�*

Training_loss�.�B��)�$       B+�M	d����A�*

Training_lossFs�B`6z$       B+�M	�n���A�*

Training_loss��B!��$       B+�M	��`���A�*

Training_loss�R�B�:�$       B+�M	�,����A�*

Training_loss��BP���$       B+�M	.9���A�*

Training_loss�[�By8��$       B+�M	Nt���A�*

Training_lossZ�B��:5$       B+�M	m�����A�*

Training_lossO�B�J`�$       B+�M	��+���A�*

Training_loss�l�B2g%e$       B+�M	������A�*

Training_lossW��B�f�$       B+�M	 t����A�*

Training_loss�~�B�ǃ$       B+�M	��>���A�*

Training_lossx�}B�D�$       B+�M	�����A�*

Training_loss�/�B[���$       B+�M	�����A�*

Training_lossL�B�oR$       B+�M	 �R���A�*

Training_loss��B�x<$       B+�M	J����A�*

Training_loss�`mBgHco$       B+�M	��
���A�*

Training_lossF��B�LA�$       B+�M	�Pf���A�*

Training_lossXS�B+�[�$       B+�M	 ����A�*

Training_lossB��Bl}wU$       B+�M	�� ���A�*

Training_loss湟Bo���$       B+�M	��y ���A�*

Training_lossҿ�B�Y`�$       B+�M	
�� ���A�*

Training_losst�B�b��$       B+�M	K2!���A�*

Training_loss��B\)&$       B+�M	C<�!���A�*

Training_loss\�B�	��$       B+�M	�d�!���A�*

Training_loss���B����$       B+�M	PSE"���A�*

Training_loss3�qB���$       B+�M	_�"���A�*

Training_lossd��B,��e$       B+�M	��"���A�*

Training_loss�T�B�ݟH$       B+�M	B�Y#���A�*

Training_loss�LUBL�8�$       B+�M	�#���A�*

Training_loss	}�B.�
$       B+�M	 `$���A�*

Training_loss��B�P��$       B+�M	{�m$���A�*

Training_loss��tB� n$       B+�M	V�$���A�*

Training_loss�B�@i�$       B+�M	2%%���A�*

Training_loss�#�B�묰$       B+�M	I��%���A�*

Training_loss�G�B��R�$       B+�M	�6�%���A�*

Training_loss&��B^c 1$       B+�M	�y9&���A�*

Training_loss~�B�a��$       B+�M	wK�&���A�*

Training_loss�B�Hw�$       B+�M	K;�&���A�*

Training_loss��Bw��^$       B+�M	��L'���A�*

Training_loss���B�	��$       B+�M	���'���A�*

Training_loss8U�B�M��$       B+�M	8�(���A�*

Training_loss�׈B}~�$       B+�M	,Da(���A�*

Training_lossP��B�7�*       ����	&�%)���A�*

Validation_accuracyKKN?�c��&       sO� 	�%)���A�*

Validation_loss_B�Q5�$       B+�M	��*���A�*

Training_losstkB�μ�$       B+�M	���*���A�*

Training_loss���B�X�U$       B+�M	(�L+���A�*

Training_lossܢBmP$       B+�M	�ͨ+���A�*

Training_loss�D�B�MA�$       B+�M	5b,���A�*

Training_loss��BO�
$       B+�M	x�`,���A�*

Training_lossh��BD�+$       B+�M	}�,���A�*

Training_loss���B�c�9$       B+�M	�-���A�*

Training_loss���BXF
�$       B+�M	|'t-���A�*

Training_loss��B�*�F$       B+�M	�H�-���A�*

Training_loss*�B=w�W$       B+�M	',.���A�*

Training_loss��B��$       B+�M	�Ԉ.���A�*

Training_losso��B-���$       B+�M	)A�.���A�*

Training_loss*�B�̀�$       B+�M	MLA/���A�*

Training_loss���B�ݓ$       B+�M	��/���A�*

Training_loss; �B*�$       B+�M	<M�/���A�*

Training_loss���B����$       B+�M	u�U0���A�*

Training_loss���B��٫$       B+�M	f0�0���A�*

Training_lossrH�Bʯ�S$       B+�M	C�1���A�*

Training_loss�ОBz�l�$       B+�M	_k1���A�*

Training_loss"��B�i�u$       B+�M	vl�1���A�*

Training_loss��B� o�$       B+�M	B|/2���A�*

Training_lossk �Bœ��$       B+�M	I��2���A�*

Training_lossKS�B��$       B+�M	:��2���A�*

Training_loss-oEB���$       B+�M	G:O3���A�*

Training_lossk��BT�b�$       B+�M	��3���A�*

Training_loss���BD"-�$       B+�M	��4���A�*

Training_loss�BB�9�$       B+�M	�ec4���A�*

Training_loss��B�R�o$       B+�M	�־4���A�*

Training_loss)�B�Uz�$       B+�M	�5���A�*

Training_lossw��BG0��$       B+�M	wv5���A�*

Training_lossI��B0ˤI$       B+�M	{.�5���A�*

Training_loss��B��D�$       B+�M	q-6���A�*

Training_loss��B~���$       B+�M	�8�6���A�*

Training_lossg��B�_#K$       B+�M	B'�6���A�*

Training_lossed�B�H�$       B+�M	=B7���A�*

Training_loss\cB�a�$       B+�M	��7���A�*

Training_loss�m�BH2��$       B+�M	���7���A�*

Training_lossD�B=��l$       B+�M	�U8���A�*

Training_loss�g�BV9$       B+�M	'�8���A�*

Training_loss��B�"$       B+�M	�9���A�*

Training_lossD �B�'��$       B+�M	�j9���A�*

Training_lossOb�BU���$       B+�M	P�9���A�*

Training_loss�$�B����$       B+�M	� :���A�*

Training_loss�D�B�� N$       B+�M	��}:���A�*

Training_losso�B��u�$       B+�M	���:���A�*

Training_loss��B�$       B+�M	~6;���A�*

Training_loss�<�B?��$       B+�M	�\�;���A�*

Training_loss\x�B�U�$       B+�M	6�;���A�*

Training_loss�
�B��Y�$       B+�M	GL<���A�*

Training_loss6\�Bu3*       ����	jL=���A�*

Validation_accuracy!!N?1���&       sO� 	�N=���A�*

Validation_loss��]B���$       B+�M	��|>���A�*

Training_loss�ȶB��$$       B+�M	��>���A�*

Training_loss�3�B��B�$       B+�M	uZ5?���A�*

Training_loss(B�B��.n$       B+�M	��?���A�*

Training_loss	 �B3�<$       B+�M	���?���A�*

Training_loss���B0�if$       B+�M	��J@���A�*

Training_loss_r�B�`�G$       B+�M	���@���A�*

Training_losswA}BOY�$       B+�M	}A���A�*

Training_loss���BuѺC$       B+�M	;�^A���A�*

Training_loss9F�BI��$       B+�M	/l�A���A�*

Training_lossc��B�T��$       B+�M	�B���A�*

Training_lossD�sB|I#T$       B+�M	7�qB���A�*

Training_loss#ʇBWɡ$       B+�M	1A�B���A�*

Training_loss��B&�`$$       B+�M	=D)C���A�*

Training_loss�onBt��h$       B+�M	cD�C���A�*

Training_loss��tBY6�$       B+�M	���C���A�*

Training_loss���Bc�&�$       B+�M	�=D���A�*

Training_loss6�B���$       B+�M	�Y�D���A�*

Training_loss��_B-��$       B+�M	`�D���A�*

Training_loss* �B6��F$       B+�M	��QE���A�*

Training_lossʭ\Br��$       B+�M	��E���A�*

Training_lossJ��B7���$       B+�M	W�	F���A�*

Training_loss��B�~C�$       B+�M	DjfF���A�*

Training_loss�ϞB<���$       B+�M	���F���A�*

Training_loss��B��$       B+�M	��G���A�*

Training_loss4��B����$       B+�M	��zG���A�*

Training_loss0zB��M?$       B+�M	J}�G���A�*

Training_lossE��Bi�K$       B+�M	=b3H���A�*

Training_lossI��BZSf�$       B+�M	EK�H���A�*

Training_lossHi�B
b�$       B+�M	3�H���A�*

Training_losslŐBo8�k$       B+�M	[�GI���A�*

Training_loss>YB��w$       B+�M	���I���A�*

Training_loss��B��7$       B+�M	���I���A�*

Training_loss$�Bg-g�$       B+�M	Z�ZJ���A�*

Training_loss�_qB*R�$       B+�M	&q�J���A�*

Training_loss�:B�Z��$       B+�M	S#K���A�*

Training_losstd�B���($       B+�M	�2nK���A�*

Training_loss��B��6$       B+�M	��K���A�*

Training_loss��yBt�	$       B+�M	:�%L���A�*

Training_loss�PiBW�H�$       B+�M	���L���A�*

Training_loss��oB!'r�$       B+�M	=��L���A�*

Training_loss�2�B���$       B+�M	�9M���A�*

Training_lossc��B75�$       B+�M	���M���A�*

Training_loss�W�Bs�W�$       B+�M	���M���A�*

Training_loss�abB�?b�$       B+�M	�ON���A�*

Training_loss�_yBj@4	$       B+�M	�īN���A�*

Training_loss��B�i��$       B+�M	�]	O���A�*

Training_lossCF�B�6m�$       B+�M	�<fO���A�*

Training_lossp�B�z�W$       B+�M	�J�O���A�*

Training_loss�Z�B�N�$       B+�M	�P���A�*

Training_loss���B�U�p*       ����	�x�P���A�*

Validation_accuracy!!O?��<�&       sO� 	�z�P���A�*

Validation_loss83^BS���$       B+�M	v�UR���A�*

Training_loss��B�!4�$       B+�M	�ұR���A�*

Training_loss��vBP
W�$       B+�M	�S���A�*

Training_loss1x�B���$       B+�M	PjS���A�*

Training_loss���B��Z$       B+�M	���S���A�*

Training_lossٗ�BwIj�$       B+�M	�J!T���A�*

Training_loss��B��G!$       B+�M	�u}T���A�*

Training_loss5πB�R�$       B+�M	���T���A�*

Training_loss�@�B��$       B+�M	��5U���A�*

Training_lossvїB۝�$       B+�M	��U���A�*

Training_loss
)�B�MG$       B+�M	J��U���A�*

Training_lossj��B��~�$       B+�M	BZHV���A�*

Training_loss��B8V�q$       B+�M	C�V���A�*

Training_loss3�mB�,�n$       B+�M	�) W���A�*

Training_loss�&�B��$       B+�M	�%\W���A�*

Training_loss=B�a�$       B+�M	;p�W���A�*

Training_loss�G�B��nT$       B+�M	��X���A�*

Training_loss3u-BND.�$       B+�M	��oX���A�*

Training_loss���B���E$       B+�M	���X���A�*

Training_lossYEBX�l$       B+�M	(Y���A�*

Training_loss��B�y$       B+�M	�.�Y���A�*

Training_loss��B&�_>$       B+�M	���Y���A�*

Training_loss�\�BP��6$       B+�M	.7<Z���A�*

Training_loss���B�V�i$       B+�M	�u�Z���A�*

Training_loss��B4�
$       B+�M	���Z���A�*

Training_lossH��Bbq��$       B+�M	��N[���A�*

Training_lossʐ�B�ť$       B+�M	*ɪ[���A�*

Training_loss:2zB��$       B+�M	l^\���A�*

Training_lossF��B>��3$       B+�M	*c\���A�*

Training_loss��zB�)�9$       B+�M	�b�\���A�*

Training_loss�}�B�i��$       B+�M	=']���A�*

Training_lossWK�B��$�$       B+�M	��y]���A�*

Training_losstƀB�&��$       B+�M	w/�]���A�*

Training_loss�p�B���$       B+�M	�+2^���A�*

Training_loss�$OBj
�$       B+�M	�܍^���A�*

Training_loss�ʵBt#$       B+�M	w��^���A�*

Training_lossHG�B�x�U$       B+�M	��E_���A�*

Training_loss���B*ڞ$       B+�M	/j�_���A�*

Training_loss7>�Bey��$       B+�M	���_���A�*

Training_loss%ϑB]y!$       B+�M	W[`���A�*

Training_loss���B�a��$       B+�M	-�`���A�*

Training_lossd�kB^�8S$       B+�M	�Ga���A�*

Training_loss�ϋBOz�5$       B+�M	Pmoa���A�*

Training_lossjiBN��&$       B+�M	6X�a���A�*

Training_loss/{�B`���$       B+�M	�D'b���A�*

Training_lossҗBa�$       B+�M	��b���A�*

Training_loss�НBL6|$       B+�M	��b���A�*

Training_loss0��BjA�o$       B+�M	c;c���A�*

Training_loss�S�B�0d�$       B+�M	7��c���A�*

Training_loss
�zB��	X$       B+�M	#0�c���A�*

Training_loss̸�B-���*       ����	���d���A�*

Validation_accuracy!!N?��WL&       sO� 	̚�d���A�*

Validation_lossp�\B�3$       B+�M	`0f���A�*

Training_loss�`YBY:x$       B+�M	Þ�f���A�*

Training_lossإzB,�[�$       B+�M	�<�f���A�*

Training_loss�.�BW�&�$       B+�M	��Cg���A�*

Training_loss{�BDi$       B+�M	�!�g���A�*

Training_loss��B�R_W$       B+�M	 ��g���A�*

Training_losso��B9Q^$       B+�M	�Wh���A�*

Training_loss"�B9���$       B+�M	.��h���A�*

Training_loss��By�$       B+�M	��i���A�*

Training_loss/2�B�[gT$       B+�M	�li���A�*

Training_loss�MNB���$       B+�M	���i���A�*

Training_loss�'�BΨ�$       B+�M	�%j���A�*

Training_loss1��B?��$       B+�M	��j���A�*

Training_loss/�B;�bF$       B+�M	�'�j���A�*

Training_lossĭBh�yv$       B+�M	,-9k���A�*

Training_loss��B��!$       B+�M	7l�k���A�*

Training_loss4��B�c6$       B+�M	o��k���A�*

Training_loss���B���$       B+�M	c*Ml���A�*

Training_loss�:�B�Of�$       B+�M	��l���A�*

Training_loss/��B@�(B$       B+�M	f�m���A�*

Training_loss���B��$       B+�M	�am���A�*

Training_loss�p�B��p $       B+�M	_��m���A�*

Training_loss4BoŞ$       B+�M	�n���A�*

Training_loss�vB���$       B+�M	�	vn���A�*

Training_lossd|�B��)�$       B+�M	y�n���A�*

Training_loss�ِB��Q$       B+�M	�%.o���A�*

Training_lossw%�B0��W$       B+�M	l�o���A�*

Training_loss�B�zs�$       B+�M	��o���A�*

Training_loss�L�B�Yj$       B+�M	�FBp���A�*

Training_loss�	�BN��$       B+�M	��p���A�*

Training_loss�kB��;5$       B+�M	B��p���A�*

Training_lossz��B�l6$       B+�M		�Uq���A�*

Training_loss��BU�C�$       B+�M	��q���A�*

Training_loss��B�L�$       B+�M	Q�r���A�*

Training_loss/ҌB�o;$       B+�M	��hr���A�*

Training_loss�O�B?T�$       B+�M	Y��r���A�*

Training_loss���B��$       B+�M	��!s���A�*

Training_loss.�mB��eR$       B+�M	�w}s���A�*

Training_loss NlB��3N$       B+�M	�c�s���A�*

Training_loss�jB���$       B+�M	��5t���A�*

Training_lossl��B��k$       B+�M	#�t���A�*

Training_loss.�nB,Ǌ]$       B+�M	���t���A�*

Training_loss��uB��C�$       B+�M	�Ku���A�*

Training_lossZ�BpN�U$       B+�M	f�u���A�*

Training_loss�P�B�o7�$       B+�M	Pv���A�*

Training_loss 0�B#���$       B+�M	j_v���A�*

Training_loss��B�/��$       B+�M	���v���A�*

Training_loss��B��M<$       B+�M	�Fw���A�*

Training_loss�V�BC�:$       B+�M	[Dsw���A�*

Training_loss�B<�u�$       B+�M	:�w���A�*

Training_loss�:�B@Q-*       ����	��x���A�*

Validation_accuracy��N?�9T�&       sO� 	U��x���A�*

Validation_lossu\B5d$       B+�M	u�z���A�*

Training_loss�i�BeT~�$       B+�M	|mz���A�*

Training_loss��BA��:$       B+�M	)"�z���A�*

Training_lossBS�BLM$       B+�M	j&{���A�*

Training_loss�l'BD[Z.$       B+�M	�<�{���A�*

Training_loss�Z�B�!��$       B+�M	���{���A�*

Training_loss�ɋB��$       B+�M	[�:|���A�*

Training_loss,ޘB����$       B+�M	��|���A�*

Training_loss��B�kL$       B+�M	���|���A�*

Training_lossV��B�3$       B+�M	ǼW}���A�*

Training_loss���B��(�$       B+�M	��}���A�*

Training_loss]�B��P$       B+�M	S~���A�*

Training_loss�KwB� �$       B+�M	��k~���A�*

Training_loss��B�Z$       B+�M	��~���A�*

Training_loss갫B懁]$       B+�M	vS$���A�*

Training_lossd��B��	5$       B+�M	5B����A�*

Training_loss�B���~$       B+�M	�����A�*

Training_lossM�sB"<�-$       B+�M	��9����A�*

Training_loss~fB�C�$       B+�M	􉕀���A�*

Training_loss'��B�S�$       B+�M	�x���A�*

Training_loss�XBE�_�$       B+�M	��M����A�*

Training_loss��}By���$       B+�M	�������A�*

Training_loss�*B��,O$       B+�M	T�����A�*

Training_lossP=dB���,$       B+�M	�~a����A�*

Training_lossoTdB���$       B+�M	s�����A�*

Training_loss^�}B��H{$       B+�M	������A�*

Training_loss���B����$       B+�M	�2u����A�*

Training_loss �B��^�$       B+�M		kу���A�*

Training_loss&�OBBע)$       B+�M	�Y-����A�*

Training_loss��FB�='$       B+�M	�Ո����A�*

Training_loss�%lB�ZY�$       B+�M	��䄂��A�*

Training_loss��B���$       B+�M	ϿA����A�*

Training_loss��BVJ��$       B+�M	蝅���A�*

Training_loss��bB:�0$       B+�M	�|�����A�*

Training_loss[��B/���$       B+�M	6vV����A�*

Training_loss	�SBa��$       B+�M	t�����A�*

Training_lossΠB��$       B+�M	�����A�*

Training_lossO�B��jQ$       B+�M	�Ei����A�*

Training_loss�!VB��U�$       B+�M	G�Ň���A�*

Training_loss
�B��$       B+�M	�!����A�*

Training_loss�B�~A�$       B+�M	~����A�*

Training_loss\�B��O�$       B+�M	�ڈ���A�*

Training_loss��B�bs$       B+�M	$6����A�*

Training_lossz#�B�x�$       B+�M	5z�����A�*

Training_loss�1�B����$       B+�M	��퉂��A�*

Training_loss���B.�o$       B+�M	-J����A�*

Training_lossbkhB1��h$       B+�M	�祊���A�*

Training_loss�wxB���$       B+�M	P�����A�*

Training_loss�EB�j��$       B+�M	��^����A�*

Training_lossgդB���$       B+�M	黋���A�*

Training_losstNgBƵ��*       ����	������A�*

Validation_accuracy��O?͟�$&       sO� 	�����A�*

Validation_loss��PBĄ�$       B+�M	�����A�*

Training_loss�K�B�2\$       B+�M	�p����A�*

Training_loss9fwB%��$       B+�M	S�ˎ���A�*

Training_loss,��B��f�$       B+�M	��'����A�*

Training_loss1��BoR�$       B+�M	6�����A�*

Training_loss��B��n$       B+�M	ߏ���A�*

Training_loss�%�B��|�$       B+�M	�;����A�*

Training_loss��BFƾ�$       B+�M	������A�*

Training_lossj��B�ߎ$       B+�M	�����A�*

Training_loss��[B����$       B+�M	�6N����A�*

Training_loss
�4B�I$       B+�M	�������A�*

Training_loss�;�B�gq�$       B+�M	������A�*

Training_loss��B�C�$       B+�M	V�a����A�*

Training_loss���B�f��$       B+�M	Y������A�*

Training_loss F�B�.$       B+�M	������A�*

Training_loss5�B�*F�$       B+�M	�|����A�*

Training_loss��Bwo�^$       B+�M	�ד���A�*

Training_loss�SB�CX�$       B+�M	��3����A�*

Training_loss�!�B[]�$       B+�M	������A�*

Training_loss<5^BD��H$       B+�M	����A�*

Training_loss�v�BQ�$       B+�M	� N����A�*

Training_loss$g�B�;��$       B+�M	}������A�*

Training_loss��tBԳ��$       B+�M	[����A�*

Training_loss�2MB���$       B+�M	�b����A�*

Training_lossladBDTI�$       B+�M	-龖���A�*

Training_loss�E�B�� �$       B+�M	������A�*

Training_lossMS�B����$       B+�M	�Ew����A�*

Training_lossvr�B��;�$       B+�M	5ӗ���A�*

Training_lossng�B��n�$       B+�M	�.����A�*

Training_loss1__B#"��$       B+�M	�������A�*

Training_lossZچBۖ�b$       B+�M	��瘂��A�*

Training_lossj�BS��$       B+�M	�
E����A�*

Training_loss��B��}$       B+�M	�ӡ����A�*

Training_loss�>�B��$       B+�M	~o�����A�*

Training_loss�Y{B�"�$       B+�M	ٖZ����A�*

Training_loss��oB˜K$       B+�M	������A�*

Training_loss+�Bw���$       B+�M	�Z����A�*

Training_loss��nBz%�$       B+�M	2�n����A�*

Training_lossD!sBO�]�$       B+�M	�"˛���A�*

Training_loss*s�B��U�$       B+�M	L�&����A�*

Training_loss[,�B@��$       B+�M	T�����A�*

Training_loss!��B �$       B+�M	��ޜ���A�*

Training_loss]Bc6)�$       B+�M	�.;����A�*

Training_loss�a�B�(@�$       B+�M	2�����A�*

Training_loss��BH��7$       B+�M	�����A�*

Training_lossb9�B2�C�$       B+�M	�2O����A�*

Training_loss>�B ��$       B+�M	R
�����A�*

Training_lossd�B��3�$       B+�M	������A�*

Training_loss��BA&ܒ$       B+�M	��b����A�*

Training_loss�{fBF���$       B+�M	(Ծ����A�*

Training_loss�0�B�W;�*       ����	�������A�*

Validation_accuracy��O?VU�	&       sO� 	\������A�*

Validation_loss+�TB<��$       B+�M	�����A�*

Training_loss]#�B�#f$       B+�M	��^����A�*

Training_loss y�B��ټ$       B+�M	tF�����A�*

Training_loss�\�BJ�$       B+�M	f1����A�*

Training_loss��kBf�w4$       B+�M	�s����A�*

Training_loss���Bl0V$       B+�M	/�Σ���A�*

Training_lossD�VB�B�$       B+�M	�+����A�*

Training_loss
��BE�$       B+�M	�釤���A�*

Training_losshrBpeN�$       B+�M	X�㤂��A�*

Training_loss�{�Br�Y$       B+�M	�4@����A�*

Training_loss��B��t�$       B+�M	������A�*

Training_loss�JeB�՝�$       B+�M	�/�����A�*

Training_loss�+B���$       B+�M	C�S����A�*

Training_losslQB���3$       B+�M	V������A�*

Training_lossɊ[B��g�$       B+�M	�(����A�*

Training_loss��?B��$       B+�M	؛f����A�*

Training_loss�ZuBT	�$       B+�M	0ç���A�*

Training_loss��wB���$       B+�M	�����A�*

Training_loss>�kBDQ�$       B+�M	�'{����A�*

Training_lossYd8B6jPU$       B+�M	�ר���A�*

Training_loss#��B�-c�$       B+�M	��2����A�*

Training_loss� �B�$$       B+�M	;S�����A�*

Training_loss��B��G�$       B+�M	�>멂��A�*

Training_loss�zB��Co$       B+�M	W�G����A�*

Training_loss�-wBVD`p$       B+�M	�������A�*

Training_lossN�AB�;�$       B+�M	+������A�*

Training_loss�4�Bn)h�$       B+�M	'�[����A�*

Training_loss��B�]d�$       B+�M	 ䷫���A�*

Training_loss�nB�$       B+�M	�����A�*

Training_loss$��B:�&$       B+�M	�/q����A�*

Training_lossb̊B��*N$       B+�M	��̬���A�*

Training_loss�WBƹ�$       B+�M	�h)����A�*

Training_loss�U�B8��)$       B+�M	#J�����A�*

Training_loss}��B�|$       B+�M	Мୂ��A�*

Training_loss-Y|B��2S$       B+�M	��<����A�*

Training_lossҸnB��>$       B+�M	�3�����A�*

Training_loss)�B�v��$       B+�M	3����A�*

Training_lossl��B,~�$       B+�M	ӿO����A�*

Training_loss:�B�rp$       B+�M	;�����A�*

Training_loss�3�B2+S�$       B+�M	�~����A�*

Training_loss��jB�S��$       B+�M	H�c����A�*

Training_loss���B���$       B+�M	gտ����A�*

Training_loss~�LB=!�$       B+�M	�����A�*

Training_loss��B�=��$       B+�M	��w����A�*

Training_lossr�B)�Z�$       B+�M	�ӱ���A�*

Training_lossrp�B�t$       B+�M	��/����A�*

Training_lossl�^B4�oc$       B+�M	�.�����A�*

Training_loss�d5B��{�$       B+�M	��沂��A�*

Training_lossN�fBk�4{$       B+�M	+�B����A�*

Training_loss�s�BJKQ�$       B+�M	�`�����A�*

Training_lossF��B�:��*       ����	�Wa����A�*

Validation_accuracyxwP?��k&       sO� 	�[a����A�*

Validation_loss��VB2a�$       B+�M	D2�����A�*

Training_lossD~LB��I'$       B+�M	-CY����A�*

Training_lossFZ3B�/�$       B+�M	�Q�����A�*

Training_loss�>{B<�x�$       B+�M	j�����A�*

Training_lossp=�Bj�1�$       B+�M		n����A�*

Training_loss\��B���$       B+�M	ҋʷ���A�*

Training_lossEtaB7��$       B+�M	��&����A�*

Training_loss�MrB?5�$       B+�M	������A�*

Training_loss>JB���$       B+�M	��޸���A�*

Training_loss�rBR-u�$       B+�M	�};����A�*

Training_lossR��B�iYg$       B+�M	~ė����A�*

Training_loss;��B|.'H$       B+�M	N���A�*

Training_loss^`aB��)$       B+�M	��N����A�*

Training_loss�{yBOr�:$       B+�M	q˪����A�*

Training_lossG��B	�$       B+�M	
�����A�*

Training_loss��~B�{j$       B+�M	�7c����A�*

Training_loss�/GB��dg$       B+�M	�\�����A�*

Training_loss-��B|Cd$       B+�M	�Z����A�*

Training_loss�,�B���9$       B+�M	�gw����A�*

Training_loss#B7x��$       B+�M	�Ӽ���A�*

Training_loss���B�HX$       B+�M	�&/����A�*

Training_loss�vB���$       B+�M	�������A�*

Training_lossD݄B[��A$       B+�M	#/罂��A�*

Training_loss��Bҝ�$       B+�M	��C����A�*

Training_loss�B���G$       B+�M	P������A�*

Training_lossz�B���*$       B+�M	�������A�*

Training_loss��B�"Y�$       B+�M	ڎW����A�*

Training_loss�jB���>$       B+�M	Nd�����A�*

Training_loss+"yBh�p�$       B+�M	�8����A�*

Training_loss>M`B?<Ti$       B+�M	��l����A�*

Training_loss%��B�9}�$       B+�M	P�����A�*

Training_lossЈB�n$       B+�M	�O%����A�*

Training_loss���B��!$       B+�M	
K�����A�*

Training_lossh�B�X��$       B+�M	:u�����A�*

Training_lossL.CBcQR($       B+�M	�:��A�*

Training_loss�΍B�O��$       B+�M	~s���A�*

Training_loss�ɀB�o��$       B+�M	�n���A�*

Training_loss���B�Y]1$       B+�M	�HOÂ��A�*

Training_loss�q�BY8�$       B+�M	1�Â��A�*

Training_lossպ�Bp��$       B+�M	�Ă��A�*

Training_loss1��B�Hf$       B+�M	��cĂ��A�*

Training_loss%}�Bh�Ȯ$       B+�M	m�Ă��A�*

Training_lossj�B+>�$       B+�M	�Cł��A�*

Training_loss��bBAJV$       B+�M	"ył��A�*

Training_loss�DB��a$       B+�M	:��ł��A�*

Training_lossJ�B9�6S$       B+�M	�V1Ƃ��A�*

Training_loss���B`Y0$       B+�M	�s�Ƃ��A�*

Training_loss��lB&;�$       B+�M	��Ƃ��A�*

Training_loss0ˎB�ռ�$       B+�M	J�Dǂ��A�*

Training_loss@*hBr�:�$       B+�M	�o�ǂ��A�*

Training_loss��XBq�	~*       ����	5$sȂ��A�*

Validation_accuracy#"Q?o��&       sO� 	�&sȂ��A�*

Validation_lossh�TB��&Q$       B+�M	�^ʂ��A�*

Training_lossX�BCt��$       B+�M	ҍwʂ��A�*

Training_loss�mB׼�F$       B+�M	o+�ʂ��A�*

Training_lossg�JBd/�Q$       B+�M	�u0˂��A�*

Training_lossl�BWv?2$       B+�M	�C�˂��A�*

Training_lossv�zB|�m$       B+�M	qq�˂��A�*

Training_lossI�[Bɶ$       B+�M	4�Ê��A�*

Training_loss�XBT��U$       B+�M	)��̂��A�*

Training_loss�u�B8�*$       B+�M	÷�̂��A�*

Training_loss��B�pܿ$       B+�M	��X͂��A�*

Training_loss�ِB�V$       B+�M	��͂��A�*

Training_loss�B�qK�$       B+�M	��΂��A�*

Training_loss�R8B���$       B+�M	�&m΂��A�*

Training_loss��rB,���$       B+�M	h�΂��A�*

Training_loss�BuBޞ��$       B+�M	��%ς��A�*

Training_lossV�OB��$       B+�M	�O�ς��A�*

Training_loss��oBWs&x$       B+�M	�z�ς��A�*

Training_lossH�Bn�S�$       B+�M	�9Ђ��A�*

Training_loss��B":�$       B+�M	PR�Ђ��A�*

Training_loss:�B�-'`$       B+�M	�U�Ђ��A�*

Training_lossn��B��9�$       B+�M	�tMт��A�*

Training_loss$o�B� Z$       B+�M	U��т��A�*

Training_loss��TBRڗR$       B+�M	�C҂��A�*

Training_lossM�B��$       B+�M	��b҂��A�*

Training_loss`��B�Y�%$       B+�M	�ҽ҂��A�*

Training_loss/�B��$       B+�M	��ӂ��A�*

Training_loss�WBb��`$       B+�M	_�uӂ��A�*

Training_loss�8Bg��R$       B+�M	~s�ӂ��A�*

Training_loss��B��U$       B+�M	ʣ-Ԃ��A�*

Training_loss��|B�S0�$       B+�M	LS�Ԃ��A�*

Training_loss�^�B�]�$       B+�M	�H�Ԃ��A�*

Training_loss�<�BD���$       B+�M	��BՂ��A�*

Training_loss~�mBi8$       B+�M	X��Ղ��A�*

Training_lossˮSBx��`$       B+�M	'��Ղ��A�*

Training_lossO��B�]6$       B+�M	:Wւ��A�*

Training_lossf�BzZ��$       B+�M	%�ւ��A�*

Training_loss��Bo=�B$       B+�M	�ׂ��A�*

Training_loss�>cB�p\�$       B+�M	�jׂ��A�*

Training_loss��aB�@�$       B+�M	��ׂ��A�*

Training_loss��QB�oJ�$       B+�M	=�!؂��A�*

Training_lossatB*R|$       B+�M	��}؂��A�*

Training_loss�L�B@1��$       B+�M	���؂��A�*

Training_loss��SB�$'($       B+�M	�5ق��A�*

Training_loss�2�B�u�$       B+�M	��ق��A�*

Training_lossR�nBR�bg$       B+�M	��ق��A�*

Training_loss��GB���$       B+�M	�Iڂ��A�*

Training_loss�~�B�3�|$       B+�M	i�ڂ��A�*

Training_lossJDB�]�W$       B+�M	�Gۂ��A�*

Training_lossʫBB�D��$       B+�M	*�^ۂ��A�*

Training_loss�moB��w�$       B+�M	�ѹۂ��A�*

Training_loss�:B�a��*       ����	�C~܂��A�*

Validation_accuracy��O?|0��&       sO� 	�F~܂��A�*

Validation_lossdNB;�U$       B+�M	�"ނ��A�*

Training_loss�VBnIq$       B+�M	��}ނ��A�*

Training_loss�~B�@0[$       B+�M	F��ނ��A�*

Training_loss��Bj�Cm$       B+�M	7�5߂��A�*

Training_loss�ЀBߖ�$       B+�M	k)�߂��A�*

Training_loss��B�/Vd$       B+�M	���߂��A�*

Training_loss#-]BuP��$       B+�M	؛J����A�*

Training_loss�?�B�c�$       B+�M	Mf�����A�*

Training_loss8]fBH[�$       B+�M	�B���A�*

Training_loss\DuB��v�$       B+�M	#i^���A�*

Training_lossD��B��sB$       B+�M	������A�*

Training_lossn��B��0�$       B+�M	n0���A�*

Training_lossd�kB�D� $       B+�M	.�q���A�*

Training_loss��B�6��$       B+�M	�����A�*

Training_loss�
jBT��$       B+�M	w�)���A�*

Training_loss_��BE�u�$       B+�M	7���A�*

Training_loss y�BX8�1$       B+�M	������A�*

Training_loss�i�B~�'$       B+�M	#�>���A�*

Training_loss��BJ�]Z$       B+�M	<2����A�*

Training_loss���B�,$       B+�M	������A�*

Training_loss^'aBX�_�$       B+�M	{-S���A�*

Training_loss�B���_$       B+�M	`X����A�*

Training_loss�WVBl.|$       B+�M	M���A�*

Training_loss�0DB=�$       B+�M	Wyh���A�*

Training_lossʝoB[�m�$       B+�M	]����A�*

Training_loss�ȑBPX�X$       B+�M	G ���A�*

Training_loss�V�B��8g$       B+�M	�{���A�*

Training_loss��B��?3$       B+�M	}����A�*

Training_lossNL�BA�m�$       B+�M	��2���A�*

Training_loss�7�B�K��$       B+�M	k�����A�*

Training_loss���B��$       B+�M	�$����A�*

Training_lossBBc�M�$       B+�M	�G���A�*

Training_loss�lBB�s�$       B+�M	�����A�*

Training_losszA�Ba-�?$       B+�M	K�����A�*

Training_loss*~B��6�$       B+�M	vOY���A�*

Training_loss��aBD�}�$       B+�M	�i����A�*

Training_losskS�Bd.�)$       B+�M	~���A�*

Training_lossYD�B���$       B+�M	aTm���A�*

Training_loss��B���$       B+�M	߿����A�*

Training_loss�}�B�{�$       B+�M	�$���A�*

Training_loss�1oB�$       B+�M	m����A�*

Training_loss�]oB��A$       B+�M	�w����A�*

Training_lossk2&By�$       B+�M	��7���A�*

Training_loss��xB�P$       B+�M	ݵ����A�*

Training_loss�iBS��_$       B+�M	������A�*

Training_loss?F�B��ٿ$       B+�M	n�M���A�*

Training_loss�Q�B� E#$       B+�M	�����A�*

Training_loss�:B�ci0$       B+�M	����A�*

Training_lossJ�B[�^$       B+�M	��a���A�*

Training_loss5VzBn(�$       B+�M	������A�*

Training_lossyPB�/&*       ����	������A�*

Validation_accuracy#"Q?Ͱ�&       sO� 	g�����A�*

Validation_loss�UUB�̴�$       B+�M	`�+���A�*

Training_loss�IB�?�4$       B+�M	d?����A�*

Training_lossC�B9��$       B+�M	������A�*

Training_lossO�ABI��$       B+�M	\�@���A�*

Training_loss +oB~�'$       B+�M	�&����A�*

Training_loss��AB�A�T$       B+�M	�^����A�*

Training_loss�[pB:쥒$       B+�M	�DV���A�*

Training_loss킗B�E��$       B+�M	�����A�*

Training_lossrٴBKsL$       B+�M	�����A�*

Training_lossnD�BQ�6$       B+�M	D�j����A�*

Training_lossp�nBZ�uD$       B+�M	�+�����A�*

Training_loss?qeBS���$       B+�M	�"����A�*

Training_loss�G�B�ԳK$       B+�M	��~����A�*

Training_loss�mB�s��$       B+�M	AE�����A�*

Training_loss��BoV�k$       B+�M	~�6����A�*

Training_loss��]BXG�$       B+�M	4�����A�*

Training_loss���B��D$       B+�M	f������A�*

Training_lossB�a�$       B+�M	��J����A�*

Training_loss�=9BJL6�$       B+�M	Lq�����A�*

Training_lossK5qB�۔{$       B+�M	E����A�*

Training_loss�ȃB����$       B+�M	h�^����A�*

Training_lossa�DB��$       B+�M	.������A�*

Training_loss쬅BU�t�$       B+�M	�G����A�*

Training_loss���B���$       B+�M	�q����A�*

Training_loss��iB{c��$       B+�M	�A�����A�*

Training_loss|�sBG�n	$       B+�M	�)����A�*

Training_loss�"{BUv�$       B+�M	^g�����A�*

Training_loss4��B��L$       B+�M	[}�����A�*

Training_loss��hB`��$       B+�M	�^<����A�*

Training_loss�kgB��.$       B+�M		l�����A�*

Training_loss�>vB����$       B+�M	wN�����A�*

Training_loss�Br�(�$       B+�M	,P����A�*

Training_loss�>B�u|$       B+�M	#������A�*

Training_loss��Buo=�$       B+�M	�]����A�*

Training_lossǜB�m$       B+�M	�2d����A�*

Training_loss��DBdKD$       B+�M	Cǿ����A�*

Training_lossz�jB��ߌ$       B+�M	�����A�*

Training_loss�uB��G�$       B+�M	'�w����A�*

Training_loss�DB_y�$       B+�M	`������A�*

Training_loss��|B`5�"$       B+�M	��/ ���A�*

Training_loss$�B���$       B+�M	�;� ���A�*

Training_loss�'B�Afc$       B+�M	��� ���A�*

Training_loss�#XB����$       B+�M	�GC���A�*

Training_loss���BQ��$       B+�M	������A�*

Training_lossmewB(�(�$       B+�M	������A�*

Training_loss��B�K$       B+�M	��W���A�*

Training_loss��B����$       B+�M	������A�*

Training_lossM�B�y�6$       B+�M	�v���A�*

Training_loss�$�B�*st$       B+�M	��l���A�*

Training_loss�=�B̡�$       B+�M	������A�*

Training_loss,��B�'*       ����	�G����A�*

Validation_accuracy!!P?d ,�&       sO� 	VJ����A�*

Validation_loss�!KB�_�W$       B+�M	R�D���A�*

Training_loss0� B֐��$       B+�M	 �����A�*

Training_loss��B [�$       B+�M	�@����A�*

Training_lossL�B51Pl$       B+�M	Y���A�*

Training_loss�B(�$       B+�M	�8����A�*

Training_lossȩsB���$       B+�M	�~���A�*

Training_loss\B�r�$       B+�M	�Nm���A�*

Training_loss0�eB9w|l$       B+�M	�V����A�*

Training_loss 1tB��$g$       B+�M	�%	���A�*

Training_loss9EB�ͅO$       B+�M	���	���A�*

Training_loss4[BCr^�$       B+�M	���	���A�*

Training_loss��WB���$       B+�M	p{9
���A�*

Training_lossP8�B���$       B+�M	L��
���A�*

Training_loss ��B���$       B+�M	��
���A�*

Training_loss"�B�`�y$       B+�M	��M���A�*

Training_lossB���Z$       B+�M	Z����A�*

Training_lossȷ�B�8�$       B+�M	�L���A�*

Training_lossR�BI���$       B+�M	ita���A�*

Training_loss �B��&�$       B+�M	>�����A�*

Training_loss�1|Bi�f�$       B+�M	 ����A�*

Training_loss��By��$       B+�M	�uu���A�*

Training_loss8�tBч�~$       B+�M	6�����A�*

Training_loss�UB���$       B+�M	��-���A�*

Training_loss��MB5"��$       B+�M	c�����A�*

Training_loss���B)��$       B+�M	%t����A�*

Training_lossh��B�b�A$       B+�M	B���A�*

Training_loss�wuB��~�$       B+�M	E�����A�*

Training_loss��B�Mt5$       B+�M	�_����A�*

Training_loss��gB* FX$       B+�M	�mU���A�*

Training_loss��[B�hK$       B+�M	1C����A�*

Training_loss��mB�7�=$       B+�M	�a���A�*

Training_loss��YB���$       B+�M	�Ak���A�*

Training_lossYLB����$       B+�M	������A�*

Training_loss"��B@Ke1$       B+�M	�$���A�*

Training_loss�t�B���$       B+�M	�����A�*

Training_loss��wB&u��$       B+�M	[����A�*

Training_loss��9B�Ó$       B+�M	+QL���A�*

Training_lossM�{Bq��$       B+�M	������A�*

Training_loss*I�Boʤ$       B+�M	*X���A�*

Training_loss��PB<Pi�$       B+�M	�d���A�*

Training_loss�;]Btt�$       B+�M	�v����A�*

Training_lossʗB٧�$       B+�M	m����A�*

Training_loss�JTB̟�	$       B+�M	��w���A�*

Training_loss��B솒1$       B+�M	�����A�*

Training_loss>={BD�M�$       B+�M	�1���A�*

Training_lossn�[Bf�$       B+�M	�j����A�*

Training_loss�B?٩$       B+�M	�����A�*

Training_loss�5B�e�$       B+�M	�D���A�*

Training_loss��>B���=$       B+�M	�z����A�*

Training_loss<,�B��x�$       B+�M	?�����A�*

Training_loss 3BL���*       ����	������A�*

Validation_accuracy��O??��|&       sO� 	�����A�*

Validation_loss0zJB�9$       B+�M	F�y���A�*

Training_lossV1�B=�	$       B+�M	ٙ����A�*

Training_loss�Bi"($       B+�M	�_1���A�*

Training_loss�.5B�M[ $       B+�M	<ڌ���A�*

Training_loss;��B�:F�$       B+�M	�^����A�*

Training_loss-�cB|��$       B+�M	�E���A�*

Training_loss,tIB�%EB$       B+�M	i8����A�*

Training_loss�D�B�&�W$       B+�M	O����A�*

Training_loss#�B��]$       B+�M	J&Y���A�*

Training_lossl�.B~#�$       B+�M	�����A�*

Training_loss���B�p�$       B+�M	E����A�*

Training_loss=OiB$�$       B+�M	*n���A�*

Training_loss���B��W�$       B+�M	8,����A�*

Training_loss.AIB�3+$       B+�M	9~&���A�*

Training_loss���B���$       B+�M	������A�*

Training_loss/gFB�ү�$       B+�M	m�����A�*

Training_loss�7�B(���$       B+�M	"4; ���A�*

Training_lossVv�B`$       B+�M	u� ���A�*

Training_lossE�qBP�!�$       B+�M	cd� ���A�*

Training_lossGmpB�2�$       B+�M	�BN!���A�*

Training_lossz��B�(��$       B+�M	[a�!���A�*

Training_loss2�_Bj��5$       B+�M	�P"���A�*

Training_loss~IRB�6$       B+�M	�c"���A�*

Training_loss�:}BS5ō$       B+�M	��"���A�*

Training_loss- Bp�i$       B+�M	8k#���A�*

Training_loss_wB���|$       B+�M	ؼw#���A�*

Training_loss�[B�ݒ�$       B+�M	�]�#���A�*

Training_loss&tXB���l$       B+�M	�/$���A�*

Training_loss˙�B,g$       B+�M	��$���A�*

Training_loss���B�F�$       B+�M	�s�$���A�*

Training_loss��TB�ud$       B+�M	��C%���A�*

Training_loss�IAB%D-F$       B+�M	�ٟ%���A�*

Training_loss>6BE#�$       B+�M	$��%���A�*

Training_lossm�[BA���$       B+�M	�-W&���A�*

Training_loss���B��~�$       B+�M	e��&���A�*

Training_loss=i�B��1$       B+�M	��'���A�*

Training_lossd>Bʷ}$       B+�M	��k'���A�*

Training_lossI�Bc��	$       B+�M	z5�'���A�*

Training_loss�Q@B�.\�$       B+�M	ҫ#(���A�*

Training_loss�;B�vS$       B+�M	�](���A�*

Training_loss���B����$       B+�M	V��(���A�*

Training_lossl�[B��9$       B+�M	M�7)���A�*

Training_loss�#fB���$       B+�M	���)���A�*

Training_loss~q_BW/t$       B+�M	���)���A�*

Training_loss�I�B�K^,$       B+�M	1]K*���A�*

Training_loss�%FB��G}$       B+�M	�ӧ*���A�*

Training_loss#�TB���\$       B+�M	(�+���A�*

Training_loss�h^B���$       B+�M	�j_+���A�*

Training_loss��lBT8$       B+�M	EI�+���A�*

Training_loss��lBι$       B+�M	�9,���A�*

Training_loss��B����*       ����	w��,���A�*

Validation_accuracyxwQ?�i3z&       sO� 	/��,���A�*

Validation_loss:SBe�$       B+�M	��.���A�*

Training_lossűB7��$       B+�M	ۆ�.���A�*

Training_loss��OB0k�$       B+�M	�NT/���A�*

Training_loss/FtB��~7$       B+�M	 E�/���A�*

Training_loss��B��?g$       B+�M	��0���A�*

Training_loss�3B�^[M$       B+�M	�yi0���A�*

Training_loss�eB�AX$       B+�M	�0���A�*

Training_loss�BBM�jb$       B+�M	�!1���A�*

Training_loss�BT�F$       B+�M	��}1���A�*

Training_lossaqB��$       B+�M	~7�1���A�*

Training_loss��BKV�"$       B+�M	��62���A�*

Training_losszn�B�Tt$       B+�M	 �2���A�*

Training_loss�X�BDwۼ$       B+�M	��2���A�*

Training_lossQ�OBi@|#$       B+�M	��J3���A�*

Training_loss�utB[���$       B+�M	<2�3���A�*

Training_loss]�cB��h�$       B+�M	,�4���A�*

Training_loss2�VB?)�$       B+�M	~T^4���A�*

Training_lossYJBs!U�$       B+�M	�Z�4���A�*

Training_loss�(QBw��$       B+�M	��5���A�*

Training_loss�KB��\$       B+�M	j�q5���A�*

Training_loss�W!B�[>$       B+�M	�A�5���A�*

Training_loss�1�BD�h�$       B+�M	�n*6���A�*

Training_loss��cB �$       B+�M	?�6���A�*

Training_loss�]�B��$       B+�M	K��6���A�*

Training_lossW>B�Ce$       B+�M	F�>7���A�*

Training_loss�FB�� $       B+�M	��7���A�*

Training_lossH{yBŚ�	$       B+�M	J&�7���A�*

Training_loss��|Bo���$       B+�M	��S8���A�*

Training_lossD\B�'�u$       B+�M	�h�8���A�*

Training_lossXM|By
��$       B+�M	am9���A�*

Training_loss�FB"P�$       B+�M	�h9���A�*

Training_loss�ƘB����$       B+�M	���9���A�*

Training_lossd�/B��Ҷ$       B+�M	=C!:���A�*

Training_loss��QB�j�B$       B+�M	A}:���A�*

Training_loss��lBÙ�>$       B+�M	�R�:���A�*

Training_loss��BF<$       B+�M	Q�5;���A�*

Training_lossN�By��$       B+�M	�Z�;���A�*

Training_loss,Bj6$       B+�M	���;���A�*

Training_loss�v�BD�$       B+�M	�cI<���A�*

Training_loss�6LB��{�$       B+�M	L6�<���A�*

Training_loss(iBÐg6$       B+�M	��=���A�*

Training_loss�N�Br
$       B+�M	��]=���A�*

Training_loss�B8B6!(�$       B+�M	�Ĺ=���A�*

Training_lossPX:B*�+$       B+�M	��>���A�*

Training_loss��^B���$       B+�M	->q>���A�*

Training_loss�^jB>�=�$       B+�M	�L�>���A�*

Training_loss��8B��n$       B+�M	Jb)?���A�*

Training_loss��WBU���$       B+�M	y�?���A�*

Training_loss=�YB��.$       B+�M	UK�?���A�*

Training_lossK�CB��9x$       B+�M	8�>@���A�*

Training_lossD�rBu��*       ����	4�A���A�*

Validation_accuracy!!P?'+ &       sO� 	n�A���A�*

Validation_lossCMB���d$       B+�M	�;�B���A�*

Training_loss��lB�M��$       B+�M	�"C���A�*

Training_loss���Bf��"$       B+�M	m�nC���A�*

Training_lossp.cB:�xn$       B+�M	W�C���A�*

Training_loss�QB,�T�$       B+�M	1�&D���A�*

Training_loss"1TB8' �$       B+�M	-͂D���A�*

Training_loss
��B˳�C$       B+�M	��D���A�*

Training_loss<BLl��$       B+�M	ds:E���A�*

Training_loss@S�B�sx$       B+�M	i��E���A�*

Training_loss9,PB�)ݼ$       B+�M	���E���A�*

Training_lossl�vB�BO$       B+�M	�NF���A�*

Training_loss2[B�b�$       B+�M	q�F���A�*

Training_loss
�ZB-ZO�$       B+�M	XoG���A�*

Training_loss4XBYFk�$       B+�M	��bG���A�*

Training_lossP��B�$       B+�M	��G���A�*

Training_loss�#9B���$       B+�M	��H���A�*

Training_loss�oBQD��$       B+�M	�FvH���A�*

Training_lossb�>B:'�>$       B+�M	���H���A�*

Training_loss6l�Bk&*$       B+�M	�M.I���A�*

Training_loss0�HB�G$�$       B+�M	�	�I���A�*

Training_loss��B���$       B+�M	�j�I���A�*

Training_loss�~UBoD�$       B+�M	hABJ���A�*

Training_loss�N�B�|$       B+�M	i�J���A�*

Training_loss�jB�7$       B+�M	���J���A�*

Training_loss���B��=7$       B+�M	�WK���A�*

Training_loss�K�B~3�3$       B+�M	��K���A�*

Training_loss;q;B*��$       B+�M	�{L���A�*

Training_loss�naB���n$       B+�M	�]jL���A�*

Training_loss��@B%��$       B+�M	_��L���A�*

Training_losst\B�p��$       B+�M	f�"M���A�*

Training_loss$RB�"�$       B+�M	�M���A�*

Training_lossh�BG>$       B+�M	��M���A�*

Training_loss"�<BU��$       B+�M	��9N���A�*

Training_loss�z?B4�e$       B+�M	�e�N���A�*

Training_loss�GRB�KQ�$       B+�M	)��N���A�*

Training_loss�2B~]a$       B+�M	ʈMO���A�*

Training_lossFaB|���$       B+�M	��O���A�*

Training_loss1xB	Ѓ$       B+�M	��P���A�*

Training_loss�C1B^�Ā$       B+�M	�HbP���A�*

Training_loss��SB��$       B+�M	"��P���A�*

Training_loss�=�B�^$       B+�M	�iQ���A�*

Training_loss��[B70l�$       B+�M	�vQ���A�*

Training_loss8��B�&N$       B+�M	��Q���A�*

Training_loss��FB�[3�$       B+�M	��-R���A�*

Training_loss��B�d�$       B+�M	��R���A�*

Training_lossBKBp���$       B+�M	#��R���A�*

Training_loss�XB%�9$       B+�M	SZAS���A�*

Training_loss��EB�nk$       B+�M	,.�S���A�*

Training_loss�XB��7y$       B+�M	�<�S���A�*

Training_lossʠBB����$       B+�M	�VT���A�*

Training_loss��jB���+*       ����	�)U���A�*

Validation_accuracy��Q?;*j&       sO� 	,U���A�*

Validation_loss�|MB/f�D$       B+�M	���V���A�*

Training_loss�EBݧ�$       B+�M	Q�EW���A�*

Training_loss�HGB��S$       B+�M	���W���A�*

Training_loss�XKB~�ll$       B+�M	���W���A�*

Training_loss�EUB��&$       B+�M	��YX���A�*

Training_loss�6AB�v<$       B+�M	���X���A�*

Training_loss�ABl9wZ$       B+�M	L�Y���A�*

Training_loss�MB��f$       B+�M	ƊmY���A�*

Training_loss61:B��<$       B+�M	�Y���A�*

Training_lossdێB-�vk$       B+�M	q�&Z���A�*

Training_loss��{B���$       B+�M	�҂Z���A�*

Training_loss�C8B,ga$       B+�M	I��Z���A�*

Training_loss~�RB��$       B+�M	,.:[���A�*

Training_lossb�dBg��$       B+�M	�K�[���A�*

Training_loss��yB`Q�F$       B+�M	�w�[���A�*

Training_lossr�B��$       B+�M	a�N\���A�*

Training_loss���B)��s$       B+�M	�ڪ\���A�*

Training_loss!1B��~�$       B+�M	7�]���A�*

Training_loss�P*B���@$       B+�M	1{b]���A�*

Training_losswVB��҂$       B+�M	�A�]���A�*

Training_loss|�UB���:$       B+�M	ګ!^���A�*

Training_lossE)�B�^��$       B+�M	9�|^���A�*

Training_loss�xB�el�$       B+�M	���^���A�*

Training_loss�!Bʵ��$       B+�M	�6_���A�*

Training_loss��eB6��$       B+�M	�}�_���A�*

Training_loss"B�M�D$       B+�M	���_���A�*

Training_loss�VKB��~$       B+�M	��J`���A�*

Training_loss�"LBӮ��$       B+�M	左`���A�*

Training_loss��BteZ$       B+�M	��a���A�*

Training_loss�NBğ�R$       B+�M	�A^a���A�*

Training_loss��VBC	x�$       B+�M	�úa���A�*

Training_loss�][B*(�b$       B+�M	�Vb���A�*

Training_loss+xB����$       B+�M	��sb���A�*

Training_loss��BMl��$       B+�M	���b���A�*

Training_loss��cB�H��$       B+�M	�,c���A�*

Training_loss��BB.ܼN$       B+�M	��c���A�*

Training_loss�E�B�n$       B+�M	�8�c���A�*

Training_loss�eoBi�)�$       B+�M	��Ad���A�*

Training_losssD?B�:��$       B+�M	#��d���A�*

Training_loss�ۏB�Yz�$       B+�M	���d���A�*

Training_lossP�|Bݯ9�$       B+�M	��Te���A�*

Training_lossՈeB�E�$       B+�M	:y�e���A�*

Training_loss�܈B��pr$       B+�M	�5f���A�*

Training_loss$JB1���$       B+�M	��hf���A�*

Training_loss	Y�B}�k$       B+�M	�u�f���A�*

Training_loss�}B��.�$       B+�M	<3 g���A�*

Training_loss�wB���$       B+�M	��{g���A�*

Training_loss 3BW�N�$       B+�M	��g���A�*

Training_loss��B*��$       B+�M	2<4h���A�*

Training_loss�(B���I$       B+�M	�w�h���A�*

Training_loss�^IBo_	�*       ����	{�Si���A�*

Validation_accuracy��O?,�Mk&       sO� 	��Si���A�*

Validation_loss�sGB��f$       B+�M	Q�+k���A�*

Training_loss �DB%6$       B+�M	�y�k���A�*

Training_lossU{�B�LY�$       B+�M	��k���A�*

Training_lossB݃BtҜX$       B+�M	�4Al���A�*

Training_lossz3Bˈ��$       B+�M	�
�l���A�*

Training_loss.qNB1��$       B+�M	З�l���A�*

Training_lossm�B���$       B+�M	��Um���A�*

Training_loss��B��[�$       B+�M	��m���A�*

Training_loss��FB���k$       B+�M	�\n���A�*

Training_lossi8B��Q�$       B+�M	4�jn���A�*

Training_loss��dB�A�$       B+�M	]��n���A�*

Training_loss�tnB$�< $       B+�M	H�"o���A�*

Training_lossc��B]���$       B+�M	�Ro���A�*

Training_lossTCdBg3�m$       B+�M	���o���A�*

Training_lossIxBC�.�$       B+�M	�7p���A�*

Training_loss�<�B���$       B+�M	�ӓp���A�*

Training_lossn �Bp���$       B+�M	~��p���A�*

Training_loss��@B;��$       B+�M	��Kq���A�*

Training_loss�FxB�^$       B+�M	�!�q���A�*

Training_lossd�=B�+E$       B+�M	t(r���A�*

Training_loss�W�B���$       B+�M	9ar���A�*

Training_loss�gWB�Qh�$       B+�M	��r���A�*

Training_loss�22B�$       B+�M	>?s���A�*

Training_loss�\B��S$       B+�M	�9us���A�*

Training_loss]�:B��5$       B+�M	j�s���A�*

Training_loss��CB{��=$       B+�M	�1.t���A�*

Training_lossv�B͞��$       B+�M	���t���A�*

Training_lossRGB.!��$       B+�M	S�t���A�*

Training_loss��>BP�Lb$       B+�M	M�Cu���A�*

Training_loss�J6B��$       B+�M	���u���A�*

Training_lossF3MB�1$       B+�M	4��u���A�*

Training_loss��8BbS��$       B+�M	�Xv���A�*

Training_loss��B'�f�$       B+�M	탴v���A�*

Training_loss��B���$       B+�M	��w���A�*

Training_loss�;uBF�:$       B+�M	�$lw���A�*

Training_loss�iWB�=��$       B+�M	�G�w���A�*

Training_loss�F3Bcx�$       B+�M	"n$x���A�*

Training_loss�NB/��y$       B+�M	+1�x���A�*

Training_loss�8(BW�z�$       B+�M	��x���A�*

Training_lossI�qB�Å�$       B+�M	-9y���A�*

Training_losst)oB�X�$       B+�M	�֔y���A�*

Training_lossg QB�R�$       B+�M	��y���A�*

Training_loss�0B�9$       B+�M	L�Mz���A�*

Training_loss'd]BTEgB$       B+�M	t	�z���A�*

Training_lossHCBݘ��$       B+�M	k�{���A�*

Training_loss�5B�N8�$       B+�M	��c{���A�*

Training_loss[�B����$       B+�M	L��{���A�*

Training_loss�b�B,��$       B+�M	n�|���A�*

Training_loss�+�A��k�$       B+�M	�z|���A�*

Training_loss�
xBq�J�$       B+�M	�[�|���A�*

Training_loss�ojB8���*       ����	.�}���A�*

Validation_accuracy!!P?o��&       sO� 	��}���A�*

Validation_loss�_HB}^z�$       B+�M	�h~���A�*

Training_loss=�dBo}��$       B+�M	�x����A�*

Training_loss�fB��$       B+�M	e8����A�*

Training_loss&P3B�*9�$       B+�M	������A�*

Training_loss�؃BL~($       B+�M	�Q�����A�*

Training_loss�<�B���5$       B+�M	�aL����A�*

Training_loss�̕B���$       B+�M	�Ԩ����A�*

Training_loss��dB�X�@$       B+�M	�x����A�*

Training_lossM=BJ�?y$       B+�M	k`����A�*

Training_lossJgB�'��$       B+�M	ő�����A�*

Training_loss�<�B0���$       B+�M	�����A�*

Training_lossH:TBDR&$       B+�M	lu����A�*

Training_loss�#|BSx��$       B+�M	4Jу���A�*

Training_loss�jBLE��$       B+�M	�(-����A�*

Training_loss>�(B�N�$       B+�M	�҈����A�*

Training_lossV�&B|B�5$       B+�M	2䄃��A�*

Training_loss� 9B�V�$       B+�M	�'@����A�*

Training_lossR$>B!�Պ$       B+�M	�������A�*

Training_loss��*B�EҐ$       B+�M	�������A�*

Training_lossgBpbQ�$       B+�M	[T����A�*

Training_loss*ׂBo��$       B+�M	�C�����A�*

Training_lossrW�B݊yb$       B+�M	�����A�*

Training_loss��jB.TB$       B+�M	��g����A�*

Training_loss�kBF.�$       B+�M	K�Ç���A�*

Training_loss$TSB�W�H$       B+�M	������A�*

Training_loss��B(�N�$       B+�M	q|����A�*

Training_loss�j8Bw�B�$       B+�M	�9؈���A�*

Training_loss��fB����$       B+�M	�5����A�*

Training_loss�VcBۑ/$       B+�M	����A�*

Training_loss}ǂBB}o.$       B+�M	6u��A�*

Training_loss���AF��;$       B+�M	�$J����A�*

Training_loss��}BR���$       B+�M	�ͥ����A�*

Training_loss6MsB�ܦ<$       B+�M	j����A�*

Training_loss�OB�4��$       B+�M	�Y]����A�*

Training_loss -PB�+Ef$       B+�M	&������A�*

Training_loss2�qB�E�($       B+�M	�{����A�*

Training_loss/u4B�qf$       B+�M	��p����A�*

Training_loss��B%<�$       B+�M	�Ǧ���A�*

Training_loss�aB��R$       B+�M	h�'����A�*

Training_loss	N:B����$       B+�M	�샍���A�*

Training_loss�aB���$       B+�M	�xߍ���A�*

Training_loss30BB
�$       B+�M	N�;����A�*

Training_loss���Bl�j�$       B+�M	�N�����A�*

Training_loss�XqB�ϙ7$       B+�M	�����A�*

Training_loss��2B�\�$       B+�M	�O����A�*

Training_loss�+ABV�6G$       B+�M	�=�����A�*

Training_lossΪeB^0��$       B+�M	������A�*

Training_loss�:�B5,Kb$       B+�M	��c����A�*

Training_loss-�AB3Ë�$       B+�M	b������A�*

Training_loss�WBB}KC%$       B+�M	������A�*

Training_lossU�B�˩]*       ����	��ߑ���A�*

Validation_accuracyLLQ?;GF�&       sO� 	7�ߑ���A�*

Validation_loss�uLBή�&$       B+�M	��̓���A�*

Training_loss�OBÕ��$       B+�M	�"(����A�*

Training_lossDUB�e��$       B+�M	z������A�*

Training_loss�\Bl�v$       B+�M	������A�*

Training_loss]Bi˓$       B+�M	�=����A�*

Training_loss@nB܊�$       B+�M	�J�����A�*

Training_lossk�GB<@O$       B+�M	������A�*

Training_loss�VBcV+$       B+�M	�CR����A�*

Training_loss��qBa7�$       B+�M	5������A�*

Training_loss�T B�'�$       B+�M	HR����A�*

Training_loss6�\B��ʠ$       B+�M	8Jg����A�*

Training_loss\�B�"�e$       B+�M	5b×���A�*

Training_loss��GB)0��$       B+�M	P����A�*

Training_loss��7BU!
�$       B+�M	�|����A�*

Training_lossn�#BCP&�$       B+�M	��ט���A�*

Training_loss;�_B.�Ǝ$       B+�M	ѯ4����A�*

Training_loss�M�B^�.$       B+�M	�j�����A�*

Training_loss<�mB�en$       B+�M	�왃��A�*

Training_loss��BiË�$       B+�M	4�H����A�*

Training_loss�#B9,V�$       B+�M	y褚���A�*

Training_loss�,SB�p��$       B+�M	�� ����A�*

Training_loss��B��"$       B+�M	K�]����A�*

Training_loss1�iB�}�y$       B+�M	߈�����A�*

Training_loss�bB�ncH$       B+�M		O����A�*

Training_loss��_BU�p�$       B+�M	29r����A�*

Training_loss.�\B#A9�$       B+�M	��͜���A�*

Training_loss=&B��$       B+�M	�X*����A�*

Training_loss<.DB3�$       B+�M	G�����A�*

Training_loss6mBy���$       B+�M	�;❃��A�*

Training_loss���BLF�$       B+�M	M�>����A�*

Training_loss�TiBT:�Z$       B+�M	�i�����A�*

Training_loss8Z:B���$       B+�M	�������A�*

Training_loss��A���b$       B+�M	�\R����A�*

Training_lossy�3BHt��$       B+�M	������A�*

Training_loss@pRB��5�$       B+�M	��
����A�*

Training_loss���B�R�$       B+�M	E+g����A�*

Training_loss�X*B
�SJ$       B+�M	.�à���A�*

Training_loss^O�B /b$       B+�M	������A�*

Training_loss�9B4�J�$       B+�M	��{����A�*

Training_loss��/B�Y&)$       B+�M	��ס���A�*

Training_loss�WB��С$       B+�M	ڭ3����A�*

Training_loss&oEB�eC�$       B+�M	������A�*

Training_loss?�B�'��$       B+�M	9�뢃��A�*

Training_loss7mPB0/W�$       B+�M	�G����A�*

Training_loss�B)i�X$       B+�M	Kr�����A�*

Training_lossƦ+B�L�$       B+�M	7������A�*

Training_loss���B�c$       B+�M	��[����A�*

Training_lossd*B����$       B+�M	�������A�*

Training_loss��TB�j57$       B+�M	�o����A�*

Training_loss�.aB�b$       B+�M	�n����A�*

Training_lossB�VBtT�*       ����	>B4����A�*

Validation_accuracy!!P?��U�&       sO� 	�D4����A�*

Validation_loss��FB����$       B+�M	1����A�*

Training_lossb
:BL�Z�$       B+�M	I�v����A�*

Training_loss~��B-4�$       B+�M	��ը���A�*

Training_loss"3XB�!��$       B+�M	kEB����A�*

Training_loss(iB�Gf$       B+�M	�୩���A�*

Training_loss~>B9z�=$       B+�M	C
����A�*

Training_lossR�B.MO$       B+�M	Ւf����A�*

Training_lossd�=B׫�+$       B+�M	qê���A�*

Training_loss��B8��b$       B+�M	d�����A�*

Training_lossZ�$B�<�$       B+�M	-Az����A�*

Training_lossZ�mB�x�$       B+�M	�٫���A�*

Training_loss"QcBg:)$       B+�M	Y�6����A�*

Training_loss��qBSv��$       B+�M	�k�����A�*

Training_lossS�FB���m$       B+�M	Ǟ��A�*

Training_loss�}sBR��:$       B+�M	K�J����A�*

Training_loss/�YB��$       B+�M	�᦭���A�*

Training_loss2oB��Ec$       B+�M	�����A�*

Training_loss��kB��Ô$       B+�M		�^����A�*

Training_lossH$:B|��T$       B+�M	�5�����A�*

Training_loss�6B�h�$       B+�M	�����A�*

Training_loss!/]B�%�^$       B+�M	��r����A�*

Training_loss,iBe�,&$       B+�M	8ϯ���A�*

Training_losshCDBF4$       B+�M	�0+����A�*

Training_loss�ՐB�l�$       B+�M	'i�����A�*

Training_loss�:'B���2$       B+�M	_b㰃��A�*

Training_loss��YB̆�I$       B+�M	�}?����A�*

Training_loss��YB��;�$       B+�M	�ƚ����A�*

Training_lossg}WB�r
$       B+�M	�#�����A�*

Training_loss���A��B$       B+�M	yR����A�*

Training_loss�)BK9h2$       B+�M	!t�����A�*

Training_loss��dB6��q$       B+�M	�~	����A�*

Training_loss�T`B%��$       B+�M	�e����A�*

Training_lossL�LB휋�$       B+�M	M�����A�*

Training_loss�}IBd�7$       B+�M	N�����A�*

Training_loss��B��*�$       B+�M	'�x����A�*

Training_loss�yBY��B$       B+�M	�Դ���A�*

Training_loss�VDB��$       B+�M	/�0����A�*

Training_loss��CB��N�$       B+�M	$�����A�*

Training_loss�BmSk�$       B+�M	b鵃��A�*

Training_loss`�|B�z��$       B+�M	�E����A�*

Training_lossZ�iBu�b�$       B+�M	� �����A�*

Training_loss�`B)H��$       B+�M	������A�*

Training_loss6�:BB3-�$       B+�M	�.Y����A�*

Training_lossz�EB]8�R$       B+�M	������A�*

Training_loss�3[B:ȗ
$       B+�M	������A�*

Training_loss�.B��"$       B+�M	��l����A�*

Training_loss�AB�$       B+�M	/�ɸ���A�*

Training_loss;!BF��$       B+�M	�%����A�*

Training_loss �HB<�.�$       B+�M	D�����A�*

Training_loss��VB��$       B+�M	��޹���A�*

Training_loss��sB�O��*       ����	?�����A�*

Validation_accuracyKKO?
N�&       sO� 	������A�*

Validation_lossW�CB*@$       B+�M	�d�����A�*

Training_loss��9B�T��$       B+�M	8h缃��A�*

Training_loss�4;B�'rj$       B+�M	k�C����A�*

Training_lossJ�3B��T$       B+�M	� �����A�*

Training_loss��RB��$       B+�M	������A�*

Training_loss�Bh�� $       B+�M	��V����A�*

Training_lossx�?B�/�$       B+�M	������A�*

Training_lossw�BB��$       B+�M	�V����A�*

Training_loss�+XB
��$       B+�M	��j����A�*

Training_loss"�RB0��v$       B+�M	Cȿ���A�*

Training_lossjB���}$       B+�M	�b$����A�*

Training_loss3KB0��$       B+�M	<�����A�*

Training_loss;/aBKz�$       B+�M	�������A�*

Training_loss�;B�n�7$       B+�M	�7����A�*

Training_lossЮ�B�*�F$       B+�M	�������A�*

Training_loss�h]Br�\�$       B+�M	X�����A�*

Training_lossXUB�8��$       B+�M	{�J��A�*

Training_loss8aBe�mZ$       B+�M	hϧ��A�*

Training_lossb9B�qF$       B+�M	��Ã��A�*

Training_loss��8B*e:$       B+�M	��_Ã��A�*

Training_loss�1OB#�$       B+�M	�j�Ã��A�*

Training_loss�;'B�FBB$       B+�M		Ră��A�*

Training_lossD|}B���$       B+�M	ͭsă��A�*

Training_lossbB>;�$       B+�M	6�ă��A�*

Training_lossԑfB�33$       B+�M	�%-Ń��A�*

Training_loss#R�B`AU$       B+�M	���Ń��A�*

Training_lossj�SB��+$       B+�M	���Ń��A�*

Training_lossl�`Bk�N$       B+�M	�qCƃ��A�*

Training_loss�80Bu�A$       B+�M	~��ƃ��A�*

Training_loss�B�� �$       B+�M	TS�ƃ��A�*

Training_lossdߊB�)X�$       B+�M	t(Wǃ��A�*

Training_lossŽ}B��5$       B+�M	��ǃ��A�*

Training_loss��DBa?ō$       B+�M	9ȃ��A�*

Training_lossG�AB�<��$       B+�M	:?jȃ��A�*

Training_lossR�xB�;$       B+�M	'k�ȃ��A�*

Training_loss�y|B{z�$       B+�M	?�!Ƀ��A�*

Training_loss��%B|�$       B+�M	�o}Ƀ��A�*

Training_lossl�dB�S7$       B+�M	�d�Ƀ��A�*

Training_loss|3BDC�$       B+�M	35ʃ��A�*

Training_loss�qB�_*$       B+�M	'ʃ��A�*

Training_loss��2BWƝ$       B+�M	~q�ʃ��A�*

Training_loss��UB��C�$       B+�M	��H˃��A�*

Training_lossX��Beז�$       B+�M	��˃��A�*

Training_loss�SgBx�oS$       B+�M	�r ̃��A�*

Training_loss��B��u�$       B+�M	�(\̃��A�*

Training_loss(�wB��$       B+�M	!��̃��A�*

Training_lossYBl1��$       B+�M	P4̓��A�*

Training_lossl�Bf���$       B+�M	@�q̓��A�*

Training_lossCbTB^�� $       B+�M	x��̓��A�*

Training_loss�B�Q�$       B+�M	7�*΃��A�*

Training_loss�gnB<��O*       ����	��΃��A�*

Validation_accuracyKKP?8H�n&       sO� 	��΃��A�*

Validation_lossA�DB]�$       B+�M	x�Ѓ��A�*

Training_loss:*�BA�M$       B+�M	M�Gу��A�*

Training_lossE�B�P�$       B+�M	~Q�у��A�*

Training_loss�4>B~ n�$       B+�M	�` ҃��A�*

Training_loss��@Bi��$       B+�M	�t\҃��A�*

Training_lossܷZB����$       B+�M	8��҃��A�*

Training_lossӁEB/���$       B+�M	RaӃ��A�*

Training_loss�(B���$       B+�M	TpӃ��A�*

Training_loss�B�Zr�$       B+�M	U��Ӄ��A�*

Training_loss�|Bep��$       B+�M	��(ԃ��A�*

Training_loss�AB�H��$       B+�M	2Ǆԃ��A�*

Training_loss�� B�J�$       B+�M	og�ԃ��A�*

Training_loss:�Bߤ$       B+�M	��;Ճ��A�*

Training_lossE�LBD�O�$       B+�M	���Ճ��A�*

Training_loss"MTB7b$       B+�M	
�Ճ��A�*

Training_loss�(�B�C��$       B+�M	h"Oփ��A�*

Training_loss�~;BU|0$       B+�M	��փ��A�*

Training_loss��CB�_�$       B+�M	�׃��A�*

Training_loss�	6B�$       B+�M	-�c׃��A�*

Training_loss���A�$j$       B+�M	���׃��A�*

Training_loss\�FB��%�$       B+�M	�i؃��A�*

Training_lossjY0Bo�$       B+�M	�Rz؃��A�*

Training_lossVB(��$       B+�M	n�؃��A�*

Training_loss�\QBˢ�W$       B+�M	=�2ك��A�*

Training_loss�F\B׌�$       B+�M	��ك��A�*

Training_lossk�hBI|�)$       B+�M	���ك��A�*

Training_loss�lB}���$       B+�M	}�Eڃ��A�*

Training_loss�d�B���$       B+�M	k)�ڃ��A�*

Training_loss`B�.^�$       B+�M	�W�ڃ��A�*

Training_loss�UBNY��$       B+�M	uXYۃ��A�*

Training_loss�.B��a$       B+�M	31�ۃ��A�*

Training_loss&�B.���$       B+�M	��܃��A�*

Training_loss�xwB�:w$       B+�M	�m܃��A�*

Training_loss�h1B����$       B+�M	� �܃��A�*

Training_loss��B�c�$       B+�M	B�&݃��A�*

Training_loss~=B�1�$       B+�M	N*�݃��A�*

Training_loss�EBqΪ$       B+�M	�$�݃��A�*

Training_loss��TBE1S�$       B+�M	��<ރ��A�*

Training_loss<0,BޛX�$       B+�M	���ރ��A�*

Training_loss�)B���$       B+�M	�`�ރ��A�*

Training_loss8�OB^34�$       B+�M	�Q߃��A�*

Training_loss*�	B��N�$       B+�M		��߃��A�*

Training_loss�*B'��}$       B+�M	�	����A�*

Training_loss��$B�m��$       B+�M	(Ge����A�*

Training_loss��B�@$$       B+�M	�������A�*

Training_loss0��B�7��$       B+�M	�x���A�*

Training_lossh�$B�$       B+�M	<jx���A�*

Training_loss�'*B�L($       B+�M	b�����A�*

Training_loss�WvBfc/�$       B+�M	��/���A�*

Training_lossf['B�/�$       B+�M	�����A�*

Training_lossFOB��8*       ����	]3Q���A�*

Validation_accuracy��P?��l&       sO� 	L6Q���A�*

Validation_loss�DB���P$       B+�M	��G���A�*

Training_lossྵA t_�$       B+�M	�r����A�*

Training_loss�#!B�8s�$       B+�M	�x����A�*

Training_lossT�1B���[$       B+�M	J�\���A�*

Training_loss,�BB�tj$       B+�M	�����A�*

Training_losshW4B-��$       B+�M	Y����A�*

Training_loss�;&B��Q$       B+�M	дq���A�*

Training_loss�oB���$       B+�M	�z����A�*

Training_lossP�0B'CCk$       B+�M	g�)���A�*

Training_lossj-B�v�$       B+�M	fJ����A�*

Training_loss�pB��+$       B+�M	������A�*

Training_loss=&UB�ksH$       B+�M	I?���A�*

Training_loss�RB�} �$       B+�M	�I����A�*

Training_lossPB��M�$       B+�M	�y����A�*

Training_lossnj_B 0`$       B+�M	9*R���A�*

Training_loss�|B�_'�$       B+�M	x*����A�*

Training_loss�o�A
�6n$       B+�M	�v���A�*

Training_loss�NB� 03$       B+�M	��g���A�*

Training_lossL�_ByI��$       B+�M	P����A�*

Training_loss�X#Bo�S$       B+�M	a� ���A�*

Training_loss^�<B�v�$       B+�M	�B}���A�*

Training_loss�ylB�V�a$       B+�M	�����A�*

Training_loss��FB��F�$       B+�M	g�4���A�*

Training_loss�?B�"�7$       B+�M	�x����A�*

Training_lossh�>BJ���$       B+�M	$����A�*

Training_loss)hB>�$       B+�M	?�G���A�*

Training_lossp� B�P��$       B+�M	������A�*

Training_loss/ B<y�$       B+�M	�t����A�*

Training_loss�$B���G$       B+�M	5�[���A�*

Training_loss�6B�D�T$       B+�M	Qh����A�*

Training_loss�j.B̛�t$       B+�M	������A�*

Training_loss(�vB/0�<$       B+�M	B�n����A�*

Training_loss�w`B0r�$       B+�M	v������A�*

Training_loss�>
Bs?Z$       B+�M	�n'���A�*

Training_loss��!B(��$       B+�M	�E����A�*

Training_loss"��A�D�G$       B+�M	�����A�*

Training_loss��PB�i��$       B+�M	b;���A�*

Training_loss�D7BNNq$       B+�M	������A�*

Training_loss�u!B���$       B+�M	������A�*

Training_loss�}@B$z�$       B+�M	ėO���A�*

Training_loss�6RB͆�!$       B+�M	L����A�*

Training_loss�� B�Ѓ$       B+�M	̶���A�*

Training_lossȞ/B��0
$       B+�M	z8k���A�*

Training_loss5)2B#̻$       B+�M	������A�*

Training_loss�7B�qN$       B+�M	
�#����A�*

Training_loss�?XB�W�$       B+�M	�8�����A�*

Training_lossjBMB�IM�$       B+�M	�D�����A�*

Training_lossf2Bx���$       B+�M	��9����A�*

Training_loss
yB1XH�$       B+�M	�)�����A�*

Training_lossq'/B�f�>$       B+�M	O�����A�*

Training_loss��B�z*       ����	�P�����A�*

Validation_accuracywvP?��m&       sO� 	�R�����A�*

Validation_lossa�>B#W~!$       B+�M	4������A�*

Training_loss��_B���$       B+�M	�s%����A�*

Training_loss!�YB{��$       B+�M	Zd�����A�*

Training_lossH�`B*�k$       B+�M	������A�*

Training_loss��B)�g�$       B+�M	��8����A�*

Training_loss��Ap��$       B+�M	������A�*

Training_lossM�B�*zF$       B+�M	F\�����A�*

Training_loss�%?BDU�$       B+�M	��M����A�*

Training_lossȧ"B���r$       B+�M	U1�����A�*

Training_loss�^HB`oD�$       B+�M	5�����A�*

Training_loss��[B�F`6$       B+�M	�pb����A�*

Training_loss�pDB/�$       B+�M	2 �����A�*

Training_loss��TB�R\�$       B+�M	>�����A�*

Training_loss��B���$       B+�M	B
v����A�*

Training_loss�/B�<m�$       B+�M	k������A�*

Training_loss�UB3em$       B+�M	A�.����A�*

Training_loss&~MB╝�$       B+�M	(������A�*

Training_lossv�<Bu~rC$       B+�M	�������A�*

Training_lossV�*Bm�E$       B+�M	�C ���A�*

Training_loss@��A�E$       B+�M	� ���A�*

Training_loss�9ZBU�OS$       B+�M	�� ���A�*

Training_loss�%B��vX$       B+�M	�X���A�*

Training_loss��Br���$       B+�M	�����A�*

Training_loss�oB���c$       B+�M	Ӡ���A�*

Training_loss��,B���J$       B+�M	��m���A�*

Training_lossܵHBjkT$       B+�M	;����A�*

Training_loss�8BW�8$       B+�M	3R&���A�*

Training_lossP`BV�f$       B+�M	c����A�*

Training_losst"B����$       B+�M	�+����A�*

Training_loss:OB�#;�$       B+�M	:�9���A�*

Training_loss�/2B�h$       B+�M	������A�*

Training_loss�1NB�-��$       B+�M	J{����A�*

Training_loss¾B��LZ$       B+�M	\qM���A�*

Training_loss;HB���}$       B+�M	]����A�*

Training_loss�Bb��;$       B+�M	����A�*

Training_losszC(B�y��$       B+�M	>wa���A�*

Training_losslOBd��$       B+�M	2�����A�*

Training_lossx>-BJƞ$       B+�M	����A�*

Training_loss��%B�8Q�$       B+�M	�hu���A�*

Training_loss<NBN4�9$       B+�M	p&����A�*

Training_loss�&CB e$       B+�M	g-���A�*

Training_loss:L0BU��k$       B+�M	�����A�*

Training_lossnNB�P6$       B+�M	�����A�*

Training_loss��IB���$       B+�M	U�A	���A�*

Training_loss�FB`�d�$       B+�M	��	���A�*

Training_loss2��A$c'$       B+�M	���	���A�*

Training_loss(;B'?F$       B+�M	
IV
���A�*

Training_lossDVVB�U�$       B+�M	t�
���A�*

Training_lossj}SB��w$       B+�M	I����A�*

Training_loss�h%B��4$       B+�M	�7j���A�*

Training_loss�*SB� _�*       ����	�.���A�*

Validation_accuracy��P?��r&       sO� 	r�.���A�*

Validation_loss%jDB��W$       B+�M	�4���A�*

Training_loss�$1B�wo^$       B+�M	U����A�*

Training_loss�WEB�s�$       B+�M	�����A�*

Training_loss
�JBf��F$       B+�M	�I���A�*

Training_loss��iB��ln$       B+�M	|����A�*

Training_loss6�B�E$       B+�M	s���A�*

Training_loss�H�B�"_d$       B+�M	_���A�*

Training_loss7,By�S�$       B+�M	e�����A�*

Training_loss2AB���$       B+�M	�����A�*

Training_loss8�jB���$       B+�M	�r���A�*

Training_loss�j=B:���$       B+�M	������A�*

Training_loss�-B=��V$       B+�M	.�*���A�*

Training_loss.jB,�$       B+�M	�����A�*

Training_loss�VBi�ر$       B+�M	� ����A�*

Training_loss��GB�嬔$       B+�M	��?���A�*

Training_loss�Bљ��$       B+�M	������A�*

Training_loss��-B�@h0$       B+�M	JC����A�*

Training_loss��B�M��$       B+�M	��V���A�*

Training_loss�3Bk�bm$       B+�M	������A�*

Training_losss�WB���8$       B+�M	M����A�*

Training_losst\@B�@W$       B+�M	��k���A�*

Training_loss*LB�J��$       B+�M	�����A�*

Training_losse�^B���$       B+�M	˜#���A�*

Training_lossX�B7T4�$       B+�M	�����A�*

Training_loss�'ABq�$       B+�M	�'����A�*

Training_loss��JB��W&$       B+�M	E�8���A�*

Training_lossz{B*�0\$       B+�M	ǂ����A�*

Training_loss�y�AO�t"$       B+�M	����A�*

Training_losst+1B���$       B+�M	��L���A�*

Training_loss*�BO��.$       B+�M	�(����A�*

Training_loss�AB0k�u$       B+�M	;���A�*

Training_loss.IBQ��$       B+�M	O�a���A�*

Training_lossTOB��%�$       B+�M	~�����A�*

Training_loss��YBtn$!$       B+�M	z���A�*

Training_loss��6B�u�-$       B+�M	R�u���A�*

Training_loss�GjBF'��$       B+�M	������A�*

Training_lossn�BK�@v$       B+�M	[�-���A�*

Training_loss�9B����$       B+�M	G����A�*

Training_lossw�B�,�$       B+�M	����A�*

Training_loss��7B'UT$       B+�M	t�A���A�*

Training_loss0v�A&<g@$       B+�M	VG����A�*

Training_lossU�$B2��$       B+�M	������A�*

Training_loss� BwZ8$       B+�M	�U���A�*

Training_lossnBY�'�$       B+�M	tE����A�*

Training_loss"�B�Cq�$       B+�M	�V���A�*

Training_loss��%Bmj� $       B+�M	shj���A�*

Training_loss��A�7��$       B+�M	� ����A�*

Training_loss��OB��˹$       B+�M	 �#���A�*

Training_loss���B(s�$       B+�M	�P����A�*

Training_lossTiB�eݍ$       B+�M	v����A�*

Training_loss"��A��]�*       ����	�Š ���A�*

Validation_accuracywvP?~-�o&       sO� 	�Ǡ ���A�*

Validation_losseCB��$       B+�M	���"���A�*

Training_loss,�mB@I-�$       B+�M	��#���A�*

Training_loss�1Bâ��$       B+�M	_t#���A�*

Training_loss��	B1��p$       B+�M	܂�#���A�*

Training_loss�4�B]�;�$       B+�M	�J,$���A�*

Training_loss��B��L$       B+�M	���$���A�*

Training_lossr�2B��gU$       B+�M	���$���A�*

Training_lossp�#B�[�g$       B+�M	�?%���A�*

Training_loss�!By�$       B+�M	i��%���A�*

Training_lossw�BP�r�$       B+�M	��%���A�*

Training_loss8�FB�R��$       B+�M	��S&���A�*

Training_loss��/B ��$       B+�M	��&���A�*

Training_loss��~B�n��$       B+�M	[�
'���A�*

Training_loss��SB�6�$       B+�M	��f'���A�*

Training_loss���A�U$       B+�M	5��'���A�*

Training_loss�VMB#�u-$       B+�M	�(���A�*

Training_loss�I8B�$       B+�M	({(���A�*

Training_loss&�B`��2$       B+�M	!\�(���A�*

Training_lossL�(B&�#e$       B+�M	�{3)���A�*

Training_loss{�B��$       B+�M	
�)���A�*

Training_loss��cB��� $       B+�M	���)���A�*

Training_loss��PB�Ft�$       B+�M	kF*���A�*

Training_loss�B&}�$       B+�M	+l�*���A�*

Training_loss�39B�N0L$       B+�M	�=�*���A�*

Training_losszEB��@?$       B+�M	��[+���A�*

Training_loss��^B�6��$       B+�M	Re�+���A�*

Training_lossl&B!�i�$       B+�M	q,���A�*

Training_lossn�,B�3އ$       B+�M	}#p,���A�*

Training_loss\8aB]jL�$       B+�M	���,���A�*

Training_loss��$B�(�$       B+�M	��(-���A�*

Training_loss�Bi|�<$       B+�M	T��-���A�*

Training_loss:[1B�U|�$       B+�M	���-���A�*

Training_lossup-B~�m�$       B+�M	9�=.���A�*

Training_lossO*lB����$       B+�M	��.���A�*

Training_loss���A]0r$       B+�M	.��.���A�*

Training_loss��TB�%��$       B+�M	�CQ/���A�*

Training_loss�e7Bs:K�$       B+�M	���/���A�*

Training_loss�,8B�>�$       B+�M	q�0���A�*

Training_loss�^B�f�$       B+�M	�4e0���A�*

Training_loss��B��2�$       B+�M	{��0���A�*

Training_lossRbB`��z$       B+�M	�1���A�*

Training_loss\LB>m �$       B+�M	��w1���A�*

Training_loss��@BA1$       B+�M	���1���A�*

Training_loss�+B3��$       B+�M	`12���A�*

Training_lossL\KB.�A�$       B+�M	o��2���A�*

Training_loss��GBhUR�$       B+�M	���2���A�*

Training_loss"�iBE��$       B+�M	:F3���A�*

Training_loss��;BIҏ$       B+�M	z�3���A�*

Training_lossq7B޺Ț$       B+�M	qv�3���A�*

Training_loss~�RB+���$       B+�M	%�Z4���A�*

Training_loss/�,B�xQ*       ����	q�5���A�*

Validation_accuracy��P?�˭�&       sO� 	�5���A�*

Validation_loss?�@B���$       B+�M	� /7���A�*

Training_loss2bB��&�$       B+�M	���7���A�*

Training_loss�yBF;'$       B+�M	��7���A�*

Training_loss�&B�U�$       B+�M	�B8���A�*

Training_lossQW�B�$       B+�M	k�8���A�*

Training_loss�g"B���$       B+�M	d�8���A�*

Training_loss�|B�ظ�$       B+�M	�T9���A�*

Training_loss�k?BVsa$       B+�M	�F�9���A�*

Training_loss4�CB���$       B+�M	<g:���A�*

Training_loss��B�q\�$       B+�M	��h:���A�*

Training_losss0B���$       B+�M	X��:���A�*

Training_loss~�+B��5$       B+�M	�!;���A�*

Training_loss��Bh[�\$       B+�M	[};���A�*

Training_lossJB��8g$       B+�M	`��;���A�*

Training_loss�bRBJݽ$       B+�M	��4<���A�*

Training_lossY,B�qG$       B+�M	�<���A�*

Training_loss0pNB��Z$       B+�M	���<���A�*

Training_loss�%B�(�-$       B+�M	�I=���A�*

Training_lossD�BzT�$       B+�M	�8�=���A�*

Training_loss\�B)\u$       B+�M	Φ>���A�*

Training_loss�}B�#�$       B+�M	��^>���A�*

Training_loss�xB�C�$       B+�M	�޺>���A�*

Training_loss$B�=�$       B+�M	t�$?���A�*

Training_loss��MBȏ^�$       B+�M	��?���A�*

Training_loss|�B����$       B+�M	Q/�?���A�*

Training_loss�e,Bد��$       B+�M	!"J@���A�*

Training_loss��$B��.e$       B+�M	�F�@���A�*

Training_loss��mBq�z$       B+�M	eoA���A�*

Training_loss4=B�r0h$       B+�M	a`A���A�*

Training_loss��2B"�$       B+�M	�i�A���A�*

Training_loss
q�AƂM�$       B+�M	n2B���A�*

Training_loss5�A���_$       B+�M	�MuB���A�*

Training_loss��BJb.|$       B+�M	�d�B���A�*

Training_loss��KB$��z$       B+�M	EJ-C���A�*

Training_loss�~hB�ݶ�$       B+�M	Cr�C���A�*

Training_lossU0DB�3�$       B+�M	�P�C���A�*

Training_lossG�RB�ڱ1$       B+�M	DAD���A�*

Training_losse�"B.��7$       B+�M	bלD���A�*

Training_loss�r(B�^�$       B+�M	X��D���A�*

Training_loss�B�ꂲ$       B+�M	��TE���A�*

Training_loss3�9B�6�$       B+�M	,�E���A�*

Training_loss�V%B~�5+$       B+�M	�-F���A�*

Training_loss�V)B��(h$       B+�M	��iF���A�*

Training_loss�KB��ak$       B+�M	��F���A�*

Training_lossy�#BBi%�$       B+�M	O"G���A�*

Training_loss�6B,�$       B+�M	�~G���A�*

Training_lossp�HB�5�$       B+�M	��G���A�*

Training_loss�[B?)��$       B+�M	�D6H���A�*

Training_loss�S<B&���$       B+�M	HݑH���A�*

Training_loss)ZBF���$       B+�M	�e�H���A�*

Training_loss|�B��7*       ����	�I���A�*

Validation_accuracy!!P?u�?&       sO� 	��I���A�*

Validation_lossm,BB����$       B+�M	��K���A�*

Training_loss�B��M�$       B+�M	�13L���A�*

Training_loss� B����$       B+�M	b�L���A�*

Training_loss�<Be�ү$       B+�M	S@�L���A�*

Training_loss�PB�pze$       B+�M	�/HM���A�*

Training_loss?;$B��K�$       B+�M	zo�M���A�*

Training_loss�K2B��$       B+�M	^c N���A�*

Training_lossx�
BC�YE$       B+�M	1\N���A�*

Training_loss���B�^b�$       B+�M	�;�N���A�*

Training_loss��FB�N҇$       B+�M	��O���A�*

Training_loss�2B��&$       B+�M	QpO���A�*

Training_loss��B%?(
$       B+�M	�O���A�*

Training_loss�@Bjm�$       B+�M	H(P���A�*

Training_lossD�@B��`I$       B+�M	�P�P���A�*

Training_loss�
B%��$       B+�M	!�P���A�*

Training_lossV?Bm�;$       B+�M	"r=Q���A�*

Training_loss��B��m�$       B+�M	��Q���A�*

Training_loss"�@B���!$       B+�M	�L�Q���A�*

Training_lossB-Byʂ<$       B+�M	~�PR���A�*

Training_loss�(B�p�}$       B+�M	�'�R���A�*

Training_loss�WBEF�Z$       B+�M	��S���A�*

Training_lossO�Bd��$       B+�M	U�dS���A�*

Training_loss���A��z�$       B+�M	���S���A�*

Training_loss�BB�
�$       B+�M	�ET���A�*

Training_loss��B���L$       B+�M	BxT���A�*

Training_loss�.@B��$       B+�M	���T���A�*

Training_loss9UB���S$       B+�M	#0U���A�*

Training_loss�>7B�5$       B+�M	�o�U���A�*

Training_loss4\5Bq,�t$       B+�M	u��U���A�*

Training_loss{�LB���$       B+�M	߈IV���A�*

Training_loss$B���$       B+�M	C�V���A�*

Training_loss,'B`�f$       B+�M	
d W���A�*

Training_losspBd�pd$       B+�M	��\W���A�*

Training_loss�PB��$       B+�M	+ܸW���A�*

Training_loss��KB���
$       B+�M	��X���A�*

Training_loss��'B��о$       B+�M	f3pX���A�*

Training_loss�EAB���$       B+�M	C �X���A�*

Training_losslT7Bn d�$       B+�M	*V(Y���A�*

Training_loss~�BBۓ�o$       B+�M	~R�Y���A�*

Training_loss��1B�o$       B+�M	���Y���A�*

Training_loss�v2B�o��$       B+�M	�<Z���A�*

Training_loss�`Bev
G$       B+�M	{��Z���A�*

Training_loss�,BA+�*$       B+�M	]��Z���A�*

Training_loss�f BE	!$       B+�M	A�R[���A�*

Training_loss�JB���$       B+�M	�[���A�*

Training_loss&�_B]��n$       B+�M	��\���A�*

Training_loss;KGB�t$       B+�M	��g\���A�*

Training_loss�[B����$       B+�M	ѱ�\���A�*

Training_loss}�B��[$       B+�M	�f]���A�*

Training_loss��)B�:��$       B+�M	�9{]���A�*

Training_loss�jB<9�|*       ����	��=^���A�*

Validation_accuracy!!O?(��N&       sO� 	K�=^���A�*

Validation_loss��=B���`$       B+�M	�p`���A�*

Training_loss.�B�:ֲ$       B+�M	���`���A�*

Training_loss85,Bt���$       B+�M	�,(a���A�*

Training_lossԢhB�'�$       B+�M	��a���A�*

Training_lossF�,B�m�>$       B+�M	��a���A�*

Training_loss��5BP�V$       B+�M	�,;b���A�*

Training_loss�.B�!!$       B+�M	��b���A�*

Training_loss�� B���$       B+�M	}�b���A�*

Training_lossQkmBB�v�$       B+�M	/�Nc���A�*

Training_lossG�!B!�˫$       B+�M	N�c���A�*

Training_loss�BC~�$       B+�M	�6d���A�*

Training_loss*dB|�3$       B+�M	l?cd���A�*

Training_loss��B��$       B+�M	�̾d���A�*

Training_loss��fB�G�$       B+�M	�ee���A�*

Training_losslFB��$       B+�M	x{ve���A�*

Training_loss��A 	��$       B+�M	��e���A�*

Training_loss YBq�r$       B+�M	��-f���A�*

Training_loss�>Be:p|$       B+�M	��f���A�*

Training_lossks"Bx��$       B+�M	Do�f���A�*

Training_lossTbB+^@P$       B+�M	E�Ag���A�*

Training_loss�i=Bg��Z$       B+�M	��g���A�*

Training_lossu�B��-f$       B+�M	L��g���A�*

Training_lossL�BZG -$       B+�M	�Uh���A�*

Training_lossP	B0!5$       B+�M	z8�h���A�*

Training_loss6B�$�$       B+�M	� i���A�*

Training_loss&�BaP?�$       B+�M	��ii���A�*

Training_loss�
B-���$       B+�M	ۅ�i���A�*

Training_lossb�AB�ª$       B+�M	�!j���A�*

Training_loss�BB��"$       B+�M	?�|j���A�*

Training_loss�NBʷ
Q$       B+�M	j�j���A�*

Training_loss4B���$       B+�M	l�3k���A�*

Training_loss�.B��n$       B+�M	�-�k���A�*

Training_lossQmB�<�$       B+�M	�l�k���A�*

Training_loss��B�F�$       B+�M	k�Gl���A�*

Training_loss�;B�m$       B+�M	��l���A�*

Training_loss�Be�p$       B+�M	�4m���A�*

Training_loss�oB�g�?$       B+�M	�^`m���A�*

Training_lossncB�,�$       B+�M	T�m���A�*

Training_loss(�`B\�,$       B+�M	q n���A�*

Training_lossc�B�d`$       B+�M	��tn���A�*

Training_loss��>B5\$       B+�M	s��n���A�*

Training_loss=�-B���G$       B+�M	.o���A�*

Training_loss*!hB�L��$       B+�M	%w�o���A�*

Training_loss�Bܼ��$       B+�M	ƾ�o���A�*

Training_lossB}	B��d<$       B+�M	�Ap���A�*

Training_loss�*B�-)$       B+�M	ޫ�p���A�*

Training_loss�bB���$       B+�M	1
�p���A�*

Training_loss��B��ŗ$       B+�M	��Uq���A�*

Training_loss¯BB8�x[$       B+�M	jL�q���A�*

Training_loss�J7B���>$       B+�M	Cr���A�*

Training_loss��"B{�E*       ����	=}�r���A�*

Validation_accuracy��P?ӂ&       sO� 	��r���A�*

Validation_loss��DB��E�$       B+�M	���t���A�*

Training_lossN;B�6-$       B+�M	c�Vu���A�*

Training_loss_B�T��$       B+�M	ᛲu���A�*

Training_loss~i�A�$       B+�M	H7v���A�*

Training_lossR\DB� v�$       B+�M	�Ijv���A�*

Training_lossǷBu�7�$       B+�M	oI�v���A�*

Training_loss�/Bs;H�$       B+�M	��!w���A�*

Training_loss��Aya�$       B+�M	�~w���A�*

Training_lossIHBQ�$       B+�M	�-�w���A�*

Training_lossx�B,� �$       B+�M	��5x���A�*

Training_lossp1_B����$       B+�M	&��x���A�*

Training_loss��BVB��$       B+�M	���x���A�*

Training_loss5OBe�<*$       B+�M	�:Jy���A�*

Training_loss�o"B��w�$       B+�M	��y���A�*

Training_lossBk#BN��$       B+�M	q8z���A�*

Training_lossN:Bg�v$       B+�M	�x_z���A�*

Training_loss�;4B��y�$       B+�M	\;�z���A�*

Training_loss��CB?��G$       B+�M	}Z{���A�*

Training_loss0�>B`�$       B+�M	4�r{���A�*

Training_loss\�KB�E�-$       B+�M	�D�{���A�*

Training_loss��AAG�s$       B+�M	Ύ*|���A�*

Training_lossjHB�כ�$       B+�M	�`�|���A�*

Training_loss�TB~���$       B+�M	���|���A�*

Training_loss��AdB	$       B+�M	�>}���A�*

Training_loss��B��$       B+�M	���}���A�*

Training_loss+�NB]�a�$       B+�M	�{�}���A�*

Training_loss�E	B��k$       B+�M	�S~���A�*

Training_loss��+B4�Y�$       B+�M	���~���A�*

Training_lossTBo��Y$       B+�M	/����A�*

Training_lossB-B�gx$       B+�M	��g���A�*

Training_loss�yB���Z$       B+�M	=�����A�*

Training_loss'4BS��z$       B+�M	v3 ����A�*

Training_lossa�	B��7$       B+�M	�|����A�*

Training_loss̧`Bo�*$       B+�M	Yi׀���A�*

Training_loss��B`��$       B+�M	�3����A�*

Training_loss�*B;�P�$       B+�M	p������A�*

Training_loss�G�AN-�$       B+�M	eo큄��A�*

Training_losshEB���$       B+�M	W�H����A�*

Training_loss�q.B��O�$       B+�M	>x�����A�*

Training_loss�ɂBݨ��$       B+�M	�����A�*

Training_lossX@&B�v�$       B+�M	;7]����A�*

Training_loss�B%B�`�$       B+�M	p������A�*

Training_loss�BD羝$       B+�M	������A�*

Training_loss�(BB��$       B+�M	Y�p����A�*

Training_loss�I&B���$       B+�M	u�̄���A�*

Training_loss_7Bn��$       B+�M	�)����A�*

Training_loss��DB~��$       B+�M	Ḅ����A�*

Training_loss�@#B^8`�$       B+�M	-&ᅄ��A�*

Training_loss<�8B��p�$       B+�M	M=����A�*

Training_loss�M|B�{Y�$       B+�M	������A�*

Training_lossr�$B3�0*       ����	*�\����A�*

Validation_accuracywvP?Ѱ�	&       sO� 	��\����A�*

Validation_lossc<B*�+e$       B+�M	{������A�*

Training_lossD�"B%�$       B+�M	m牄��A�*

Training_losshFBű�\$       B+�M	�D����A�*

Training_lossO�-B�,�$       B+�M	�������A�*

Training_loss:[=B��*8$       B+�M	�������A�*

Training_loss{�eBƚ�X$       B+�M	\<X����A�*

Training_loss�2Bi ��$       B+�M	賋���A�*

Training_lossN�"B�s�{$       B+�M	�0����A�*

Training_loss�.5B-��$       B+�M	�l����A�*

Training_loss�)TBf���$       B+�M	�]Ȍ���A�*

Training_loss�z�A�$       B+�M	��$����A�*

Training_loss�y,B��e-$       B+�M	H������A�*

Training_loss/TB��8�$       B+�M	�7ލ���A�*

Training_loss��UBՅ�i$       B+�M	��9����A�*

Training_loss�v'B0xI�$       B+�M	������A�*

Training_loss>�BD<Z$       B+�M	�����A�*

Training_loss�|9B����$       B+�M	z5O����A�*

Training_loss
�]BUw��$       B+�M	������A�*

Training_loss.�A�֫g$       B+�M	I�����A�*

Training_loss.c�A��Y$       B+�M	�:b����A�*

Training_loss�
B�R,�$       B+�M	�澐���A�*

Training_lossK.DB���$       B+�M	������A�*

Training_loss��An"��$       B+�M	�Kw����A�*

Training_loss�5B�1n�$       B+�M	�ӑ���A�*

Training_loss�B�=�$       B+�M	k�/����A�*

Training_lossUq%BnH$       B+�M	%΋����A�*

Training_loss'TB��$       B+�M	蒄��A�*

Training_loss�	B�7�&$       B+�M	��C����A�*

Training_loss$B�}`$       B+�M	ӆ�����A�*

Training_loss+9B�
��$       B+�M	������A�*

Training_lossɶ+BՉ$       B+�M	�W����A�*

Training_loss	{5B	�0 $       B+�M	�j�����A�*

Training_loss|��A27�$       B+�M	�����A�*

Training_loss��$B���$       B+�M	��k����A�*

Training_loss�e)B�Z)�$       B+�M	��Ǖ���A�*

Training_loss��B�utT$       B+�M	3R#����A�*

Training_loss�eB�G>q$       B+�M	������A�*

Training_lossz�B"���$       B+�M	N�ۖ���A�*

Training_lossԲ(Bv��$       B+�M	�49����A�*

Training_lossp�IB`�~$       B+�M	�畗���A�*

Training_loss��*B�F�$       B+�M	|���A�*

Training_loss�8Bܒ��$       B+�M	�N����A�*

Training_lossb�HBsr]$       B+�M	�ȫ����A�*

Training_loss�vB6j��$       B+�M	�����A�*

Training_loss��BӞ'�$       B+�M	S�b����A�*

Training_loss�B� �$       B+�M	A�����A�*

Training_loss��B8o�$       B+�M	 �����A�*

Training_loss�EHB0q�$       B+�M	�v����A�*

Training_loss�AB�P�V$       B+�M	NҚ���A�*

Training_loss�l�A����$       B+�M	��.����A�*

Training_loss@�B�x�p*       ����	MH���A�*

Validation_accuracy!!P?{��&       sO� 	�K���A�*

Validation_lossABݥ�p$       B+�M	��H����A�*

Training_loss�M/B��#8$       B+�M	z�����A�*

Training_loss`%0B(�T$       B+�M	�� ����A�*

Training_loss�/B+OJ$       B+�M	��\����A�*

Training_losss�A�đ?$       B+�M	�m�����A�*

Training_lossr�)B�l($       B+�M	������A�*

Training_loss�XB��0a$       B+�M	jLq����A�*

Training_lossw�B�RF$       B+�M	'0͠���A�*

Training_loss��2B�{�	$       B+�M	�(����A�*

Training_loss�=Bm��B$       B+�M	�������A�*

Training_lossn��A�I�E$       B+�M	oࡄ��A�*

Training_lossx�WB���$       B+�M	��;����A�*

Training_loss�m1B���$       B+�M	q�����A�*

Training_loss^�B���)$       B+�M	D������A�*

Training_loss�X,B�@!N$       B+�M	�P����A�*

Training_lossS�@B�S�4$       B+�M	�ج����A�*

Training_loss�BZ�_"$       B+�M	�����A�*

Training_losscQB5A[�$       B+�M	ed����A�*

Training_loss�&B�K��$       B+�M	8������A�*

Training_loss!�SB�a԰$       B+�M	kI����A�*

Training_loss�GB��Z'$       B+�M	�x����A�*

Training_loss݁%BS4G$       B+�M	�Sե���A�*

Training_loss�5CB���$       B+�M	�2����A�*

Training_loss�rB��b�$       B+�M	c������A�*

Training_loss*B$��$       B+�M	�馄��A�*

Training_losst:B7��$       B+�M	�#E����A�*

Training_lossENB�k�1$       B+�M	�N�����A�*

Training_loss��B\$�$       B+�M	%y�����A�*

Training_loss`�RB��e$       B+�M	��Y����A�*

Training_lossqB$       B+�M	�������A�*

Training_lossB���$       B+�M	T����A�*

Training_loss.B�z�$       B+�M	qqn����A�*

Training_lossRP�A�7\$       B+�M	��ʩ���A�*

Training_lossPi�A�uT�$       B+�M	v8'����A�*

Training_loss�%B�U$       B+�M	�������A�*

Training_loss�AB�s�$       B+�M	��ߪ���A�*

Training_lossK�A�h��$       B+�M	�=����A�*

Training_loss��`B�v�$       B+�M	{٘����A�*

Training_lossl#B(��$       B+�M	T������A�*

Training_lossƊ(Bu��h$       B+�M	[�Q����A�*

Training_loss?B( �X$       B+�M	�í����A�*

Training_loss��HB��${$       B+�M	��	����A�*

Training_loss�%"Bic|�$       B+�M	=*f����A�*

Training_lossX�.B��
z$       B+�M	`>­���A�*

Training_lossR�BBS���$       B+�M	[y����A�*

Training_loss�8B�m�$       B+�M	��z����A�*

Training_loss�9<B<D�o$       B+�M	k�׮���A�*

Training_loss$�Bг��$       B+�M	��3����A�*

Training_loss8�B��[$       B+�M	������A�*

Training_loss޿<BK�OQ$       B+�M	�	쯄��A�*

Training_lossb��AA�S*       ����	������A�*

Validation_accuracy��P?��B|&       sO� 	斮����A�*

Validation_loss�+?B��x@$       B+�M	G�ﲄ��A�*

Training_lossT^RB��$       B+�M	�5K����A�*

Training_lossf�BՄ'$       B+�M	b������A�*

Training_loss��>B�o�?$       B+�M	�����A�*

Training_loss��BBSZ&�$       B+�M	�_����A�*

Training_lossF�!B��$       B+�M	�A�����A�*

Training_loss�HB�ޒ'$       B+�M	5_����A�*

Training_loss��A)�9$       B+�M	C�t����A�*

Training_loss,Be��f$       B+�M	^fѵ���A�*

Training_lossc�XB���&$       B+�M	N�-����A�*

Training_lossT�QBq��X$       B+�M	M������A�*

Training_loss�XBO�h$       B+�M	$�嶄��A�*

Training_loss��AB�4*�$       B+�M	mUA����A�*

Training_loss���A ���$       B+�M	ٝ����A�*

Training_lossց]Bm�FM$       B+�M	������A�*

Training_lossCB�dM$       B+�M	�U����A�*

Training_loss8HB���r$       B+�M	������A�*

Training_loss LBc��~$       B+�M	J(����A�*

Training_loss�+B���J$       B+�M	�i����A�*

Training_loss�49B~�^0$       B+�M	OXŹ���A�*

Training_loss�!&B��g�$       B+�M	{!����A�*

Training_loss\B��`�$       B+�M	�|}����A�*

Training_loss�(B��Ԣ$       B+�M	�ٺ���A�*

Training_lossY�B��٣$       B+�M	7�4����A�*

Training_loss�dBj0�3$       B+�M	1͐����A�*

Training_loss���A��$       B+�M	xG�����A�*

Training_lossB�$       B+�M	��I����A�*

Training_lossڅ�A�2�f$       B+�M	񠥼���A�*

Training_lossK�A
i$       B+�M	�2����A�*

Training_lossgZB���g$       B+�M	�J]����A�*

Training_loss�8B�@�$       B+�M	�߹����A�*

Training_loss�
Br��$       B+�M	 ����A�*

Training_loss��-B��)K$       B+�M	�s����A�*

Training_loss:PB�W�$       B+�M	�ξ���A�*

Training_loss���A_��#$       B+�M	ρ*����A�*

Training_loss͓6Bco#$       B+�M	������A�*

Training_loss�&Bc�$       B+�M	T�⿄��A�*

Training_loss�YB�	�i$       B+�M	p�>����A�*

Training_loss�% B�!�$       B+�M	mț����A�*

Training_loss֛�A��(�$       B+�M	gd�����A�*

Training_loss��gB�&S�$       B+�M	US����A�*

Training_loss5B6��2$       B+�M	%�����A�*

Training_lossʈHB=���$       B+�M	����A�*

Training_loss*B��U�$       B+�M	��h��A�*

Training_loss,T�A��A$       B+�M		����A�*

Training_lossx�(B)�J#$       B+�M	؃ Ä��A�*

Training_lossƤ&B$�t�$       B+�M	Y�|Ä��A�*

Training_loss�4�A����$       B+�M	jL�Ä��A�*

Training_lossN'LB���0$       B+�M	��5Ą��A�*

Training_loss|.Bw���$       B+�M	ޏ�Ą��A�*

Training_loss�N2B��*N*       ����	��Tń��A�*

Validation_accuracy��P?�2�&       sO� 	��Tń��A�*

Validation_loss<B2�X�$       B+�M	�ǚǄ��A�*

Training_loss�$B��$       B+�M	�#�Ǆ��A�*

Training_lossADB$ �$       B+�M	{�SȄ��A�*

Training_loss�!B�Yy $       B+�M	�q�Ȅ��A�*

Training_lossݖB���$       B+�M	��Ʉ��A�*

Training_lossR�:Bia6N$       B+�M	��iɄ��A�*

Training_lossd�XB-(�$       B+�M	���Ʉ��A�*

Training_loss�qB��$       B+�M	Z�!ʄ��A�*

Training_loss��B��$       B+�M	�}ʄ��A�*

Training_loss��gB�9$       B+�M	�:�ʄ��A�*

Training_lossVo)Bh�$       B+�M	�35˄��A�*

Training_loss,�EB'��$       B+�M	^0�˄��A�*

Training_loss��B��$       B+�M	��˄��A�*

Training_loss���A���$       B+�M	kĪ��A�*

Training_loss�=B��O^$       B+�M	�O�̄��A�*

Training_loss�%B�Λ$       B+�M		6̈́��A�*

Training_loss��B��$       B+�M	�z]̈́��A�*

Training_lossV/B���$       B+�M	/��̈́��A�*

Training_lossP�/B٤�$       B+�M	�΄��A�*

Training_loss5B!��$       B+�M	\�p΄��A�*

Training_loss�SB'��$       B+�M	f��΄��A�*

Training_loss9@B�"W�$       B+�M	��'τ��A�*

Training_loss�CB�W	�$       B+�M	k�τ��A�*

Training_loss�BL�F$       B+�M	���τ��A�*

Training_loss�;B��ڝ$       B+�M	�i;Є��A�*

Training_loss�.B(�_$       B+�M	��Є��A�*

Training_loss+B��PZ$       B+�M	#k�Є��A�*

Training_lossD�:B=��q$       B+�M	��Nф��A�*

Training_loss��Br>��$       B+�M	t��ф��A�*

Training_loss��0Bb��N$       B+�M	BC҄��A�*

Training_loss��iBɷ�H$       B+�M	�c҄��A�*

Training_loss��VB�@�8$       B+�M	O�҄��A�*

Training_lossj�$B�N�$       B+�M	R�ӄ��A�*

Training_loss�B@ϔ>$       B+�M	ǜvӄ��A�*

Training_loss�CZB	���$       B+�M	���ӄ��A�*

Training_loss�rB`�id$       B+�M	�`/Ԅ��A�*

Training_loss�2LB�)��$       B+�M	l$�Ԅ��A�*

Training_loss�<B)X��$       B+�M	Ԃ�Ԅ��A�*

Training_loss�i�Bh���$       B+�M	|�NՄ��A�*

Training_loss�+B�{�%$       B+�M	���Մ��A�*

Training_lossg�B�s1 $       B+�M	�
ք��A�*

Training_lossʁBk�r�$       B+�M	Facք��A�*

Training_loss��A�zLK$       B+�M	(��ք��A�*

Training_lossoB3'��$       B+�M	~�ׄ��A�*

Training_loss�=BB�Z�%$       B+�M	}\wׄ��A�*

Training_lossQ�0BUM�$       B+�M	���ׄ��A�*

Training_loss[B<��e$       B+�M	��1؄��A�*

Training_loss��B��NY$       B+�M	B�؄��A�*

Training_loss4��A��$       B+�M	���؄��A�*

Training_loss�1BK���$       B+�M	U�Fل��A�*

Training_loss�δAy���*       ����	��	ڄ��A�*

Validation_accuracyLLP?@�4&       sO� 	4�	ڄ��A�*

Validation_loss_�CB�!�$       B+�M	7O܄��A�*

Training_loss"�XB�,u$       B+�M	$�܄��A�*

Training_loss.��A�YB�$       B+�M	&Q݄��A�*

Training_loss�)B��$       B+�M	)�b݄��A�*

Training_lossl�B�Y�$       B+�M	���݄��A�*

Training_lossH�BB�$       B+�M	��ބ��A�*

Training_loss:�B@��$       B+�M	�#{ބ��A�*

Training_loss��A���$       B+�M	is�ބ��A�*

Training_loss-I	B��$       B+�M	��3߄��A�*

Training_loss�=B"��.$       B+�M	���߄��A�*

Training_loss�6B���$       B+�M	��߄��A�*

Training_loss;p*B>�ց$       B+�M	,JH����A�*

Training_loss�$B��4�$       B+�M	�H�����A�*

Training_loss �AN��%$       B+�M	�������A�*

Training_loss�T�Ae5��$       B+�M	`[���A�*

Training_loss��1B�H�$       B+�M	ն���A�*

Training_loss5oFBA)}$       B+�M	����A�*

Training_lossi�"B���$       B+�M	On���A�*

Training_lossZJ'B����$       B+�M	����A�*

Training_loss��<BI��$       B+�M	~q'���A�*

Training_lossT�BB"[�$       B+�M	�6����A�*

Training_lossL�B��$       B+�M	�����A�*

Training_loss��B?��$       B+�M	\�<���A�*

Training_loss,2B́�B$       B+�M	Ll����A�*

Training_loss�bUB��Ȱ$       B+�M	�:����A�*

Training_lossr��A%
��$       B+�M	�P���A�*

Training_loss��B2�$>$       B+�M	�#����A�*

Training_lossB2B�$       B+�M	E���A�*

Training_loss�f B^���$       B+�M	n�d���A�*

Training_loss�&B��'J$       B+�M	K�����A�*

Training_loss,kB��5$       B+�M	p����A�*

Training_loss��Ac�f$       B+�M	��{���A�*

Training_lossf�B9Ed�$       B+�M	������A�*

Training_lossQ�DBT�hO$       B+�M	f�3���A�*

Training_loss{ 
B���i$       B+�M	�܏���A�*

Training_loss��B�Q�$       B+�M	E�����A�*

Training_lossP��A翠~$       B+�M	
HH���A�*

Training_loss��$B�<�$       B+�M	K�����A�*

Training_lossVL4B� 4T$       B+�M	uw���A�*

Training_loss &B����$       B+�M	8]���A�*

Training_lossg�A���$       B+�M	=����A�*

Training_loss@�Bl �$       B+�M	|���A�*

Training_loss��A�m�$       B+�M	q���A�*

Training_loss���A(	�5$       B+�M	8����A�*

Training_loss�B7m��$       B+�M	{g*���A�*

Training_loss+�CB�|�9$       B+�M	�
����A�*

Training_loss"�B�'ڲ$       B+�M	y�����A�*

Training_loss]�DB�͆�$       B+�M	�x=���A�*

Training_loss��/B�H�$       B+�M	of����A�*

Training_loss�'B ��$       B+�M	������A�*

Training_loss�~B���*       ����	B!����A�*

Validation_accuracy��P?�M�&       sO� 	�#����A�*

Validation_loss��;B�Z�$       B+�M	�����A�*

Training_loss?�A���$       B+�M	�2u���A�*

Training_lossM�=B�'�"$       B+�M	d�����A�*

Training_loss�AD��$       B+�M	O�.���A�*

Training_loss�BT��$       B+�M	d�����A�*

Training_loss$�B�W$�$       B+�M	3m����A�*

Training_loss,�&B�}�p$       B+�M	�DD���A�*

Training_lossBBB,�;$       B+�M	6=����A�*

Training_loss�;�Aݩ�V$       B+�M	������A�*

Training_loss�SB,L R$       B+�M	�X���A�*

Training_loss(�/BO��$       B+�M	�Ĵ���A�*

Training_loss�B����$       B+�M	������A�*

Training_loss�/:B��E$       B+�M	m����A�*

Training_lossp`,BR���$       B+�M	y;�����A�*

Training_loss�B"\$       B+�M	�1%����A�*

Training_lossS�A �Σ$       B+�M	�*�����A�*

Training_loss�B"Ve�$       B+�M	�T�����A�*

Training_lossJ�B�_\o$       B+�M	�8����A�*

Training_loss��A�{�X$       B+�M	�������A�*

Training_loss��/BZƫ"$       B+�M	g������A�*

Training_loss¬ Bw�h<$       B+�M	�L����A�*

Training_loss��A��$       B+�M	������A�*

Training_lossgw.B4�h�$       B+�M	w�����A�*

Training_loss���A�%�l$       B+�M	�q����A�*

Training_loss�+B���$       B+�M	=������A�*

Training_loss�IB���$       B+�M	�Y����A�*

Training_loss�� B�$��$       B+�M	ѵ����A�*

Training_loss��VBw�o�$       B+�M	�X����A�*

Training_loss�n)B��\Y$       B+�M	u�m����A�*

Training_loss���A-�h$       B+�M	�Z�����A�*

Training_loss\�	B$�-�$       B+�M	Z.����A�*

Training_loss{ )B]�M�$       B+�M	b������A�*

Training_loss�rBjia�$       B+�M	�������A�*

Training_loss�>BJ�k�$       B+�M	;SC����A�*

Training_lossJP*B�>*$       B+�M	�������A�*

Training_loss��9B1��/$       B+�M	������A�*

Training_lossCx)B��U�$       B+�M	j�W����A�*

Training_loss۴3B�,{$       B+�M	}u�����A�*

Training_loss�B��T�$       B+�M	�?����A�*

Training_loss��A1��$       B+�M	4�l����A�*

Training_loss
Bd%(�$       B+�M	&�����A�*

Training_loss�>&By"�$       B+�M	�$ ���A�*

Training_loss_B{A�$       B+�M	�[� ���A�*

Training_loss�OB��%$       B+�M	��� ���A�*

Training_lossƍ�A���$       B+�M	�9���A�*

Training_loss^J�Aկ $       B+�M	B����A�*

Training_loss� Be�W�$       B+�M	F����A�*

Training_loss�)BEJ/�$       B+�M	�M���A�*

Training_lossA�
B\�$       B+�M	o����A�*

Training_loss��A�!�$       B+�M	k*���A�*

Training_loss*��A���*       ����	N�����A�*

Validation_accuracy��P?.,9P&       sO� 	������A�*

Validation_loss��;B���$       B+�M	ù2���A�*

Training_loss1�?B�XJa$       B+�M	ɭ����A�*

Training_loss�B���$       B+�M	������A�*

Training_loss��B����$       B+�M	�H���A�*

Training_loss4,5B��u$       B+�M	u����A�*

Training_loss�_�A>@;$       B+�M	u�����A�*

Training_loss��$B�<�$       B+�M	�\���A�*

Training_lossj^�A-��$       B+�M	iq����A�*

Training_loss 9B����$       B+�M	��	���A�*

Training_lossx�B���$       B+�M	�o	���A�*

Training_loss*�Ak0�$       B+�M	C;�	���A�*

Training_loss�liBХ|$       B+�M	 (
���A�*

Training_loss��B� �$       B+�M	m��
���A�*

Training_loss�uB<s3�$       B+�M	���
���A�*

Training_loss�v�A+�5A$       B+�M	Ԝ;���A�*

Training_loss��7B����$       B+�M	������A�*

Training_loss��
B̕[$       B+�M	ƥ����A�*

Training_loss��4B�Xm$       B+�M	��O���A�*

Training_loss"�B���$       B+�M	�0����A�*

Training_lossE3�A.��$       B+�M	[a���A�*

Training_loss�kB���$       B+�M	�c���A�*

Training_loss$=B�BK�$       B+�M	r����A�*

Training_lossL�/B��-#$       B+�M	����A�*

Training_loss��B���$       B+�M	%�w���A�*

Training_lossppBG�$       B+�M	������A�*

Training_lossJ��Ak���$       B+�M	~�2���A�*

Training_loss�C�A2Q�$       B+�M	�Q����A�*

Training_loss�*B%�h$       B+�M	�����A�*

Training_loss�Q�A
b��$       B+�M	�jG���A�*

Training_loss�\HBR�$       B+�M	�����A�*

Training_loss0��A���$       B+�M	�����A�*

Training_loss$�>B�"`$       B+�M	}\���A�*

Training_loss�L/B<��$       B+�M	������A�*

Training_loss�rDBgR'�$       B+�M	(����A�*

Training_loss�
B5���$       B+�M	�ep���A�*

Training_loss��A`�$       B+�M	������A�*

Training_lossBot�$       B+�M	�j(���A�*

Training_lossjB�eZr$       B+�M	�c����A�*

Training_loss�$HB~��$       B+�M	s+����A�*

Training_loss�tB��)$       B+�M	j<���A�*

Training_loss�a;Bl��F$       B+�M	1����A�*

Training_loss�NBr6��$       B+�M	r����A�*

Training_loss��	B�	��$       B+�M	�P���A�*

Training_loss�8B�D*p$       B+�M	�¬���A�*

Training_loss���AhǌE$       B+�M	�����A�*

Training_loss,�'B��Y$       B+�M	��d���A�*

Training_loss�d1B��ق$       B+�M	�����A�*

Training_loss��B2|�$       B+�M	O����A�*

Training_loss��Bـ��$       B+�M	�6x���A�*

Training_lossPzCB[���$       B+�M	�����A�*

Training_lossx+B��.�*       ����	"����A�*

Validation_accuracyLLR?׋_&       sO� 	�����A�*

Validation_loss0�8BP5��$       B+�M	P7����A�*

Training_loss��B�Y�s$       B+�M	}^R���A�*

Training_loss��(B����$       B+�M	����A�*

Training_loss�2BI�&9$       B+�M	f
���A�*

Training_lossD9B� �	$       B+�M	/1f���A�*

Training_loss�^�A����$       B+�M	������A�*

Training_loss	�3BF$�$       B+�M	����A�*

Training_loss�CB���1$       B+�M	��y���A�*

Training_lossh�$Bj�[$       B+�M	�����A�*

Training_lossV�B�l�5$       B+�M	L52���A�*

Training_lossi{�A���$       B+�M	�y����A�*

Training_lossHB$:r�$       B+�M	�}����A�*

Training_loss�w�A!2O�$       B+�M	w�F���A�*

Training_lossR3YB
?�l$       B+�M	oH����A�*

Training_lossG	�A�EN$       B+�M	�G ���A�*

Training_lossz�B��3�$       B+�M	Me ���A�*

Training_loss|�)BwiP�$       B+�M	}�� ���A�*

Training_loss�@Bw$       B+�M	�U!���A�*

Training_loss6�'B���$       B+�M	� z!���A�*

Training_loss��AO���$       B+�M	��!���A�*

Training_loss��A�>_$       B+�M	`�2"���A�*

Training_loss�;B ���$       B+�M	�9�"���A�*

Training_loss>�Bս�g$       B+�M	t#�"���A�*

Training_loss>+#B';lp$       B+�M	o~F#���A�*

Training_lossԲ,B��f+$       B+�M	C�#���A�*

Training_loss0/Bwy�$       B+�M	 }�#���A�*

Training_loss�B�G�$       B+�M	��[$���A�*

Training_loss2M*B�Ah$       B+�M	�o�$���A�*

Training_loss�pB�Sx�$       B+�M	�e%���A�*

Training_loss	QB�LD6$       B+�M	X�p%���A�*

Training_loss�Q�A�(��$       B+�M	���%���A�*

Training_loss��DB�p�R$       B+�M	K�(&���A�*

Training_lossz<'B�V��$       B+�M	�Ą&���A�*

Training_loss7��A-�n�$       B+�M	��&���A�*

Training_loss�eB*^�$       B+�M	'h='���A�*

Training_loss���A����$       B+�M	$H�'���A�*

Training_loss�WBhAP�$       B+�M	DL�'���A�*

Training_lossF�=B�n]I$       B+�M	)yR(���A�*

Training_loss�B�@]$       B+�M	Z��(���A�*

Training_loss��B��$       B+�M	
)���A�*

Training_lossL�B�4�$       B+�M	��f)���A�*

Training_loss?kB��
0$       B+�M	�n�)���A�*

Training_loss�B_ι�$       B+�M	�#*���A�*

Training_lossb�Bة�$       B+�M	|�z*���A�*

Training_lossb�MB�,m�$       B+�M	T��*���A�*

Training_loss��"B�8�N$       B+�M	�+3+���A�*

Training_loss�Bo�QH$       B+�M	z�+���A�*

Training_loss5)�A���$       B+�M	&��+���A�*

Training_loss!B�@9$       B+�M		kG,���A�*

Training_loss� XB���	$       B+�M	�D�,���A�*

Training_lossf��A����*       ����	�i-���A�*

Validation_accuracyLLQ?aO0�&       sO� 	�i-���A�*

Validation_loss�.BB11$       B+�M	��/���A�*

Training_loss(B��$       B+�M	�e;0���A�*

Training_lossa�B	P�$       B+�M	��0���A�*

Training_loss���A)0P$       B+�M	�*�0���A�*

Training_loss��BU �$       B+�M	q�P1���A�*

Training_loss��AcC{�$       B+�M	�1���A�*

Training_loss��B��� $       B+�M	�	2���A�*

Training_loss�Bn�4$       B+�M	N
f2���A�*

Training_loss0�A*�G{$       B+�M	���2���A�*

Training_loss�kB�ֻ$       B+�M	i�3���A�*

Training_lossn\%B\u5$       B+�M	LT{3���A�*

Training_loss�p�A� ��$       B+�M	U��3���A�*

Training_lossҠ�A�˂�$       B+�M	`�34���A�*

Training_loss�x2B5��$       B+�M	qY�4���A�*

Training_loss��*B�/rC$       B+�M	���4���A�*

Training_lossB�)�$       B+�M	�I5���A�*

Training_loss�(�A��>$       B+�M	_~�5���A�*

Training_lossl�A1��$       B+�M	+ 6���A�*

Training_loss���A����$       B+�M	ޯ[6���A�*

Training_loss��B��+�$       B+�M	M1�6���A�*

Training_loss��A�,7$       B+�M	M7���A�*

Training_loss
�8Bѵ��$       B+�M	��o7���A�*

Training_loss;(B�U�j$       B+�M	Bx�7���A�*

Training_loss�`B_=�$       B+�M	�'8���A�*

Training_loss(*�A*T��$       B+�M	�+�8���A�*

Training_loss�A�-��$       B+�M	�B�8���A�*

Training_lossW7B����$       B+�M	�:9���A�*

Training_loss�pBJ�$       B+�M	���9���A�*

Training_lossY��A��h�$       B+�M	���9���A�*

Training_loss`��A����$       B+�M	�.O:���A�*

Training_loss5AB}�|s$       B+�M	��:���A�*

Training_loss&Bū�-$       B+�M	�i;���A�*

Training_lossE�$B0�$       B+�M	�c;���A�*

Training_loss��B�6��$       B+�M	�G�;���A�*

Training_loss��A3�g�$       B+�M	4�<���A�*

Training_loss�EB(V�$       B+�M	#�y<���A�*

Training_loss�B���$       B+�M	���<���A�*

Training_loss��AKr�{$       B+�M	JD2=���A�*

Training_loss<V�A�-�M$       B+�M	�6�=���A�*

Training_loss�0�A@^@�$       B+�M	+�=���A�*

Training_loss��B��7$       B+�M	)�E>���A�*

Training_loss|+�A�
�s$       B+�M	��>���A�*

Training_lossf� B���$       B+�M	� ?���A�*

Training_loss:�7B5O=J$       B+�M	N_]?���A�*

Training_lossN7Bj��$       B+�M	: �?���A�*

Training_loss���AC
�f$       B+�M	y�@���A�*

Training_lossQ�B�"f$       B+�M	K�q@���A�*

Training_loss�][Bl�N$       B+�M	.p�@���A�*

Training_lossp�B�8r$       B+�M	��)A���A�*

Training_loss^?�AQը�$       B+�M	故A���A�*

Training_loss�#BX��i*       ����	jkIB���A�*

Validation_accuracy��P?K&       sO� 	nIB���A�*

Validation_loss�@B�,V-$       B+�M	��D���A�*

Training_loss���A����$       B+�M	�BE���A�*

Training_loss �5BL�iw$       B+�M	�nE���A�*

Training_loss6�B̖q$       B+�M	S$�E���A�*

Training_loss<B� �$       B+�M	Z�&F���A�*

Training_loss��Bz.s$       B+�M	^f�F���A�*

Training_lossh�MB���L$       B+�M	���F���A�*

Training_lossX��A�%��$       B+�M	�X:G���A�*

Training_loss��B���$       B+�M	��G���A�*

Training_losswB�nq�$       B+�M	LR�G���A�*

Training_loss��B�׊$       B+�M	s�NH���A�*

Training_losstMB֊�$       B+�M	��H���A�*

Training_loss�B�(�$       B+�M	:I���A�*

Training_loss-a%B2HqN$       B+�M	d�cI���A�*

Training_loss���A]���$       B+�M	���I���A�*

Training_loss�0�AK�1�$       B+�M	�J���A�*

Training_loss��-B�o�/$       B+�M	rowJ���A�*

Training_loss+��Ar�!�$       B+�M	�K�J���A�*

Training_lossJ�B����$       B+�M	361K���A�*

Training_loss��B��ub$       B+�M	��K���A�*

Training_loss6��A�q$       B+�M	�'�K���A�*

Training_loss�S4B��y$       B+�M	�9GL���A�*

Training_loss2x�A����$       B+�M	��L���A�*

Training_loss�7B��Z$       B+�M	j��L���A�*

Training_lossP4B �_J$       B+�M	�
\M���A�*

Training_loss6!B�h-�$       B+�M	�y�M���A�*

Training_lossBx�A*bjG$       B+�M	4N���A�*

Training_lossZ�A���$       B+�M	^�qN���A�*

Training_lossu�B/�/�$       B+�M	ʌ�N���A�*

Training_loss�B IE$       B+�M	��+O���A�*

Training_loss��AW�($       B+�M	���O���A�*

Training_loss�L
B��l�$       B+�M	�%�O���A�*

Training_loss�*B�
[r$       B+�M	/EP���A�*

Training_loss���Ax<�f$       B+�M	#��P���A�*

Training_loss��B�WЂ$       B+�M	^��P���A�*

Training_losse��A����$       B+�M	�'YQ���A�*

Training_lossjB��ѵ$       B+�M	e��Q���A�*

Training_loss���AK�C$       B+�M	�3R���A�*

Training_lossͺ5B�s��$       B+�M	�-mR���A�*

Training_loss��A�I$$       B+�M	_%�R���A�*

Training_loss�B�6�W$       B+�M	�>%S���A�*

Training_loss	@B�Tޖ$       B+�M	Xt�S���A�*

Training_loss��B�㧇$       B+�M	� �S���A�*

Training_loss>vBT�d$       B+�M	܂9T���A�*

Training_lossƚ�A�bG$       B+�M	H�T���A�*

Training_lossIx�A�Ҍ�$       B+�M	���T���A�*

Training_loss�)�A���r$       B+�M	��LU���A�*

Training_lossz96B6!�$       B+�M	�ܨU���A�*

Training_loss��$B7%K�$       B+�M	8�V���A�*

Training_lossf+ B	��*$       B+�M	Zf`V���A�*

Training_loss�B�~��*       ����	"�#W���A�*

Validation_accuracy��P?!��&       sO� 	u�#W���A�*

Validation_loss�BBĶf]$       B+�M	`��Y���A�*

Training_loss�{B�}�_$       B+�M	��Y���A�*

Training_lossW�A��T$       B+�M	��GZ���A�*

Training_lossK^�A��Ռ$       B+�M	'�Z���A�*

Training_loss�B2��$       B+�M	~ [���A�*

Training_loss�~�A����$       B+�M	.u\[���A�*

Training_loss�z�A�\5$       B+�M	�^�[���A�*

Training_lossf�A� :A$       B+�M	�\���A�*

Training_loss��B���$       B+�M	eRr\���A�*

Training_lossR�	BPk$       B+�M	E�\���A�*

Training_loss���AJ�$       B+�M	�0*]���A�*

Training_lossB�&B��<$       B+�M	�J�]���A�*

Training_lossJ[Bl�N$       B+�M	b��]���A�*

Training_loss��HB蝬l$       B+�M	>^���A�*

Training_loss��B��$+$       B+�M	��^���A�*

Training_loss��ACYxG$       B+�M	�Z�^���A�*

Training_lossWz1B��$       B+�M	�1Q_���A�*

Training_lossY�Au+Be$       B+�M	��_���A�*

Training_loss�R�A�� $       B+�M	�"
`���A�*

Training_lossQ�=B$��$       B+�M	�vf`���A�*

Training_loss��A�<#$       B+�M	a��`���A�*

Training_loss���A$�7$       B+�M	��a���A�*

Training_lossh��A�I �$       B+�M	�{a���A�*

Training_loss�M�A9`��$       B+�M	��a���A�*

Training_lossh_ B�4�&$       B+�M	P4b���A�*

Training_lossv 8B��|�$       B+�M	d#�b���A�*

Training_lossV]�A����$       B+�M	��b���A�*

Training_losst��A7#��$       B+�M	�BJc���A�*

Training_loss:��A��TW$       B+�M	֐�c���A�*

Training_loss��BS�$       B+�M	��d���A�*

Training_loss0n"BpL$       B+�M	�R_d���A�*

Training_loss[,�Aϭi$       B+�M	J�d���A�*

Training_loss�h&Bu:j�$       B+�M	z�e���A�*

Training_loss*�B��'.$       B+�M	��te���A�*

Training_loss�$BAE��$       B+�M	3��e���A�*

Training_loss/O�A����$       B+�M	|�,f���A�*

Training_loss$pB��g~$       B+�M	w��f���A�*

Training_loss��/Bq���$       B+�M	,��f���A�*

Training_loss��A8ES<$       B+�M	��Bg���A�*

Training_loss���A�Dy$       B+�M	?ɟg���A�*

Training_loss�H�A5�$       B+�M	%Z�g���A�*

Training_loss�+B���$       B+�M	�Xh���A�*

Training_loss�9�A���:$       B+�M	|��h���A�*

Training_loss
Bnh�$       B+�M	�[i���A�*

Training_lossx�A��U@$       B+�M	 �oi���A�*

Training_lossD�A��%l$       B+�M	��i���A�*

Training_loss`BF��$       B+�M	4�)j���A�*

Training_loss6�'B�{o�$       B+�M	p�j���A�*

Training_lossj�Au�	�$       B+�M	��j���A�*

Training_loss�(/BK�A�$       B+�M	��Tk���A�*

Training_lossL�Br�׃*       ����	�l���A�*

Validation_accuracy#"Q?K���&       sO� 	0�l���A�*

Validation_loss}^EB�x$       B+�M	 )�n���A�*

Training_lossD�$B3�$       B+�M	�o���A�*

Training_loss��A�ɜ$       B+�M	�%`o���A�*

Training_lossx�*B�y�$       B+�M	�o���A�*

Training_loss���A/91$       B+�M	�Gp���A�*

Training_lossn�FB�!S$       B+�M	|}up���A�*

Training_loss�jB��U$       B+�M	�[�p���A�*

Training_lossȯBU��a$       B+�M	V�-q���A�*

Training_loss]
Bt��4$       B+�M	S>�q���A�*

Training_loss]�B�Q3�$       B+�M		p�q���A�*

Training_loss��#BV��$       B+�M	�uCr���A�*

Training_loss���A�e�-$       B+�M	�r�r���A�*

Training_loss��2B���$       B+�M	J��r���A�*

Training_lossܫ,BQ��$       B+�M	ûWs���A�*

Training_loss���A��~�$       B+�M	�۳s���A�*

Training_loss)� B%s�$       B+�M	ˠt���A�*

Training_loss��B*�S$       B+�M	 �mt���A�*

Training_loss���A�Q��$       B+�M	?��t���A�*

Training_loss��B[�i$       B+�M	�0'u���A�*

Training_loss���A���$       B+�M	9��u���A�*

Training_lossp��Aq]Y�$       B+�M	���u���A�*

Training_lossw�B�У$       B+�M	
M;v���A�*

Training_lossj�Ar�U�$       B+�M	�S�v���A�*

Training_loss��B��q�$       B+�M	���v���A�*

Training_lossGmB���$       B+�M	]�Pw���A�*

Training_loss���A�$       B+�M	���w���A�*

Training_lossǫB�@��$       B+�M	��x���A�*

Training_loss�B�t��$       B+�M	��dx���A�*

Training_loss�>�Ag�Y�$       B+�M	�+�x���A�*

Training_lossv(�A��1�$       B+�M	/Qy���A�*

Training_loss��Bcc�X$       B+�M	��yy���A�*

Training_lossi��A�'* $       B+�M	���y���A�*

Training_loss�jB^�$       B+�M	�R1z���A�*

Training_loss�B/	�W$       B+�M	�s�z���A�*

Training_lossZ�B��$       B+�M	�f�z���A�*

Training_loss��ATy$       B+�M	��E{���A�*

Training_loss
o"B�!+�$       B+�M	���{���A�*

Training_loss BYB�$       B+�M	j��{���A�*

Training_loss(�
B�JKX$       B+�M	[Z|���A�*

Training_loss}�=BtQש$       B+�M	�{�|���A�*

Training_loss���A��`1$       B+�M	S�}���A�*

Training_lossd�(BZh$       B+�M	�o}���A�*

Training_loss�U�A�,��$       B+�M	��}���A�*

Training_loss��BF"A^$       B+�M	��&~���A�*

Training_loss6�B�5m$       B+�M	�D�~���A�*

Training_loss���A��IX$       B+�M	�.�~���A�*

Training_loss.�'B#���$       B+�M	�b;���A�*

Training_loss�BCZ0�$       B+�M	�����A�*

Training_loss�Bp6($       B+�M	M/����A�*

Training_loss�VB��$       B+�M	�`P����A�*

Training_loss�jB���Y*       ����	I�����A�*

Validation_accuracy��Q?��!&       sO� 	/�����A�*

Validation_loss�{>B��l�$       B+�M	�������A�*

Training_loss� �A���$       B+�M	K�샅��A�*

Training_loss���AJ�R�$       B+�M	��H����A�*

Training_loss�B���$       B+�M	bN�����A�*

Training_loss��(B~�e2$       B+�M	� ����A�*

Training_loss�B*��$       B+�M	��\����A�*

Training_loss���A)�:g$       B+�M	�������A�*

Training_loss�`Bb�[�$       B+�M	�[����A�*

Training_loss�+B��$       B+�M	��q����A�*

Training_loss��BH��B$       B+�M	�eΆ���A�*

Training_loss�>BF s$       B+�M	Ҧ+����A�*

Training_loss�B9=�$       B+�M	�·����A�*

Training_loss�K�A��	$       B+�M	H�㇅��A�*

Training_loss���A�؇$       B+�M	�?����A�*

Training_loss��EB9)�h$       B+�M	�������A�*

Training_lossn�BT ��$       B+�M	�������A�*

Training_lossX� B�UvB$       B+�M	��T����A�*

Training_loss��B�^$       B+�M	𣰉���A�*

Training_loss6�A8�B�$       B+�M	>z����A�*

Training_lossUy�A��f$       B+�M	�ih����A�*

Training_loss�;�A(���$       B+�M	� Ċ���A�*

Training_lossR�Bg��$       B+�M	������A�*

Training_loss�[B����$       B+�M	N~{����A�*

Training_loss<��Ab$       B+�M	K;׋���A�*

Training_loss��!BW���$       B+�M	�x3����A�*

Training_loss�UBO��$       B+�M	嗏����A�*

Training_loss���AL>�+$       B+�M	�C쌅��A�*

Training_loss�R�Ar�-$       B+�M	eH����A�*

Training_loss��B���B$       B+�M	�;�����A�*

Training_loss�\
BAQo�$       B+�M	L������A�*

Training_lossrh�A��&z$       B+�M	C�[����A�*

Training_loss�� B4��$       B+�M	�b�����A�*

Training_loss�g�A[���$       B+�M	M,����A�*

Training_loss��B�@�$       B+�M	3�p����A�*

Training_lossn�A���Q$       B+�M	��̏���A�*

Training_loss7
%B��~;$       B+�M	R�(����A�*

Training_loss�B	drl$       B+�M	Q/�����A�*

Training_loss6K�A%v@$       B+�M	�ᐅ��A�*

Training_lossd!!B��m�$       B+�M	�=����A�*

Training_lossP�B���$       B+�M	�6�����A�*

Training_loss�L>B���$       B+�M	:�����A�*

Training_lossM_Ba�ѱ$       B+�M	��P����A�*

Training_loss�A^-s�$       B+�M	 ⬒���A�*

Training_loss���A/1��$       B+�M		����A�*

Training_lossd|B<g`$       B+�M	q�d����A�*

Training_loss�BjN�-$       B+�M	�E�����A�*

Training_lossnyB���$       B+�M	������A�*

Training_loss$c7BؚT$       B+�M	�Qy����A�*

Training_loss�	Bm$=�$       B+�M	��Ք���A�*

Training_loss��B/ϒ$       B+�M	��1����A�*

Training_lossA��A��f*       ����	������A�*

Validation_accuracy��R?K�wo&       sO� 	'�����A�*

Validation_lossT�9B^#G�$       B+�M	Cq����A�*

Training_lossh\�A�f$       B+�M	R�̘���A�*

Training_loss�B� r�$       B+�M	O")����A�*

Training_loss�K�AG��U$       B+�M	�΅����A�*

Training_loss\�B�U�&$       B+�M	�pᙅ��A�*

Training_loss��RB��J$       B+�M	!�<����A�*

Training_loss��B?Ƶ�$       B+�M	4�����A�*

Training_loss�6B�VM�$       B+�M	�`�����A�*

Training_loss�r�AH��v$       B+�M	&SQ����A�*

Training_loss��A!�C�$       B+�M	�s�����A�*

Training_loss+�
B�qg�$       B+�M	��	����A�*

Training_loss��A�`)$       B+�M	f����A�*

Training_loss@i�Ax�h�$       B+�M	�������A�*

Training_loss~ *B�[y�$       B+�M	4����A�*

Training_loss��B#���$       B+�M	�y����A�*

Training_loss��B׳-�$       B+�M	5Cԝ���A�*

Training_loss�"B�|�$       B+�M	uU1����A�*

Training_loss���Aj�L]$       B+�M	G8�����A�*

Training_loss��*BG.�$       B+�M	EI鞅��A�*

Training_lossJ�%Bi��K$       B+�M	�ME����A�*

Training_loss
�LB�d�[$       B+�M	Yl�����A�*

Training_lossܕB��$       B+�M	y������A�*

Training_lossj��A)ݓ$       B+�M	�qZ����A�*

Training_lossN�B��vf$       B+�M	T:�����A�*

Training_loss6��AHJ"$       B+�M	k�����A�*

Training_lossZB��ד$       B+�M	�l����A�*

Training_loss���A��$       B+�M	�\ȡ���A�*

Training_loss���A�=S8$       B+�M	�%$����A�*

Training_loss���A�)D�$       B+�M	g_����A�*

Training_loss��B2��$$       B+�M	�4ۢ���A�*

Training_lossB�A�2z$       B+�M	��6����A�*

Training_losst�A&;>�$       B+�M	�������A�*

Training_loss�BO��$       B+�M	Y��A�*

Training_lossق�A��$       B+�M	,*K����A�*

Training_loss^��Ag�o$       B+�M	WѦ����A�*

Training_loss>�B��z$       B+�M	`�����A�*

Training_lossڐ�A$,@$       B+�M	�x_����A�*

Training_loss��B��VN$       B+�M	}[�����A�*

Training_lossM��A��$       B+�M	Y����A�*

Training_loss��$BR?f$       B+�M	�4t����A�*

Training_loss���ANГ;$       B+�M	�sЦ���A�*

Training_loss��A:��\$       B+�M	��,����A�*

Training_lossV[BI($       B+�M	�Z�����A�*

Training_lossש�A�u5�$       B+�M	�,䧅��A�*

Training_loss<�
B�� $       B+�M	��@����A�*

Training_loss��A*e[�$       B+�M	c�����A�*

Training_loss�B��ׇ$       B+�M	�������A�*

Training_loss���A?c�q$       B+�M	5�S����A�*

Training_loss���A5Y}�$       B+�M	�ڰ����A�*

Training_loss'eB�-G$       B+�M	�����A�*

Training_lossrd�A��m-*       ����	��Ъ���A�*

Validation_accuracy��Q?��4)&       sO� 	��Ъ���A�*

Validation_lossո=B����$       B+�M	�D{����A�*

Training_loss�"B����$       B+�M	ȕ׭���A�*

Training_loss�IB!IRC$       B+�M	��4����A�*

Training_loss�/BHr$       B+�M	�吮���A�*

Training_loss�	Bʃ�$       B+�M	`�쮅��A�*

Training_loss��A[�9�$       B+�M	33H����A�*

Training_loss8��A��N$       B+�M	9^�����A�*

Training_loss��B��$       B+�M	������A�*

Training_loss�BB1�19$       B+�M	N�\����A�*

Training_lossT�B�σF$       B+�M	�Ѹ����A�*

Training_loss�A��?u$       B+�M	�w����A�*

Training_loss���A\�*$       B+�M	��p����A�*

Training_lossz�!Bb���$       B+�M	uVͱ���A�*

Training_loss(RB�g%$       B+�M	�c*����A�*

Training_lossj�B.4$       B+�M	?S�����A�*

Training_loss�BZ���$       B+�M	v�ᲅ��A�*

Training_loss0��AI�a�$       B+�M	��>����A�*

Training_losso}�A�'$$       B+�M	|홳���A�*

Training_loss3�1B6�w$       B+�M	35�����A�*

Training_loss��B7T��$       B+�M	��Q����A�*

Training_loss��2B��$       B+�M	;������A�*

Training_loss��A�+��$       B+�M	��
����A�*

Training_lossز&B�n)g$       B+�M	jg����A�*

Training_loss�B�q��$       B+�M	L�ŵ���A�*

Training_loss6"Br�ܧ$       B+�M	k�,����A�*

Training_loss�Ag�A$       B+�M	�|�����A�*

Training_loss�%BĂ��$       B+�M	��嶅��A�*

Training_loss�9�A��c$       B+�M	��J����A�*

Training_loss���A����$       B+�M	�F�����A�*

Training_loss���A2�E~$       B+�M	�k����A�*

Training_lossGM(B;�R$       B+�M	�j����A�*

Training_loss��B���i$       B+�M	d�Ÿ���A�*

Training_loss��B)�R�$       B+�M	\r!����A�*

Training_loss�$B���$       B+�M	�s�����A�*

Training_loss�a�A8��$       B+�M	ɒܹ���A�*

Training_loss��\B�kț$       B+�M	��8����A�*

Training_loss��AB��$       B+�M	������A�*

Training_loss��AvL�$       B+�M	w/���A�*

Training_lossm�B�zd$       B+�M	�
M����A�*

Training_loss���AJW4�$       B+�M	�Ш����A�*

Training_loss�M�A�nU$       B+�M	m�����A�*

Training_loss
�B��$       B+�M	��a����A�*

Training_loss��A-�� $       B+�M	�н����A�*

Training_loss0�A����$       B+�M		o����A�*

Training_loss�o%B̘��$       B+�M	��v����A�*

Training_lossJv�Ab��$       B+�M	�Խ���A�*

Training_loss�~=BU��e$       B+�M	
1����A�*

Training_lossV��AF��$       B+�M	J
�����A�*

Training_loss�Z�A�c�$       B+�M	�B龅��A�*

Training_loss(��A@X"�$       B+�M	�7F����A�*

Training_loss�J�A���*       ����	ٯ
����A�*

Validation_accuracy#"R?��F�&       sO� 	�
����A�*

Validation_lossF:B�x�_$       B+�M	+ٝ��A�*

Training_loss-B	+��$       B+�M	�l���A�*

Training_lossD� B����$       B+�M	=WÅ��A�*

Training_lossuB9IR�$       B+�M	5%�Å��A�*

Training_loss���A�Ժ8$       B+�M	A�ą��A�*

Training_loss�ӈA�]S$       B+�M	��lą��A�*

Training_loss�T�A^��!$       B+�M	��ą��A�*

Training_loss~�A޲��$       B+�M	-$Ņ��A�*

Training_loss��A����$       B+�M	�ʀŅ��A�*

Training_loss�B�>B�$       B+�M	A��Ņ��A�*

Training_loss� �AmĎJ$       B+�M	?p8ƅ��A�*

Training_loss��.B25��$       B+�M	�ߓƅ��A�*

Training_loss�#B�&��$       B+�M	��ƅ��A�*

Training_loss�FB_pH$       B+�M	p�Lǅ��A�*

Training_lossX�B#��$       B+�M	`�ǅ��A�*

Training_loss��A�B�$       B+�M	�ȅ��A�*

Training_loss�lB�Ov$       B+�M	�`ȅ��A�*

Training_loss̂B�\�$       B+�M	�üȅ��A�*

Training_loss�IB�?��$       B+�M	�Ʌ��A�*

Training_loss�B_r^R$       B+�M	�xtɅ��A�*

Training_loss�'%B����$       B+�M	�6�Ʌ��A�*

Training_loss>�<B�8"M$       B+�M	,,ʅ��A�*

Training_loss��B��$       B+�M	7��ʅ��A�*

Training_lossj��A�Ruu$       B+�M	#��ʅ��A�*

Training_loss�pGB��j`$       B+�M	�\@˅��A�*

Training_loss�BB�n�$       B+�M	��˅��A�*

Training_lossfBBF�$       B+�M	B��˅��A�*

Training_loss���A�C��$       B+�M	�U̅��A�*

Training_loss�TB��ܔ$       B+�M	]l�̅��A�*

Training_loss�A�A�Qv�$       B+�M	�,ͅ��A�*

Training_loss�BUyI`$       B+�M	�jͅ��A�*

Training_lossثBe��$       B+�M	���ͅ��A�*

Training_lossw��A1�Q$       B+�M	�#΅��A�*

Training_loss�?(B��P{$       B+�M	g~΅��A�*

Training_loss���A���$       B+�M	��΅��A�*

Training_loss��AY$�$       B+�M	`8υ��A�*

Training_loss��A	��$       B+�M	�w�υ��A�*

Training_lossGxB*iQ�$       B+�M	���υ��A�*

Training_loss4��A%�m�$       B+�M	GMЅ��A�*

Training_loss��A�B�$       B+�M	>�Ѕ��A�*

Training_loss���A<�$       B+�M	h]х��A�*

Training_loss��A!�$       B+�M	�Daх��A�*

Training_lossXB;��$       B+�M	'O�х��A�*

Training_loss8��A���$       B+�M	'J҅��A�*

Training_lossR>�A�6�$       B+�M	�?w҅��A�*

Training_loss���A���$       B+�M	`r�҅��A�*

Training_loss�ҴA�	<�$       B+�M	C;/Ӆ��A�*

Training_loss��B�T�=$       B+�M	�ǋӅ��A�*

Training_lossB,��D$       B+�M	���Ӆ��A�*

Training_lossT~�AU�=�$       B+�M	��Dԅ��A�*

Training_loss�7
B�`��*       ����	��Յ��A�*

Validation_accuracy#"T?�Oi@&       sO� 	��Յ��A�*

Validation_loss%U7Bo��$       B+�M	��ׅ��A�*

Training_lossPB�=�$       B+�M	 �؅��A�*

Training_lossS��A{�h$       B+�M	�$j؅��A�*

Training_loss ��A)��c$       B+�M	EG�؅��A�*

Training_lossN�Bx��$       B+�M	{�!م��A�*

Training_lossg@�A���$       B+�M	2�}م��A�*

Training_losspBf��z$       B+�M	�8�م��A�*

Training_loss�B �$       B+�M	��4څ��A�*

Training_loss��A���$       B+�M	���څ��A�*

Training_loss�B%+��$       B+�M	X��څ��A�*

Training_loss��B ���$       B+�M	-`Hۅ��A�*

Training_loss�� BH{��$       B+�M	h%�ۅ��A�*

Training_loss�?�A2+5�$       B+�M	^܅��A�*

Training_loss�#�A�M�'$       B+�M	y�]܅��A�*

Training_loss���A`	��$       B+�M	1�܅��A�*

Training_loss�B⵩$       B+�M	��݅��A�*

Training_loss-�AN��%$       B+�M	)�p݅��A�*

Training_loss>lB��k�$       B+�M	���݅��A�*

Training_loss,��A{,p�$       B+�M	�"*ޅ��A�*

Training_loss��A�ų�$       B+�M	�N�ޅ��A�*

Training_loss5[�A�V\w$       B+�M	W��ޅ��A�*

Training_lossUB��I�$       B+�M	̲?߅��A�*

Training_lossq_�A]��$       B+�M	�w�߅��A�*

Training_lossX�AYuq�$       B+�M	��߅��A�*

Training_loss\5�AM8�$       B+�M	?T����A�*

Training_lossnN2BQî�$       B+�M	X�����A�*

Training_loss��BdIE$       B+�M	ӽ���A�*

Training_loss�3�A0�U~$       B+�M	�`h���A�*

Training_loss��Ac��d$       B+�M	�����A�*

Training_loss��B|9@�$       B+�M	�Q ���A�*

Training_loss�?B�6a�$       B+�M	H2|���A�*

Training_lossz8�AD���$       B+�M	�����A�*

Training_losshY�A*[��$       B+�M	��3���A�*

Training_loss�kB҉�$       B+�M	Zԏ���A�*

Training_lossҳB���$       B+�M	������A�*

Training_lossԪ�AS�>{$       B+�M	��G���A�*

Training_loss �A�M�$       B+�M	�_����A�*

Training_lossݱ	B��z�$       B+�M	b�����A�*

Training_loss�$B�R0�$       B+�M	#K[���A�*

Training_loss�$�A�S��$       B+�M	������A�*

Training_loss��Ac��$       B+�M	p���A�*

Training_loss��B&�V$       B+�M	�}n���A�*

Training_loss���A7�J$       B+�M	^����A�*

Training_lossr4�AX�$       B+�M	�&���A�*

Training_loss7�A�O�J$       B+�M	7����A�*

Training_loss�(B�4��$       B+�M	<2����A�*

Training_loss%q�A+h8�$       B+�M	�:���A�*

Training_loss�s�A'��$       B+�M	댖���A�*

Training_loss�P�AJ�x$       B+�M	f�����A�*

Training_loss[��A�ܠ�$       B+�M	��N���A�*

Training_loss���A����*       ����	�����A�*

Validation_accuracyxwR?"�^&       sO� 	�����A�*

Validation_loss�9B̻�C$       B+�M	�ܮ���A�*

Training_loss3��A�l�$       B+�M	��
���A�*

Training_loss3�A|�_�$       B+�M	<g���A�*

Training_lossL��A�rN�$       B+�M	�L����A�*

Training_lossJ�'B�"�$       B+�M	�N ���A�*

Training_loss��BY�[$       B+�M	B{|���A�*

Training_lossR��AҁA$       B+�M	 �����A�*

Training_loss���A��Z!$       B+�M	˼4���A�*

Training_loss'Q�A���J$       B+�M	�ڐ���A�*

Training_loss�f�A���$       B+�M	�����A�*

Training_lossJ@�A�+L$       B+�M	EbH����A�*

Training_loss��Buv��$       B+�M	c������A�*

Training_loss�vB���$$       B+�M	7� ���A�*

Training_loss|�Bʬok$       B+�M	��\���A�*

Training_loss�W�Af���$       B+�M	w����A�*

Training_loss-��AZ�|"$       B+�M	�.���A�*

Training_lossbA�A:��$       B+�M	�s���A�*

Training_lossґ�A���~$       B+�M	à����A�*

Training_losstZ�A����$       B+�M	�,���A�*

Training_loss>e�A��u�$       B+�M	u����A�*

Training_loss���AH�$       B+�M	8����A�*

Training_loss��BpT$       B+�M	��@���A�*

Training_loss�ĜA["{$       B+�M	斜���A�*

Training_loss�>B��9F$       B+�M	_����A�*

Training_loss���AKS��$       B+�M	m�U����A�*

Training_loss�w�A���$       B+�M	(�����A�*

Training_loss��A�{�$       B+�M	�n����A�*

Training_loss~$B[��u$       B+�M	hj����A�*

Training_loss!��A?�d�$       B+�M	�[�����A�*

Training_loss>D�A�R�o$       B+�M	Ɗ"����A�*

Training_loss
�A�~�$       B+�M	� ����A�*

Training_loss\6B	�:�$       B+�M	�]�����A�*

Training_lossB��A�O$       B+�M	K 7����A�*

Training_lossVI�Asm�s$       B+�M	������A�*

Training_loss� BK��,$       B+�M	�(�����A�*

Training_lossZ�ABv��$       B+�M	��K����A�*

Training_lossJ��Av�V$       B+�M	�?�����A�*

Training_loss8v.B��D�$       B+�M	�;����A�*

Training_loss�j�A|�$       B+�M	�:a����A�*

Training_loss���A��l$       B+�M	�I�����A�*

Training_loss�l
Bn7�$       B+�M	������A�*

Training_loss?��A�r}�$       B+�M	�|u����A�*

Training_loss-�B��g�$       B+�M	������A�*

Training_loss���A�;�@$       B+�M	f.����A�*

Training_loss�B5H�$       B+�M	�5�����A�*

Training_loss��A��-$       B+�M	�l�����A�*

Training_loss��	B�C�L$       B+�M	��B����A�*

Training_loss��A�YA($       B+�M	�������A�*

Training_loss$7B@�$       B+�M	�O�����A�*

Training_loss��A~�g�$       B+�M	4KW����A�*

Training_lossv�B}a_*       ����	i�����A�*

Validation_accuracy#"Q?˙&       sO� 	;�����A�*

Validation_loss�>B�ح$       B+�M	�J����A�*

Training_loss�G�A�o�$       B+�M	Œ8���A�*

Training_loss2o�A�CV�$       B+�M	]S����A�*

Training_lossA4�A;d�$       B+�M	������A�*

Training_loss6�+B�4�$       B+�M	�.O���A�*

Training_loss�Btxo]$       B+�M	=(����A�*

Training_loss�z�A�b*=$       B+�M	PP���A�*

Training_losse�#B�o�D$       B+�M	�~d���A�*

Training_lossA0�A��%M$       B+�M	�����A�*

Training_loss�]3Ba\�$       B+�M	b���A�*

Training_loss�w�A�y�`$       B+�M	��y���A�*

Training_lossl#B�:Z$       B+�M	K�����A�*

Training_lossVF�A�{C�$       B+�M	�D2���A�*

Training_loss�8�A[?�$       B+�M	)����A�*

Training_lossħ
B���$       B+�M	������A�*

Training_loss4��A�.�$       B+�M	�zE���A�*

Training_lossJ\B���$       B+�M	�����A�*

Training_loss#�
B��$       B+�M	J~����A�*

Training_lossd��A$�$       B+�M	��X���A�*

Training_loss���Av���$       B+�M	3����A�*

Training_loss!B���6$       B+�M	=~	���A�*

Training_loss�B��C�$       B+�M	R�n	���A�*

Training_loss.] B��I$       B+�M	���	���A�*

Training_loss~K/BiV��$       B+�M	n�'
���A�*

Training_loss��BZc$       B+�M	`��
���A�*

Training_loss�XB�$       B+�M	���
���A�*

Training_lossf�Ap�$       B+�M	�;���A�*

Training_losso�A�Xrp$       B+�M	i����A�*

Training_loss.�A/]�$       B+�M	������A�*

Training_loss�_B����$       B+�M	��O���A�*

Training_loss�֦A���$       B+�M	a����A�*

Training_loss`�A($A$       B+�M	����A�*

Training_losst'�AN].$       B+�M	�e���A�*

Training_loss���A*��8$       B+�M	����A�*

Training_loss���A�%��$       B+�M	�.���A�*

Training_loss���A���$       B+�M	��w���A�*

Training_lossRx�Ag�X�$       B+�M	�,����A�*

Training_loss���A>,�n$       B+�M	6�0���A�*

Training_loss��BJ�$       B+�M	{�����A�*

Training_loss�y�A��q�$       B+�M	Z�����A�*

Training_loss"�B����$       B+�M	��E���A�*

Training_loss	��A���$       B+�M	�g����A�*

Training_lossKRBt�b`$       B+�M	q8����A�*

Training_loss�+B���E$       B+�M	=|Y���A�*

Training_loss���A�?�$       B+�M	P����A�*

Training_loss
�AO�t$       B+�M	�}���A� *

Training_loss.L�A��w�$       B+�M	O;o���A� *

Training_lossWH�ALu$       B+�M	������A� *

Training_loss�A�1��$       B+�M	h�&���A� *

Training_loss�R�A�t|�$       B+�M	)�����A� *

Training_loss���A7��2*       ����	7F���A� *

Validation_accuracy��S?��b&       sO� 	q9F���A� *

Validation_loss�7Bկ�p$       B+�M	�o����A� *

Training_loss�:B:��Z$       B+�M	W�Q���A� *

Training_loss�q�A��F�$       B+�M	������A� *

Training_loss��B.��$       B+�M	�����A� *

Training_loss��A��$       B+�M	��m���A� *

Training_loss��B��)�$       B+�M	�	����A� *

Training_loss;B|Ӣ�$       B+�M	%���A� *

Training_loss�^�A�pѶ$       B+�M	Z�����A� *

Training_loss���A +#�$       B+�M	�����A� *

Training_loss�K�A,3�C$       B+�M	V:���A� *

Training_loss�{�AQ&��$       B+�M	����A� *

Training_loss^#B`���$       B+�M	������A� *

Training_lossE��AvW�$       B+�M	�YO���A� *

Training_loss�:�A�v Z$       B+�M	�!����A� *

Training_loss��Ab*��$       B+�M	)����A� *

Training_loss�+B�EqQ$       B+�M	6Ve���A� *

Training_lossc%B΍&$       B+�M	Ŭ����A� *

Training_loss���Aܬh$       B+�M	`���A� *

Training_losst0�A�7�$       B+�M	�|���A� *

Training_lossl��A�*4P$       B+�M	E)����A� *

Training_loss>B_#�$       B+�M	��5���A� *

Training_loss�!&BO�Q$       B+�M	 �����A� *

Training_loss`h�A7hG�$       B+�M	QN����A� *

Training_lossYY�Aؾ�$       B+�M	�L���A� *

Training_lossY�A�]��$       B+�M	�����A� *

Training_losso��Aӝ�$       B+�M	�] ���A� *

Training_loss8�B1���$       B+�M	5Da ���A� *

Training_loss�B]<�$       B+�M	a�� ���A� *

Training_loss)v�A��$       B+�M	�!���A� *

Training_loss^]0Bϩ�$       B+�M	#�v!���A� *

Training_loss���A����$       B+�M	E�!���A� *

Training_loss�
BU�$       B+�M	:X/"���A� *

Training_loss[#B��$       B+�M	�ȋ"���A� *

Training_loss*jB���$       B+�M	e�"���A� *

Training_loss2=�A�ܮ�$       B+�M	M�E#���A� *

Training_lossb�B�H3K$       B+�M	��#���A� *

Training_lossֆ�AKļ�$       B+�M	�6�#���A� *

Training_loss`B�"��$       B+�M	g�Z$���A� *

Training_losssӾAFpr�$       B+�M	ѓ�$���A� *

Training_loss�Y�A��T$       B+�M	I%���A� *

Training_loss�^B�^W1$       B+�M	o�n%���A� *

Training_lossT�A����$       B+�M	��%���A� *

Training_loss] B�f1N$       B+�M	y�&&���A� *

Training_loss� B�<Ji$       B+�M	6�&���A� *

Training_lossZ�A|S�$       B+�M	��&���A� *

Training_lossxT�A݃$       B+�M	rN;'���A� *

Training_loss^��A F�$       B+�M	px�'���A� *

Training_loss=u�A&� $       B+�M	R��'���A� *

Training_loss<a�Am��`$       B+�M	�O(���A� *

Training_loss���A&��$       B+�M	4��(���A� *

Training_lossZR�A��D�*       ����	T�o)���A� *

Validation_accuracy#"S?A�	S&       sO� 	�p)���A� *

Validation_lossPo8B�i?�$       B+�M	Z�,���A� *

Training_lossX��A����$       B+�M	�x,���A� *

Training_loss��Bw�K$       B+�M	`�,���A� *

Training_loss��AR�w�$       B+�M	8�1-���A� *

Training_loss�B#j	$       B+�M	e�-���A� *

Training_loss\�Bc�#O$       B+�M	W��-���A� *

Training_loss��BQ��A$       B+�M	F.���A� *

Training_loss �BtW�A$       B+�M	���.���A� *

Training_lossP�Aɟ�9$       B+�M	:��.���A� *

Training_loss_��A�9~�$       B+�M	��Y/���A� *

Training_loss�_�A�O�$       B+�M	�7�/���A� *

Training_lossx%�A6�$       B+�M	�F0���A� *

Training_loss��8Bs�6c$       B+�M	�"n0���A� *

Training_lossz�B�y%�$       B+�M	�)�0���A� *

Training_loss�G�A��p\$       B+�M	��&1���A� *

Training_loss1��Acb\"$       B+�M	S"�1���A� *

Training_loss��A���d$       B+�M	
��1���A� *

Training_loss�x�A5�>$       B+�M	]k;2���A� *

Training_losst1B�m�2$       B+�M	�8�2���A� *

Training_lossAǮA;���$       B+�M	��2���A� *

Training_loss�6B}���$       B+�M	s�O3���A� *

Training_loss"k�A� W�$       B+�M	��3���A� *

Training_loss��A��$       B+�M	_�4���A� *

Training_loss���A��ՙ$       B+�M	�-d4���A� *

Training_lossFe�A���u$       B+�M	�c�4���A� *

Training_loss,8�A 
$       B+�M	=I5���A� *

Training_loss;��A`�$       B+�M	 ;5���A� *

Training_loss�W�A� k$       B+�M	C�5���A� *

Training_lossj��A0R�$       B+�M	�86���A� *

Training_lossj�B'���$       B+�M	v��6���A� *

Training_loss���A��.O$       B+�M	��6���A� *

Training_loss��AF��$       B+�M	��K7���A� *

Training_loss�)�AϨ7?$       B+�M	
H�7���A� *

Training_loss���AN��$       B+�M	�8���A� *

Training_lossҁ	BaJ�y$       B+�M	��^8���A� *

Training_loss��B��U$       B+�M	�Ϻ8���A� *

Training_lossxB~HƏ$       B+�M	�i9���A� *

Training_loss�$�A���$       B+�M	ur9���A� *

Training_loss~0 B��tM$       B+�M	z��9���A� *

Training_lossCZ�A6��$       B+�M	�S*:���A� *

Training_losshl�A��~�$       B+�M	���:���A� *

Training_loss���A�UP$       B+�M	#�:���A� *

Training_lossU<B�Gt$       B+�M	@;���A� *

Training_lossʥ/B���'$       B+�M	]��;���A� *

Training_lossN�A0��$       B+�M	���;���A� *

Training_lossW�B`�L�$       B+�M	��S<���A� *

Training_loss1Bu�y�$       B+�M	�B�<���A� *

Training_loss��B0m��$       B+�M	�=���A� *

Training_lossv��AA�j�$       B+�M	%$h=���A� *

Training_loss��A3}�$       B+�M	q��=���A� *

Training_loss�1�A���*       ����	�>���A� *

Validation_accuracy��P?�U�n&       sO� 	���>���A� *

Validation_lossX�=B�tE$       B+�M	U�QA���A� *

Training_loss��A��g�$       B+�M	���A���A� *

Training_lossxB�t�}$       B+�M	��	B���A� *

Training_loss���A��n}$       B+�M	�aeB���A� *

Training_loss��B5�$       B+�M	I��B���A� *

Training_loss�
B���I$       B+�M	D�C���A� *

Training_loss��Bs䑼$       B+�M	0zC���A� *

Training_lossT�B�JM$       B+�M	���C���A� *

Training_lossf!B��D�$       B+�M	�93D���A� *

Training_lossB��g2$       B+�M	�ՏD���A� *

Training_loss��A�GL$       B+�M	� �D���A� *

Training_loss7p�A�9#$       B+�M	�'HE���A� *

Training_losslOBe�a$       B+�M	G�E���A� *

Training_loss�j�A��U$       B+�M	� F���A� *

Training_lossу�A�.۩$       B+�M	��]F���A� *

Training_lossla�A���$       B+�M	���F���A� *

Training_lossXG�A_e��$       B+�M	�aG���A� *

Training_loss+(3B��1R$       B+�M	qrG���A� *

Training_loss�7B��3G$       B+�M	aU�G���A� *

Training_loss))�AM֋0$       B+�M	{�*H���A� *

Training_loss��AA�$       B+�M	�ކH���A� *

Training_loss��A���$       B+�M	�I�H���A� *

Training_lossy�Amf��$       B+�M	i ?I���A� *

Training_loss�7�A]�u$       B+�M	3O�I���A�!*

Training_lossK��A��|$$       B+�M	��I���A�!*

Training_loss���AQ���$       B+�M	�7SJ���A�!*

Training_loss���Ape�`$       B+�M	&s�J���A�!*

Training_loss��AdhHt$       B+�M	uZK���A�!*

Training_loss#4�A��[�$       B+�M	bghK���A�!*

Training_loss:c�A�ߖ$       B+�M	���K���A�!*

Training_loss&P�A�A�G$       B+�M	ߨ,L���A�!*

Training_loss�*�A߉��$       B+�M	4��L���A�!*

Training_lossN[�AV@̑$       B+�M	9��L���A�!*

Training_loss��A��W$       B+�M	(�@M���A�!*

Training_lossRH�A�k��$       B+�M	�M���A�!*

Training_loss��B1�$       B+�M	���M���A�!*

Training_lossE��A��q$       B+�M	5�UN���A�!*

Training_loss��B%5E�$       B+�M	H5�N���A�!*

Training_lossHk�A@)�$       B+�M	X�O���A�!*

Training_loss��A #�/$       B+�M	�iO���A�!*

Training_loss���A�P�$       B+�M	��O���A�!*

Training_loss���AceZ$       B+�M	p�#P���A�!*

Training_lossؑ�A��$       B+�M	�P���A�!*

Training_loss�=B�U�$       B+�M	�A�P���A�!*

Training_loss���AJ�$       B+�M	B@7Q���A�!*

Training_lossй�Az �$       B+�M	uZ�Q���A�!*

Training_loss�u�Aּ#$       B+�M	���Q���A�!*

Training_loss�B����$       B+�M	$�KR���A�!*

Training_loss̅�Ay��$       B+�M	��R���A�!*

Training_lossrN�Aw�0$       B+�M	J�S���A�!*

Training_loss!ѩANʢ*       ����	�<�S���A�!*

Validation_accuracy#"Q?6Y�s&       sO� 	[?�S���A�!*

Validation_loss,�<B���$       B+�M	]��V���A�!*

Training_loss�'B�ډF$       B+�M	K=�V���A�!*

Training_loss��Ax�=$       B+�M	�YW���A�!*

Training_loss��AWg��$       B+�M	���W���A�!*

Training_losszE�A~��"$       B+�M	�sX���A�!*

Training_loss8*�A@(�e$       B+�M	��mX���A�!*

Training_lossz�A�Ɇ�$       B+�M	���X���A�!*

Training_loss`�A�Ӵ�$       B+�M	�a%Y���A�!*

Training_loss2#�Ag�$       B+�M	�B�Y���A�!*

Training_loss"	�Aq��$       B+�M	�L�Y���A�!*

Training_loss���A�M�$       B+�M	%�:Z���A�!*

Training_loss�v�A8eg�$       B+�M	
��Z���A�!*

Training_loss�|�A�iئ$       B+�M	,��Z���A�!*

Training_lossn�AdD��$       B+�M	�O[���A�!*

Training_lossD��AAi��$       B+�M	��[���A�!*

Training_loss<��A�T�$       B+�M	��\���A�!*

Training_loss�
�A/���$       B+�M	#Ld\���A�!*

Training_loss�A�A�)��$       B+�M	��\���A�!*

Training_loss���A4�ZB$       B+�M	�]���A�!*

Training_loss)��A�@�$       B+�M	$�x]���A�!*

Training_loss�6%BOkc$       B+�M	��]���A�!*

Training_loss���A��}<$       B+�M	;�0^���A�!*

Training_lossf�B��s�$       B+�M	�|�^���A�!*

Training_loss���A�S$�$       B+�M	H�^���A�!*

Training_loss�B���$       B+�M	�LE_���A�!*

Training_lossQbBb�A$       B+�M	I�_���A�!*

Training_lossz��AH��$       B+�M	���_���A�!*

Training_lossS��A�$       B+�M	�tZ`���A�!*

Training_loss�n�A&� \$       B+�M	�F�`���A�!*

Training_loss |B$��$       B+�M	1�a���A�!*

Training_loss\��A�k�$       B+�M	�na���A�!*

Training_loss�B� J$       B+�M	KV�a���A�!*

Training_loss�rBV��$       B+�M	�'b���A�!*

Training_loss��A��'�$       B+�M	���b���A�!*

Training_loss��A�Mg	$       B+�M	�N�b���A�!*

Training_loss0�A9C��$       B+�M	�:c���A�!*

Training_loss��BE��<$       B+�M	F%�c���A�!*

Training_loss�B�[q$       B+�M	��c���A�!*

Training_loss�G�A�N�$       B+�M	v�Nd���A�!*

Training_loss���A�V$       B+�M	ta�d���A�!*

Training_loss��
B�p�$       B+�M	l�e���A�!*

Training_loss�A3=z$       B+�M	I�be���A�!*

Training_lossΗA��$       B+�M	E��e���A�!*

Training_loss���AC��r$       B+�M	_�f���A�!*

Training_loss�KB��!�$       B+�M	��vf���A�!*

Training_loss���A`�O$       B+�M	^��f���A�!*

Training_loss�@�Aj��$       B+�M	�/g���A�!*

Training_lossz�AyNX4$       B+�M	'��g���A�!*

Training_lossIZ�A14O�$       B+�M	){�g���A�!*

Training_loss B6�۟$       B+�M	K�Dh���A�!*

Training_lossZf�A���*       ����	2wi���A�!*

Validation_accuracy��R?���I&       sO� 	tyi���A�!*

Validation_loss�<B(.bD$       B+�M	l��k���A�!*

Training_lossR*Bl��m$       B+�M	��,l���A�!*

Training_loss�4�A���$       B+�M	��l���A�!*

Training_loss��B2M&$       B+�M	���l���A�!*

Training_lossz��A�>�$       B+�M	*9Am���A�!*

Training_lossRNBPH�x$       B+�M	c^�m���A�!*

Training_loss�C�A8)��$       B+�M	ʋ�m���A�!*

Training_loss��A].$       B+�M	�2Vn���A�!*

Training_losspJ�A��Y�$       B+�M	���n���A�!*

Training_loss)k�A�N�$       B+�M	�wo���A�!*

Training_loss
�A"��L$       B+�M	-�ko���A�!*

Training_loss��A$p��$       B+�M	�5�o���A�!*

Training_loss���A�A1�$       B+�M	�Z#p���A�!*

Training_lossD��A��$       B+�M	�7p���A�!*

Training_loss��B#�mi$       B+�M	�'�p���A�!*

Training_loss��-B6��$       B+�M	��6q���A�!*

Training_lossľA$��$       B+�M	���q���A�!*

Training_loss��A&��y$       B+�M	��q���A�!*

Training_loss4�Bk�'�$       B+�M	W|Kr���A�!*

Training_loss˶A'~��$       B+�M	4�r���A�!*

Training_loss���A���$       B+�M	��s���A�!*

Training_loss ?�As_��$       B+�M	>�_s���A�!*

Training_loss+x�A)���$       B+�M		T�s���A�!*

Training_losse�A@T��$       B+�M	A�t���A�!*

Training_lossݟ�A�|��$       B+�M	�Xtt���A�!*

Training_loss��AG��V$       B+�M	37�t���A�!*

Training_losst$�A4(��$       B+�M	�-u���A�!*

Training_lossh)�A�9l�$       B+�M	ge�u���A�!*

Training_loss�[�A���l$       B+�M	-$�u���A�!*

Training_loss��A$?�$       B+�M	�Av���A�!*

Training_loss��B��1
$       B+�M	?5�v���A�!*

Training_loss�Af��L$       B+�M	Â�v���A�!*

Training_loss�B�	�$       B+�M	-Vw���A�!*

Training_loss6�BK��R$       B+�M	�%�w���A�!*

Training_loss%��A�+��$       B+�M	�x���A�!*

Training_loss�r�A��$       B+�M	B�jx���A�!*

Training_lossNn�A���$       B+�M	��x���A�!*

Training_lossu�A��W$       B+�M	��"y���A�!*

Training_lossu�AJ�1$       B+�M	�O~y���A�!*

Training_loss���A�#�$       B+�M	��y���A�!*

Training_loss��A(W{�$       B+�M	7�6z���A�!*

Training_loss�t�A�"~$       B+�M	��z���A�!*

Training_lossV��AZ�$       B+�M	��z���A�!*

Training_loss���A�s��$       B+�M	~�I{���A�!*

Training_loss��A�b!$       B+�M	���{���A�!*

Training_lossG��A2�[$       B+�M	i|���A�!*

Training_loss��AUb�$       B+�M	�e^|���A�!*

Training_lossN��A�3��$       B+�M	�l�|���A�!*

Training_loss��B!��$       B+�M	7}���A�!*

Training_loss �A��6$       B+�M	��q}���A�!*

Training_loss�S�A���*       ����	��4~���A�!*

Validation_accuracyxwS?��k5&       sO� 	��4~���A�!*

Validation_loss�c7BN�$       B+�M	������A�!*

Training_lossI��A[
M^$       B+�M	��Z����A�"*

Training_loss�*B�Q��$       B+�M	v������A�"*

Training_loss��B�?��$       B+�M	XV����A�"*

Training_loss��A��A$       B+�M	�m����A�"*

Training_loss�P�A�#Z$       B+�M	�Vʂ���A�"*

Training_loss<�Bt9k:$       B+�M	7Q&����A�"*

Training_lossR&�A	4�.$       B+�M	|_�����A�"*

Training_loss���A�n�$       B+�M	"�ރ���A�"*

Training_loss���A����$       B+�M	tF:����A�"*

Training_loss�BB#Ȏ$       B+�M	�񕄆��A�"*

Training_lossA��Az�#$       B+�M	+����A�"*

Training_loss���AY�ަ$       B+�M	��M����A�"*

Training_loss���Ac��P$       B+�M	2驅���A�"*

Training_losse�7BД$       B+�M	�����A�"*

Training_loss(� B���$       B+�M	�2a����A�"*

Training_loss�i�A �y�$       B+�M	�e�����A�"*

Training_lossB�[�$       B+�M	�v����A�"*

Training_lossq��A�ۅ�$       B+�M	iqu����A�"*

Training_lossN�Bn�Lz$       B+�M	��Ї���A�"*

Training_loss���A��k�$       B+�M	�W-����A�"*

Training_loss�e�A�}L$       B+�M	������A�"*

Training_lossZ��A���*$       B+�M	��䈆��A�"*

Training_lossH�B�]i$       B+�M	ir@����A�"*

Training_loss#ǪA+�Y�$       B+�M	�������A�"*

Training_loss}�BԢ*�$       B+�M	������A�"*

Training_loss��A0� $       B+�M	"T����A�"*

Training_loss��AP�9$       B+�M	�f�����A�"*

Training_lossX!B���$       B+�M	!w����A�"*

Training_loss<2B��o�$       B+�M	c�h����A�"*

Training_loss���Ay�V$       B+�M	3ċ���A�"*

Training_loss��As/��$       B+�M	������A�"*

Training_loss��B~���$       B+�M	¡|����A�"*

Training_loss��A,��$       B+�M	7�،���A�"*

Training_loss	��Ao<��$       B+�M	?n4����A�"*

Training_loss���AP�n�$       B+�M	�k�����A�"*

Training_loss�B]��$       B+�M	}�썆��A�"*

Training_loss�I�A$��7$       B+�M	+�H����A�"*

Training_lossN��A��n1$       B+�M	A������A�"*

Training_lossI�A����$       B+�M	9} ����A�"*

Training_loss*3�A�<�Q$       B+�M	��\����A�"*

Training_lossn BS�u$       B+�M	mY�����A�"*

Training_loss;��A:���$       B+�M	1�����A�"*

Training_loss�Bsq$       B+�M	mp����A�"*

Training_lossn��A���$       B+�M	�>̐���A�"*

Training_loss\�A��t1$       B+�M	X(����A�"*

Training_lossy?�A�{�$       B+�M	�Ƀ����A�"*

Training_loss��A�I9$       B+�M	������A�"*

Training_loss���A�)�$       B+�M	�r;����A�"*

Training_loss6^�A�'�$       B+�M	�������A�"*

Training_loss�+�A�W*       ����	_�[����A�"*

Validation_accuracy��S?&��&       sO� 	�[����A�"*

Validation_loss��7B�q��$       B+�M	�u<����A�"*

Training_loss���Ag���$       B+�M	;�����A�"*

Training_loss"N�A�P�$       B+�M	�k�����A�"*

Training_lossȅ�ALȠ�$       B+�M	��]����A�"*

Training_lossv�A@]=($       B+�M	kb���A�"*

Training_loss��B+�\l$       B+�M	�o����A�"*

Training_lossTR�A_���$       B+�M	�-{����A�"*

Training_loss���A�q(h$       B+�M	��ט���A�"*

Training_loss���A�qB8$       B+�M	��3����A�"*

Training_loss��B�*V2$       B+�M	&������A�"*

Training_losst��A%=��$       B+�M	@P홆��A�"*

Training_lossz}B[�yi$       B+�M	��I����A�"*

Training_loss��A����$       B+�M	�ť����A�"*

Training_loss�.B��$T$       B+�M	������A�"*

Training_loss ��AW���$       B+�M	S�^����A�"*

Training_lossD��A_�/�$       B+�M	�纛���A�"*

Training_loss���Am��D$       B+�M	�T����A�"*

Training_lossT��Äֳ$       B+�M	'ls����A�"*

Training_lossG�
B�W�$       B+�M	?pϜ���A�"*

Training_loss
9�A.M/�$       B+�M	&�+����A�"*

Training_lossB��A����$       B+�M	ӣ�����A�"*

Training_loss���AFhc$       B+�M	K䝆��A�"*

Training_lossp�BV�1�$       B+�M	!>@����A�"*

Training_loss�S�A*ݳ�$       B+�M	�䜞���A�"*

Training_loss��A��O�$       B+�M	d������A�"*

Training_lossV B�Ͷ'$       B+�M	�nT����A�"*

Training_loss�L3B%��1$       B+�M	�ͯ����A�"*

Training_loss�`B�U=m$       B+�M	_�����A�"*

Training_loss���A��$       B+�M	J{g����A�"*

Training_loss�� B�t��$       B+�M	r5à���A�"*

Training_loss�ԚA��ۍ$       B+�M	������A�"*

Training_loss��A��$       B+�M	�z����A�"*

Training_loss��Bl/$       B+�M	��֡���A�"*

Training_loss��*Bd��$       B+�M	�2����A�"*

Training_loss�5�A��x�$       B+�M	�������A�"*

Training_loss�ͽA�]� $       B+�M	��ꢆ��A�"*

Training_lossD�AYs �$       B+�M	�F����A�"*

Training_loss|B:$��$       B+�M	����A�"*

Training_loss>��A`��$       B+�M	������A�"*

Training_loss�N�A��$       B+�M	S^Z����A�"*

Training_loss#�A���$       B+�M	�V�����A�"*

Training_lossk�AG�Kj$       B+�M	����A�"*

Training_loss�ӿA]�o�$       B+�M	2�o����A�"*

Training_loss�2�AE��$       B+�M	*:̥���A�"*

Training_loss��A�(�$       B+�M	|�(����A�"*

Training_loss(rB�U�y$       B+�M	�7�����A�"*

Training_loss�AE�,9$       B+�M	�Z榆��A�"*

Training_loss���A�=�$       B+�M	�UB����A�"*

Training_loss*�SA��$       B+�M	� �����A�"*

Training_loss��A��N;$       B+�M	c(�����A�"*

Training_loss�ؼA�;��*       ����	�L�����A�"*

Validation_accuracy��S?���?&       sO� 	�O�����A�"*

Validation_loss�<;B�	S:$       B+�M	�s�����A�"*

Training_lossYjB�H�$       B+�M	�������A�"*

Training_loss
�A
<��$       B+�M	�1Z����A�"*

Training_loss0(�A��$       B+�M	[������A�"*

Training_loss��B����$       B+�M	������A�"*

Training_loss��Avh��$       B+�M	��n����A�"*

Training_loss��BY��;$       B+�M	7�ʭ���A�"*

Training_loss�t�AYZ��$       B+�M	l\'����A�"*

Training_loss�#BL�$       B+�M	%낮���A�"*

Training_loss�C�A8�B$       B+�M	��ޮ���A�"*

Training_loss���Aoi��$       B+�M	�9:����A�"*

Training_loss�ǯA �� $       B+�M	.V�����A�"*

Training_loss��B���$       B+�M	D���A�"*

Training_loss�A�A8z��$       B+�M	ߩO����A�"*

Training_lossԭ�A?xC�$       B+�M	�j�����A�"*

Training_loss�
%Bk�?u$       B+�M	������A�"*

Training_lossqn�A�+��$       B+�M	S�d����A�"*

Training_loss�o�AF��$       B+�M	4������A�"*

Training_loss`^�A#e߆$       B+�M	������A�"*

Training_lossl�B�:W^$       B+�M	#1z����A�"*

Training_loss1��A][5�$       B+�M	�hֲ���A�"*

Training_lossZ�.B S��$       B+�M	��3����A�"*

Training_loss�� BW9�$       B+�M	�ɐ����A�"*

Training_lossή�A)E�7$       B+�M	o�쳆��A�"*

Training_loss��A�$       B+�M	�HH����A�"*

Training_loss�܊A��C�$       B+�M	������A�"*

Training_loss%n�A�v?x$       B+�M	�������A�"*

Training_loss䜱A��Qu$       B+�M	�C\����A�"*

Training_loss^��A;W�f$       B+�M	o׸����A�"*

Training_loss�y�A�w
$       B+�M	�����A�#*

Training_loss�U�A���$       B+�M	D3p����A�#*

Training_loss��A��}�$       B+�M	�˶���A�#*

Training_lossOn�AS|$       B+�M	��&����A�#*

Training_loss�r�A��VB$       B+�M	�c�����A�#*

Training_loss���A�̝�$       B+�M	4޷���A�#*

Training_loss�~�AHc�$       B+�M	��:����A�#*

Training_lossaG�A	C$       B+�M	�D�����A�#*

Training_lossZ��AWm�$       B+�M	�����A�#*

Training_loss���A:3�k$       B+�M	�bO����A�#*

Training_lossp�B�XP�$       B+�M	�ȫ����A�#*

Training_loss�:�A�vϸ$       B+�M	�c����A�#*

Training_loss�Bp��g$       B+�M	�Dc����A�#*

Training_lossTE�A���2$       B+�M	�.�����A�#*

Training_loss䡒A�JC�$       B+�M	������A�#*

Training_loss�A���L$       B+�M	�sv����A�#*

Training_loss�v�A��|$       B+�M	,Eһ���A�#*

Training_loss���A~3�R$       B+�M	�~.����A�#*

Training_lossD��A�p<$       B+�M	�������A�#*

Training_loss)M�A�\�$       B+�M	�缆��A�#*

Training_loss���A��G\$       B+�M	@C����A�#*

Training_loss���A�p��*       ����	D�����A�#*

Validation_accuracy��S?�d}3&       sO� 	;�����A�#*

Validation_lossPl;B�aA#$       B+�M	�G�����A�#*

Training_lossr=�A;���$       B+�M	J�R����A�#*

Training_lossP�A���$       B+�M	�������A�#*

Training_loss���A5�$       B+�M	Ps
��A�#*

Training_loss���Ā1�$       B+�M	��f��A�#*

Training_lossf��A� ��$       B+�M	�����A�#*

Training_loss;.�A2��$       B+�M	�lÆ��A�#*

Training_lossF�	B(��$       B+�M	�|Æ��A�#*

Training_loss���A\��u$       B+�M	�C�Æ��A�#*

Training_loss���A@�$       B+�M	^i4Ć��A�#*

Training_loss"��Ae�gJ$       B+�M	Ǆ�Ć��A�#*

Training_loss���A�4�$       B+�M	=�Ć��A�#*

Training_loss�0�AǑY$       B+�M	�SIņ��A�#*

Training_loss���AN��$       B+�M	,��ņ��A�#*

Training_loss�m�Af�g�$       B+�M	�Ɔ��A�#*

Training_loss���A![?$       B+�M	S_Ɔ��A�#*

Training_loss��A��$       B+�M	�o�Ɔ��A�#*

Training_lossH��Ac�_$       B+�M	�eǆ��A�#*

Training_loss���ADwO{$       B+�M	�sǆ��A�#*

Training_loss�N�Al$#�$       B+�M	� �ǆ��A�#*

Training_loss��A�"$       B+�M	)-Ȇ��A�#*

Training_loss���A���$       B+�M	�-�Ȇ��A�#*

Training_loss6��A����$       B+�M	+4�Ȇ��A�#*

Training_lossŵ B*/�q$       B+�M	�BɆ��A�#*

Training_lossY��A�įq$       B+�M	�E�Ɇ��A�#*

Training_loss	D�A�G��$       B+�M	� �Ɇ��A�#*

Training_loss�'�A�A��$       B+�M	sgXʆ��A�#*

Training_loss|i�Ap�H$       B+�M	�2�ʆ��A�#*

Training_loss�V�Aa¦b$       B+�M	��ˆ��A�#*

Training_loss�A�?V$       B+�M	sinˆ��A�#*

Training_loss~��A���$       B+�M	it�ˆ��A�#*

Training_loss�JB8@O�$       B+�M	�9'̆��A�#*

Training_lossa۽A�i��$       B+�M	�=�̆��A�#*

Training_loss��A��$       B+�M	S<�̆��A�#*

Training_lossI��A$";�$       B+�M	�;͆��A�#*

Training_loss/�B�E*�$       B+�M	/ė͆��A�#*

Training_loss'��Ag�$       B+�M	�(�͆��A�#*

Training_lossz��Af<�$       B+�M	�PΆ��A�#*

Training_loss���A�|
b$       B+�M	n��Ά��A�#*

Training_loss:��A�Z�_$       B+�M	�N	φ��A�#*

Training_loss�V�A��k|$       B+�M	��eφ��A�#*

Training_loss���A�3 $       B+�M	jj�φ��A�#*

Training_loss���A���$       B+�M	��І��A�#*

Training_loss�(�Aa�tY$       B+�M	I�{І��A�#*

Training_loss� �Aⷒ:$       B+�M	���І��A�#*

Training_loss�Z B���$       B+�M	8/5ц��A�#*

Training_loss�a�A��rD$       B+�M	K��ц��A�#*

Training_loss#�At�c�$       B+�M	^h�ц��A�#*

Training_loss��#B��s$       B+�M	4eK҆��A�#*

Training_loss���A���	$       B+�M	a�҆��A�#*

Training_lossL�AE�f*       ����	��kӆ��A�#*

Validation_accuracyxwS?�� &       sO� 	Ȗkӆ��A�#*

Validation_lossh�7Bx�$       B+�M	��dֆ��A�#*

Training_loss+��AY�F$       B+�M	�	�ֆ��A�#*

Training_loss��A�U
$       B+�M	Nc׆��A�#*

Training_loss��A��Q�$       B+�M	,�w׆��A�#*

Training_loss���A�Tމ$       B+�M	�T�׆��A�#*

Training_loss0kVA8��y$       B+�M	�{0؆��A�#*

Training_loss��A����$       B+�M	z��؆��A�#*

Training_loss=�A���R$       B+�M	���؆��A�#*

Training_loss�t�A��$       B+�M	��Dن��A�#*

Training_loss�B&G$       B+�M	�K�ن��A�#*

Training_loss��A �$       B+�M	�h�ن��A�#*

Training_loss@� B[ݘ�$       B+�M	C�Xچ��A�#*

Training_lossY/�A��$       B+�M	N�چ��A�#*

Training_loss�X�A`UzH$       B+�M	��ۆ��A�#*

Training_loss�/�APH܍$       B+�M	�lۆ��A�#*

Training_loss�� Buͽ�$       B+�M	J|�ۆ��A�#*

Training_loss#��Aӥf$       B+�M	p"$܆��A�#*

Training_loss�b�A�>$       B+�M	�#�܆��A�#*

Training_loss�߫A�Q:�$       B+�M	���܆��A�#*

Training_loss�Z�A�C��$       B+�M	uY9݆��A�#*

Training_lossM̢Ai���$       B+�M	_E�݆��A�#*

Training_losse��A�i�M$       B+�M	��݆��A�#*

Training_loss�A���$       B+�M	c�Mކ��A�#*

Training_loss'1�Ac���$       B+�M	���ކ��A�#*

Training_loss���An�$       B+�M	�!߆��A�#*

Training_loss
LB��6�$       B+�M	�b߆��A�#*

Training_loss=JBL��$       B+�M	�߆��A�#*

Training_lossdQ�A.�L$       B+�M	M����A�#*

Training_loss�?
BC�7|$       B+�M	�v����A�#*

Training_loss��A5��*$       B+�M	>&�����A�#*

Training_loss^�A��f.$       B+�M	��/���A�#*

Training_loss�B�x=$       B+�M	^�����A�#*

Training_loss�ʛA\��r$       B+�M	�>����A�#*

Training_loss$&�A-��$       B+�M	aOK���A�#*

Training_loss_��A��$       B+�M	a6����A�#*

Training_losse�>B��t$       B+�M	����A�#*

Training_lossd�A��7'$       B+�M	�<^���A�#*

Training_loss�	�AS�@$       B+�M	�J����A�#*

Training_loss���A�c��$       B+�M	����A�#*

Training_loss���Aa��&$       B+�M	�r���A�#*

Training_loss»�A��L1$       B+�M	/Q����A�#*

Training_loss�A��~$       B+�M	�_*���A�#*

Training_lossYK�AO�3$       B+�M	�B����A�#*

Training_loss�vA�$$       B+�M	C�����A�#*

Training_loss�
B��H$       B+�M	`u?���A�#*

Training_loss!l�A�+��$       B+�M	H�����A�#*

Training_loss$�A�"�,$       B+�M	[�����A�#*

Training_loss�֎A��z�$       B+�M	��S���A�#*

Training_loss'��A``��$       B+�M	�'����A�#*

Training_loss���A�F�&$       B+�M	�����A�#*

Training_lossB'B�;�*       ����	A�����A�#*

Validation_accuracyxwT?@d'A&       sO� 	�����A�#*

Validation_loss�d6BĶg�$       B+�M	_�����A�#*

Training_loss�w�A�H��$       B+�M	��3���A�#*

Training_loss�C�A6�/�$       B+�M	 ʏ���A�#*

Training_loss�жA��G$       B+�M	Ց����A�#*

Training_loss��A�e��$       B+�M	�pG���A�#*

Training_loss>��Ae$       B+�M	ã���A�#*

Training_lossIj.B��U$       B+�M	5����A�#*

Training_loss>}�Aԧ�/$       B+�M	��]���A�$*

Training_lossge�A*`�5$       B+�M	ࡺ���A�$*

Training_loss��A�}�$       B+�M	�����A�$*

Training_loss���AYﰲ$       B+�M	�t���A�$*

Training_loss1�AlZf�$       B+�M	������A�$*

Training_loss&��A�˅�$       B+�M	�,����A�$*

Training_loss@ �A�#�$       B+�M	�g�����A�$*

Training_loss\ʿAƈLv$       B+�M	�������A�$*

Training_loss|��AJW{�$       B+�M	�A���A�$*

Training_lossS��A�'$       B+�M	�,����A�$*

Training_loss㮐Al��$       B+�M	4����A�$*

Training_loss$�B�@��$       B+�M	+W���A�$*

Training_losss� B--B�$       B+�M	t#����A�$*

Training_lossvT�A���6$       B+�M	Yl���A�$*

Training_loss$�A��՝$       B+�M	�l���A�$*

Training_lossӛ�A�$�j$       B+�M	� ����A�$*

Training_lossI��AyP%$       B+�M	��%���A�$*

Training_loss�BB��$       B+�M	P����A�$*

Training_loss�1�A?�K�$       B+�M	�w����A�$*

Training_loss���Al�d$       B+�M	J@����A�$*

Training_lossQd�AU(	�$       B+�M	~������A�$*

Training_loss�A\+O$       B+�M	��/����A�$*

Training_loss��A%�/$       B+�M	L������A�$*

Training_loss&M�A���$       B+�M	�4����A�$*

Training_lossy(B��X�$       B+�M	�}����A�$*

Training_lossEiB����$       B+�M	�������A�$*

Training_loss��A?��$       B+�M	�������A�$*

Training_loss|l�A����$       B+�M	����A�$*

Training_loss�&�A|�Qd$       B+�M	�m�����A�$*

Training_loss��A��~i$       B+�M	�.����A�$*

Training_loss��A�3J$       B+�M	�Ъ����A�$*

Training_loss���Ae�$       B+�M	������A�$*

Training_lossDfB9���$       B+�M	�������A�$*

Training_loss��A�z$�$       B+�M	�������A�$*

Training_loss��A:�z$       B+�M	�P����A�$*

Training_losso�BP�[�$       B+�M	v�����A�$*

Training_loss�A�#0$       B+�M	֐0����A�$*

Training_loss6��A�q4�$       B+�M	������A�$*

Training_loss<^�A0��o$       B+�M	��2����A�$*

Training_loss��AOQ�u$       B+�M	�u�����A�$*

Training_loss�Bf*��$       B+�M	d������A�$*

Training_loss���A�5��$       B+�M	Xpb����A�$*

Training_loss�A��`h$       B+�M	g�����A�$*

Training_lossE�B��*       ����	�A� ���A�$*

Validation_accuracyxwT?�}�$&       sO� 	�G� ���A�$*

Validation_loss��9B^�/=$       B+�M	�����A�$*

Training_losst B��N�$       B+�M	��i���A�$*

Training_loss���ATfm$       B+�M	������A�$*

Training_loss��B݊1s$       B+�M	9�M���A�$*

Training_loss��A^;_$       B+�M	g(����A�$*

Training_lossQR�A�p�$       B+�M	
���A�$*

Training_losso��A�!$�$       B+�M	y���A�$*

Training_loss]L�A����$       B+�M	{�����A�$*

Training_lossh��Aw��$       B+�M	�SM���A�$*

Training_lossn��A�	B�$       B+�M	������A�$*

Training_loss�.�A��)$       B+�M	��6���A�$*

Training_loss�عA���$       B+�M	�����A�$*

Training_loss���Au���$       B+�M	ޏ 	���A�$*

Training_loss�ֻA�%)$       B+�M	m9�	���A�$*

Training_loss��A>h=�$       B+�M	�
���A�$*

Training_loss���A�8$       B+�M	�j
���A�$*

Training_loss(z�A�mFD$       B+�M	���
���A�$*

Training_loss��Auf��$       B+�M	��A���A�$*

Training_lossb��A���$       B+�M	�ѧ���A�$*

Training_lossY��A�~Y�$       B+�M	���A�$*

Training_loss���A���$       B+�M	0/����A�$*

Training_loss���Ar�-�$       B+�M	�%����A�$*

Training_losspu�A�!~�$       B+�M	��d���A�$*

Training_loss�:�A�2Q�$       B+�M	8�����A�$*

Training_loss��A�q�$       B+�M	ZF����A�$*

Training_loss^��A���$       B+�M	S#1���A�$*

Training_loss�R�A�n��$       B+�M	�:����A�$*

Training_loss��ABhΤ$       B+�M	�NG���A�$*

Training_lossϕ�AN�M�$       B+�M	6�����A�$*

Training_lossb��A�o��$       B+�M	К[���A�$*

Training_lossx�A����$       B+�M	������A�$*

Training_lossa��AQ��i$       B+�M	��c���A�$*

Training_loss���A7���$       B+�M	������A�$*

Training_loss�s�AZz�$       B+�M	��Y���A�$*

Training_loss��A&�>I$       B+�M	_�����A�$*

Training_loss���A�I�$       B+�M	y�`���A�$*

Training_loss��A본 $       B+�M	������A�$*

Training_loss��A����$       B+�M	�f���A�$*

Training_lossZ��A�PX�$       B+�M	�����A�$*

Training_loss�A�>
�$       B+�M	�W���A�$*

Training_lossT��Av=2$       B+�M	z�����A�$*

Training_loss�^�A���X$       B+�M	�lR���A�$*

Training_loss�e�A��\$       B+�M	w�����A�$*

Training_loss�R�A���$       B+�M	�;���A�$*

Training_loss�Bx0�z$       B+�M	0����A�$*

Training_loss<��A��w$       B+�M	�9?���A�$*

Training_lossn�AM$g�$       B+�M	1����A�$*

Training_loss<��A9�ɤ$       B+�M	�5���A�$*

Training_lossP{�A�^J$       B+�M	�Ǫ���A�$*

Training_loss�a�A(�J$       B+�M	B�(���A�$*

Training_loss���A��g*       ����	r���A�$*

Validation_accuracyMMS?\W�&       sO� 	�t���A�$*

Validation_loss��@BO�`�$       B+�M	ty����A�$*

Training_loss���AW���$       B+�M	/�, ���A�$*

Training_lossTN	B���$       B+�M	W#� ���A�$*

Training_loss��AF઩$       B+�M	(!���A�$*

Training_loss� �AВ��$       B+�M	@j�!���A�$*

Training_loss���A�q�$       B+�M	m�!���A�$*

Training_lossꔱA䞙�$       B+�M	t�B"���A�$*

Training_loss@�A�?�$       B+�M	O�"���A�$*

Training_loss��A	�Pn$       B+�M	l[	#���A�$*

Training_loss�U�A�f'$       B+�M	��t#���A�$*

Training_loss�r�Ak��$       B+�M	V�#���A�$*

Training_lossP��A�^�$       B+�M	؟�$���A�$*

Training_lossX��A���$       B+�M	�e%���A�$*

Training_loss^A��x�$       B+�M	.�%���A�$*

Training_lossb{�A�Q��$       B+�M	�D&���A�$*

Training_loss�/B���7$       B+�M	Yi�&���A�$*

Training_lossOD�AV��K$       B+�M	'���A�$*

Training_losspPmA��(�$       B+�M	�ݞ'���A�$*

Training_lossm2�A���$       B+�M	F]!(���A�$*

Training_loss��A���$       B+�M	���(���A�$*

Training_loss�i�A^���$       B+�M	|+)���A�$*

Training_loss�7�AE�0�$       B+�M	t�)���A�$*

Training_loss���A�jM�$       B+�M	�@1*���A�$*

Training_loss|'B|�2$       B+�M	���*���A�$*

Training_loss$�A�S$       B+�M	�N>+���A�$*

Training_loss �A��U$       B+�M	O[�+���A�$*

Training_loss��A���$       B+�M	��A,���A�$*

Training_loss`��A�ׇ$       B+�M	�<�,���A�$*

Training_loss�|�A� �$       B+�M	d>N-���A�$*

Training_loss�d B���$       B+�M	���-���A�$*

Training_losse-�A� v$       B+�M	��S.���A�$*

Training_lossJ,�A+��$       B+�M	��.���A�$*

Training_lossl��AJ	H$       B+�M	�QA/���A�$*

Training_loss��A(i&$       B+�M	
�/���A�$*

Training_loss���AL^g$       B+�M	�Y?0���A�$*

Training_lossor�A�Pa'$       B+�M	h�0���A�%*

Training_lossJy�A��#m$       B+�M	`�21���A�%*

Training_loss���AE	��$       B+�M	�%�1���A�%*

Training_loss �Ac���$       B+�M	�62���A�%*

Training_lossS�A�tK�$       B+�M	�*�2���A�%*

Training_lossd�Aҷܐ$       B+�M	\#3���A�%*

Training_loss >�Aeda$       B+�M	̔3���A�%*

Training_loss��A��$       B+�M	S4���A�%*

Training_loss�k�A��4$       B+�M	�Kv4���A�%*

Training_loss�$�A%7��$       B+�M	��4���A�%*

Training_loss���A'�$       B+�M	jX5���A�%*

Training_loss��Ai���$       B+�M	x��5���A�%*

Training_loss���A��l$       B+�M	"�86���A�%*

Training_loss$�BK#��$       B+�M	���6���A�%*

Training_loss$��A��f�$       B+�M	i�7���A�%*

Training_loss�m B���*       ����	rp8���A�%*

Validation_accuracy��S? ��&       sO� 	\s8���A�%*

Validation_loss�>B�M��$       B+�M	o��;���A�%*

Training_loss��A �:$       B+�M	�� <���A�%*

Training_loss��KA��~$       B+�M	��r<���A�%*

Training_lossYōA��}$       B+�M	�F�<���A�%*

Training_lossjhzA��*�$       B+�M	�OW=���A�%*

Training_loss���A^�i$       B+�M	���=���A�%*

Training_loss��AElEo$       B+�M	2K>���A�%*

Training_lossw/B���f$       B+�M	c)�>���A�%*

Training_loss���AB�Ί$       B+�M	3A?���A�%*

Training_loss�BfA�cڕ$       B+�M	Jz�?���A�%*

Training_lossnߞA���$       B+�M	Gq5@���A�%*

Training_loss�A��$       B+�M	�ߦ@���A�%*

Training_loss��A*v�g$       B+�M	oA���A�%*

Training_losshßA4R�>$       B+�M	#i�A���A�%*

Training_loss�zBl��$       B+�M	�HB���A�%*

Training_loss�\�A�Y0$       B+�M	�ւB���A�%*

Training_loss�T�A����$       B+�M	�MC���A�%*

Training_lossy~�A���$       B+�M	�\�C���A�%*

Training_loss�M�A��$       B+�M	o-D���A�%*

Training_lossߛA�4!�$       B+�M	'N�D���A�%*

Training_lossm��A�Q$       B+�M	E���A�%*

Training_lossh@ B 2K$       B+�M	7��E���A�%*

Training_loss1��A�3$       B+�M	��F���A�%*

Training_loss '�A��I�$       B+�M	P�F���A�%*

Training_loss�(Bý%�$       B+�M	M-G���A�%*

Training_loss܇�A���$       B+�M	|уG���A�%*

Training_lossl-�A�H�$       B+�M	:�G���A�%*

Training_loss�s�AF̰0$       B+�M	9D|H���A�%*

Training_loss�V�A`��$       B+�M	}?�H���A�%*

Training_loss��B#�c$       B+�M	p%jI���A�%*

Training_lossxc�A�,	$       B+�M	&�I���A�%*

Training_lossxU�Ak��$       B+�M	�aJ���A�%*

Training_loss�3�A�(�e$       B+�M	u�J���A�%*

Training_loss ��A	�,$       B+�M	u[K���A�%*

Training_loss8��A��Q$       B+�M	c��K���A�%*

Training_lossX�2BH��k$       B+�M	<�RL���A�%*

Training_lossdU�At��6$       B+�M	��L���A�%*

Training_loss�Y�A�w߃$       B+�M	n�FM���A�%*

Training_loss$��A����$       B+�M	��M���A�%*

Training_loss�f�A���y$       B+�M	/:N���A�%*

Training_loss�ǄA�xh�$       B+�M	ٰ�N���A�%*

Training_loss���Af��$       B+�M	�?&O���A�%*

Training_lossF��A��m$       B+�M	�N�O���A�%*

Training_loss��AӚ�b$       B+�M	j0P���A�%*

Training_loss���A����$       B+�M	���P���A�%*

Training_loss��Ao��~$       B+�M	 qQ���A�%*

Training_loss���A�E�$       B+�M	F�Q���A�%*

Training_losseGB��zx$       B+�M	%zR���A�%*

Training_loss�B��B$       B+�M	z�R���A�%*

Training_loss�ńA6��$       B+�M	R#S���A�%*

Training_loss���A����*       ����	/�#T���A�%*

Validation_accuracy��S?/���&       sO� 	u�#T���A�%*

Validation_loss7<B+�i�$       B+�M	n��W���A�%*

Training_loss�$�ADBj<$       B+�M	zo>X���A�%*

Training_loss��A�s�>$       B+�M	-?�X���A�%*

Training_loss�n�A�5B!$       B+�M	;-Y���A�%*

Training_loss�ҬAv�/�$       B+�M	a�Y���A�%*

Training_lossh��A�;�$       B+�M	b�Z���A�%*

Training_lossl�tAc�$�$       B+�M	4��Z���A�%*

Training_lossc�A�$       B+�M	n
[���A�%*

Training_loss���Ai��&$       B+�M	�+�[���A�%*

Training_loss��A�
$       B+�M	A��[���A�%*

Training_loss���A�Y46$       B+�M	nr\���A�%*

Training_loss ��Ax��j$       B+�M	�z�\���A�%*

Training_loss��A�d��$       B+�M	�#a]���A�%*

Training_lossjԓA]V��$       B+�M	�_�]���A�%*

Training_loss���A�Y��$       B+�M	Z)\^���A�%*

Training_loss���A�~KA$       B+�M	a2�^���A�%*

Training_lossƺB2ۨ$       B+�M	y�L_���A�%*

Training_loss���A��H$       B+�M	���_���A�%*

Training_loss���A���1$       B+�M	ԸD`���A�%*

Training_loss�AYQ�h$       B+�M	�)�`���A�%*

Training_loss���Af$       B+�M	y�Ba���A�%*

Training_loss&U�ANWө$       B+�M	2v�a���A�%*

Training_lossM��AL�_$       B+�M	:�#b���A�%*

Training_loss���A���w$       B+�M	�k�b���A�%*

Training_loss[aBq�@�$       B+�M	��c���A�%*

Training_loss�t�A�(Mb$       B+�M	s��c���A�%*

Training_lossP_�A�\Ώ$       B+�M	��c���A�%*

Training_loss���A��$       B+�M	/�rd���A�%*

Training_loss�N�A���$       B+�M	j��d���A�%*

Training_loss䠟A���c$       B+�M	��_e���A�%*

Training_lossw4B$�&�$       B+�M	D��e���A�%*

Training_loss�v�A0/��$       B+�M	�Uf���A�%*

Training_loss�A���$       B+�M	��f���A�%*

Training_loss,.�A-�τ$       B+�M	��Fg���A�%*

Training_loss���A�Z@�$       B+�M	E.�g���A�%*

Training_loss��A��$       B+�M	��3h���A�%*

Training_losspm�A���$       B+�M	HO�h���A�%*

Training_lossr��A��h�$       B+�M	֪i���A�%*

Training_lossh��A|���$       B+�M	z�i���A�%*

Training_lossBI�A���$       B+�M	�j���A�%*

Training_lossvлAҔI$       B+�M	��j���A�%*

Training_loss|��A�< �$       B+�M	�y�j���A�%*

Training_loss��A����$       B+�M	�ek���A�%*

Training_lossR"B_�$       B+�M	�\�k���A�%*

Training_loss`RpA�jQ$       B+�M	U�`l���A�%*

Training_loss��Bt�$       B+�M	i�l���A�%*

Training_loss���A�{hZ$       B+�M	1Cm���A�%*

Training_loss��A���W$       B+�M	���m���A�%*

Training_loss�v�A��$       B+�M	=� n���A�%*

Training_loss��A���'$       B+�M	dΘn���A�%*

Training_loss��A�)Bg*       ����	T6�o���A�%*

Validation_accuracyxwT?.ZP�&       sO� 	m9�o���A�%*

Validation_lossK�7B�4�$       B+�M	5}s���A�%*

Training_loss��Ar�/$       B+�M	�~ts���A�%*

Training_loss�A1�$       B+�M	���s���A�%*

Training_loss@�A<�9$       B+�M	úKt���A�%*

Training_lossj|�A�#�$       B+�M	�}�t���A�%*

Training_loss��PA;+C�$       B+�M	|e:u���A�%*

Training_losso	B��G$       B+�M	,��u���A�%*

Training_loss�^�A1��$       B+�M	��+v���A�%*

Training_loss���A~�F-$       B+�M	J�v���A�%*

Training_lossXp�AWp:4$       B+�M	 �w���A�%*

Training_loss>ѷAX�a�$       B+�M	2:{w���A�%*

Training_loss�~�Ac!�Q$       B+�M	#L�w���A�%*

Training_loss\(�A��>$       B+�M	��xx���A�%*

Training_lossP�B�hvZ$       B+�M	�[�x���A�&*

Training_loss��A���$       B+�M	˽dy���A�&*

Training_loss��yArs4�$       B+�M	�	�y���A�&*

Training_loss�>xA�$       B+�M	;�Pz���A�&*

Training_lossI�A�};$       B+�M	���z���A�&*

Training_loss�&�Af�K$       B+�M	�D<{���A�&*

Training_lossZ^�Aʩ��$       B+�M	�d�{���A�&*

Training_loss.~�A8�>�$       B+�M	q;,|���A�&*

Training_loss�m�A;���$       B+�M	�ס|���A�&*

Training_loss�A��`�$       B+�M	�?}���A�&*

Training_lossC�A3�/$       B+�M	�b�}���A�&*

Training_loss	�A9y�.$       B+�M	~�	~���A�&*

Training_loss���AP��p$       B+�M	'�~���A�&*

Training_lossR>�A�q�H$       B+�M	���~���A�&*

Training_loss`KB�X$       B+�M	�r���A�&*

Training_loss���A5,��$       B+�M	������A�&*

Training_lossnP�A�n&�$       B+�M	;�b����A�&*

Training_loss �dA�� D$       B+�M	��׀���A�&*

Training_loss�f�A���$       B+�M	��O����A�&*

Training_lossW��Awr��$       B+�M	�ǁ���A�&*

Training_loss�+�A:jټ$       B+�M	i�<����A�&*

Training_loss&��A5�N$       B+�M	gc�����A�&*

Training_lossHЏA�6�u$       B+�M	�\,����A�&*

Training_lossb�A$��$       B+�M	m������A�&*

Training_losspr�A[�3�$       B+�M	�8����A�&*

Training_loss���A}$       B+�M	�������A�&*

Training_losshY B��$       B+�M	g�����A�&*

Training_loss��A�q�$       B+�M	������A�&*

Training_loss��A\�$       B+�M	g�����A�&*

Training_loss���A��w$       B+�M	�z����A�&*

Training_loss�=B��I$       B+�M	����A�&*

Training_lossa��A4��$       B+�M	�d����A�&*

Training_losseٯA�yҝ$       B+�M	3ۇ���A�&*

Training_loss7ںA!�@�$       B+�M	~RR����A�&*

Training_loss���AZ�=$       B+�M	ẍ���A�&*

Training_loss�@�A��0$       B+�M	+�E����A�&*

Training_loss"�A`͇�$       B+�M	>"�����A�&*

Training_loss���A�h*       ����	�������A�&*

Validation_accuracy#"T?6g&       sO� 	�������A�&*

Validation_loss728BN��$       B+�M	R
�����A�&*

Training_loss�D�A��)�$       B+�M	'�����A�&*

Training_loss��A�Vc�$       B+�M	�憏���A�&*

Training_loss��A>*��$       B+�M	T������A�&*

Training_lossq��A��L$       B+�M	��v����A�&*

Training_loss���A�� $       B+�M	��퐇��A�&*

Training_loss��A���$       B+�M	`e����A�&*

Training_loss���Ak��$       B+�M	�ߑ���A�&*

Training_loss��BՋQf$       B+�M	W�U����A�&*

Training_lossW��A��Y�$       B+�M	�$͒���A�&*

Training_lossL�#Bt���$       B+�M	�fF����A�&*

Training_loss:��A��($       B+�M	�о����A�&*

Training_loss%�A�_$       B+�M	ni?����A�&*

Training_loss�&�A��m'$       B+�M	�u�����A�&*

Training_loss�h�A��OD$       B+�M	�.O����A�&*

Training_loss�e�A�Jg�$       B+�M	/�ʕ���A�&*

Training_lossd��A%�
�$       B+�M	�PD����A�&*

Training_lossRR�A��d>$       B+�M	oK�����A�&*

Training_loss�z�A9��$       B+�M	r�C����A�&*

Training_lossΒ�A����$       B+�M	*�̗���A�&*

Training_loss�}�A\<̎$       B+�M	�T^����A�&*

Training_loss���A�4�S$       B+�M	�Z☇��A�&*

Training_lossa�A�ŗ�$       B+�M	�n[����A�&*

Training_lossջAd:��$       B+�M	�Dڙ���A�&*

Training_lossH�A�<u$       B+�M	?�X����A�&*

Training_loss�	�A ��$       B+�M	�њ���A�&*

Training_loss۳�A�U$       B+�M	��R����A�&*

Training_lossj�A�v�:$       B+�M	̛ܺ���A�&*

Training_loss�f�A5e�$       B+�M	��G����A�&*

Training_loss��AK��$       B+�M	�Ɯ���A�&*

Training_lossx�ASs$       B+�M	}>����A�&*

Training_loss2�A���+$       B+�M	�E�����A�&*

Training_loss;�AFl�S$       B+�M	!v9����A�&*

Training_loss���A6 �*$       B+�M	�k�����A�&*

Training_loss���A}+Q$       B+�M	U�,����A�&*

Training_loss��Az�)n$       B+�M	Uj�����A�&*

Training_loss�0�A޻v�$       B+�M	n�����A�&*

Training_loss���Aɰ�h$       B+�M	������A�&*

Training_lossr@�A����$       B+�M	�����A�&*

Training_loss�W�A���$       B+�M	8�����A�&*

Training_loss�kBU�>$       B+�M	������A�&*

Training_loss���A��3�$       B+�M	�ru����A�&*

Training_loss8�A���$       B+�M	�뢇��A�&*

Training_loss�-�A/_*R$       B+�M	 c����A�&*

Training_loss�{�A���$       B+�M	J�٣���A�&*

Training_loss4"�A7�O�$       B+�M	t�U����A�&*

Training_loss-;�A@��d$       B+�M	}<֤���A�&*

Training_loss��Aý�$       B+�M	��M����A�&*

Training_loss"p�AVp�$       B+�M	Adʥ���A�&*

Training_loss�{�A+B�+$       B+�M	�I����A�&*

Training_loss3
B�im*       ����	�p:����A�&*

Validation_accuracyxwT?�|�&       sO� 	�s:����A�&*

Validation_loss6B�_`$       B+�M	�3ª���A�&*

Training_lossd3�A�l��$       B+�M	/�#����A�&*

Training_lossvK�A�*��$       B+�M	�ǅ����A�&*

Training_loss0A�A���\$       B+�M	AH竇��A�&*

Training_lossօ�A����$       B+�M	�C����A�&*

Training_loss}ȖAs,�$       B+�M	�d�����A�&*

Training_loss$E�A�U�3$       B+�M	qZ����A�&*

Training_lossr"�A�^�$       B+�M	a����A�&*

Training_loss=l�A
��f$       B+�M	�kí���A�&*

Training_lossm��AW�P�$       B+�M	SX&����A�&*

Training_loss�V�A���$       B+�M	�򂮇��A�&*

Training_loss���A���}$       B+�M	��ᮇ��A�&*

Training_loss�IA��/*$       B+�M	b�@����A�&*

Training_loss)��A�k�0$       B+�M	-x�����A�&*

Training_loss���Ar�s$       B+�M	r7�����A�&*

Training_loss�"�A����$       B+�M	sT����A�&*

Training_lossE��AJL��$       B+�M	������A�&*

Training_lossdx�A6��$       B+�M	�,����A�&*

Training_loss�{�A_�$       B+�M	
�i����A�&*

Training_loss|}�Aߔ4+$       B+�M	UԱ���A�&*

Training_loss3Y�A@u�m$       B+�M	$G9����A�&*

Training_lossK/�A��-�$       B+�M	�?�����A�&*

Training_loss:]YAߖ�$       B+�M	y������A�&*

Training_loss�`�AM�c�$       B+�M	hzX����A�&*

Training_loss�/�A��[�$       B+�M		k�����A�&*

Training_lossI� B�I�$       B+�M	�6����A�&*

Training_loss*��A8�@4$       B+�M	qXy����A�&*

Training_lossLK�A:�6�$       B+�M	�jմ���A�&*

Training_loss4l�A!WL$       B+�M	�V1����A�&*

Training_loss��Ab�o$       B+�M	Ll�����A�&*

Training_loss��A߲O�$       B+�M	�鵇��A�&*

Training_loss�f�A�nc5$       B+�M	�%F����A�&*

Training_loss"~�A��C�$       B+�M	�߬����A�&*

Training_loss�A0q?�$       B+�M	�����A�&*

Training_loss�A���$       B+�M	��t����A�&*

Training_loss��A��E$       B+�M	L6ַ���A�&*

Training_loss�T�A�d&$       B+�M	��2����A�&*

Training_loss�V�A!f��$       B+�M	������A�&*

Training_loss�l�A|���$       B+�M	�긇��A�&*

Training_loss��XA$%�I$       B+�M	iG����A�&*

Training_loss���A�f��$       B+�M	������A�&*

Training_loss�IA�=�$       B+�M	�>����A�'*

Training_loss��A�V4$       B+�M	%l����A�'*

Training_lossr}�Ae�?�$       B+�M	��Ϻ���A�'*

Training_loss���A7���$       B+�M	��-����A�'*

Training_loss���A�\�$       B+�M	�������A�'*

Training_lossw�A�OA�$       B+�M	�������A�'*

Training_loss�\�A50��$       B+�M	�]����A�'*

Training_loss"��A* vw$       B+�M	�������A�'*

Training_lossb��A[4%s$       B+�M	o�1����A�'*

Training_loss��AP�U�*       ����	������A�'*

Validation_accuracyxwT?w��&       sO� 	l�����A�'*

Validation_lossp6B���4$       B+�M	,-V����A�'*

Training_loss��A�t�$       B+�M	(�����A�'*

Training_loss�x�A>d�$       B+�M	�?��A�'*

Training_lossm�A���$       B+�M	��y��A�'*

Training_loss,�A!�	�$       B+�M	-����A�'*

Training_loss	�A��M$       B+�M	�CÇ��A�'*

Training_loss��TA�^A�$       B+�M	�X�Ç��A�'*

Training_lossN8�A�i$       B+�M	:y�Ç��A�'*

Training_losssI�AMw�$       B+�M	5�\ć��A�'*

Training_lossf��Ax�ژ$       B+�M	Eڸć��A�'*

Training_loss�4cA��Y[$       B+�M	=�Ň��A�'*

Training_loss���A��{$       B+�M	trŇ��A�'*

Training_loss���A�Km$       B+�M	X�Ň��A�'*

Training_loss�w�A�i�$       B+�M	C::Ƈ��A�'*

Training_loss"��A9jg$       B+�M	�Q�Ƈ��A�'*

Training_lossg��Avv��$       B+�M	j��Ƈ��A�'*

Training_lossg�B3j�)$       B+�M	�5^Ǉ��A�'*

Training_lossʩ�Am�$       B+�M	'g�Ǉ��A�'*

Training_loss���A����$       B+�M	�$ȇ��A�'*

Training_loss��Af&H�$       B+�M	��ȇ��A�'*

Training_loss�8�A��x$       B+�M	���ȇ��A�'*

Training_loss꺯A@R�}$       B+�M	�1Nɇ��A�'*

Training_loss�N�A��ݕ$       B+�M	�B�ɇ��A�'*

Training_loss��A}�$       B+�M	�"ʇ��A�'*

Training_lossB��AM��$       B+�M	mT�ʇ��A�'*

Training_loss,�Bq�$       B+�M	�)ˇ��A�'*

Training_loss�A��2�$       B+�M	ʘˇ��A�'*

Training_loss��A׸�x$       B+�M	aS̇��A�'*

Training_loss��A����$       B+�M	�$�̇��A�'*

Training_lossP��A)f��$       B+�M	\�"͇��A�'*

Training_loss��A�<��$       B+�M	@��͇��A�'*

Training_loss�A�A���A$       B+�M	�N'·��A�'*

Training_lossn��Ao+��$       B+�M	�g�·��A�'*

Training_lossP��A='��$       B+�M	1#χ��A�'*

Training_loss�3�Ah)��$       B+�M	ut�χ��A�'*

Training_loss���A�{1$       B+�M	wI�χ��A�'*

Training_loss���A�&i$       B+�M	/ipЇ��A�'*

Training_loss��A�6LF$       B+�M	�i�Ї��A�'*

Training_lossV�A���O$       B+�M	��Rч��A�'*

Training_loss3[�A<�yc$       B+�M	���ч��A�'*

Training_lossz��A\H�r$       B+�M	=c6҇��A�'*

Training_loss"^�A=�ɗ$       B+�M	�	�҇��A�'*

Training_loss"�A�Ml�$       B+�M	��Ӈ��A�'*

Training_lossڅ�AB���$       B+�M	�i�Ӈ��A�'*

Training_loss��Ac�&$       B+�M	GVԇ��A�'*

Training_loss_�A��]�$       B+�M	���ԇ��A�'*

Training_loss4��A���$       B+�M	3��ԇ��A�'*

Training_lossw� B���$       B+�M	nՇ��A�'*

Training_loss�ܾA�<�$       B+�M	���Շ��A�'*

Training_loss���A��$       B+�M	5aXև��A�'*

Training_loss���A�L-*       ����	t]Kׇ��A�'*

Validation_accuracy#"T?M2M
&       sO� 	bKׇ��A�'*

Validation_loss�8B�s% $       B+�M	��=ۇ��A�'*

Training_lossA���$       B+�M	��ۇ��A�'*

Training_loss��A�@�U$       B+�M	�E-܇��A�'*

Training_loss=�UA�lg$       B+�M	�_�܇��A�'*

Training_loss��AYb��$       B+�M	�\݇��A�'*

Training_loss_��A�bp�$       B+�M	D��݇��A�'*

Training_losse�A@Xf�$       B+�M	#އ��A�'*

Training_loss�m�A����$       B+�M	��އ��A�'*

Training_loss�M�A&��$       B+�M	2�އ��A�'*

Training_loss���A�K_P$       B+�M	��l߇��A�'*

Training_loss��AV ݰ$       B+�M	1��߇��A�'*

Training_loss���A�Rġ$       B+�M	��U����A�'*

Training_loss���A�3$       B+�M	�������A�'*

Training_loss}ҀA�9n$       B+�M	(�6���A�'*

Training_loss\<�A�U�-$       B+�M	�ͧ���A�'*

Training_loss�$�AJ�(�$       B+�M	2���A�'*

Training_lossꔑAD�K�$       B+�M	������A�'*

Training_loss���Ak���$       B+�M	�x!���A�'*

Training_loss�-�A@ 5$       B+�M	�b����A�'*

Training_loss(��A6 x�$       B+�M	�����A�'*

Training_loss�w�A��X$       B+�M	Fx}���A�'*

Training_lossTÀA��$       B+�M	�����A�'*

Training_loss���A�Tb�$       B+�M	?�c���A�'*

Training_loss�j�A�3`j$       B+�M	�����A�'*

Training_loss^�Axf�$       B+�M	 �F���A�'*

Training_loss2jEA�1&A$       B+�M	�E����A�'*

Training_loss?��A;��$       B+�M	�v,���A�'*

Training_loss�P�A�K�$       B+�M	~�����A�'*

Training_loss�	�A�`�$       B+�M	����A�'*

Training_loss��A�X$       B+�M	�ǅ���A�'*

Training_loss�3�A8j�!$       B+�M	������A�'*

Training_loss"��A�͋$       B+�M	��l���A�'*

Training_loss"��A�=R�$       B+�M	"3����A�'*

Training_loss�m�A��b$       B+�M	'iU���A�'*

Training_loss���AB���$       B+�M	�?����A�'*

Training_loss���A��V�$       B+�M	��=���A�'*

Training_lossԇA��Q$       B+�M	������A�'*

Training_lossP��A���$       B+�M	Z�(���A�'*

Training_lossXЙA���$       B+�M	����A�'*

Training_loss�˖A+�2�$       B+�M	|����A�'*

Training_lossС�AWNC�$       B+�M	�Δ���A�'*

Training_loss�F�AqZd�$       B+�M	~���A�'*

Training_loss�BH�\�$       B+�M	�����A�'*

Training_loss�X�A�f��$       B+�M	�����A�'*

Training_loss1B�4�c$       B+�M	�M���A�'*

Training_loss}��Ad?�n$       B+�M	����A�'*

Training_loss%��A#�z1$       B+�M	�����A�'*

Training_loss�4�Af,�$       B+�M	f}����A�'*

Training_lossR}�A�on�$       B+�M	�[�����A�'*

Training_loss�.�AX�q�$       B+�M	�w���A�'*

Training_loss�"�A9)O*       ����	H����A�'*

Validation_accuracyxwT?�.̝&       sO� 	�����A�'*

Validation_loss0�9BԞ�q$       B+�M	Jz�����A�'*

Training_loss9�A�JV$       B+�M	��[����A�'*

Training_loss�i�A�6#<$       B+�M	�L�����A�'*

Training_loss� �A�Jsn$       B+�M	F�D����A�'*

Training_loss~ͱA��,}$       B+�M	X9�����A�'*

Training_lossn{A�\"$       B+�M	Yi/����A�'*

Training_losspѣA��mP$       B+�M	�m�����A�'*

Training_loss�oA�O�P$       B+�M	B	=����A�'*

Training_loss�T�Ali'p$       B+�M	ݗ�����A�'*

Training_lossU:�A�> �$       B+�M	z3����A�'*

Training_lossЅ�A��$       B+�M	%������A�'*

Training_loss8�A|!X$       B+�M	�����A�'*

Training_loss���A�u�$       B+�M	$������A�'*

Training_lossBqAr$       B+�M	�����A�'*

Training_loss�F�A|��w$       B+�M	��z����A�'*

Training_lossr]�AK�u$       B+�M	Z~�����A�'*

Training_loss��B/NOw$       B+�M	b�f����A�'*

Training_loss�"�AX�h�$       B+�M	�I�����A�'*

Training_loss���A9N@Q$       B+�M	mO����A�'*

Training_lossq��Ax�.T$       B+�M	�8�����A�(*

Training_loss��Ae�͂$       B+�M	j; ���A�(*

Training_loss�>�A����$       B+�M	�� ���A�(*

Training_loss���A���$       B+�M	��+���A�(*

Training_lossN1B���g$       B+�M	Ie����A�(*

Training_loss��A����$       B+�M	����A�(*

Training_losswx�AQK-$       B+�M	������A�(*

Training_lossL�A6\��$       B+�M	A�	���A�(*

Training_loss��eAQ���$       B+�M	J����A�(*

Training_lossy�A#��_$       B+�M	|����A�(*

Training_loss�Y�AjMp�$       B+�M	qV����A�(*

Training_loss��A�r�$       B+�M	^�����A�(*

Training_loss�¹A[*_$       B+�M	 k���A�(*

Training_lossd�A5�A�$       B+�M	F����A�(*

Training_lossR��A�Nt�$       B+�M	�<d���A�(*

Training_loss�ՖA�0@�$       B+�M	������A�(*

Training_lossz�Af=nN$       B+�M	Q3M���A�(*

Training_loss�M[Aj@3$       B+�M	������A�(*

Training_loss8�A]ZWx$       B+�M	[aQ���A�(*

Training_loss�j�A�&-$       B+�M	�����A�(*

Training_loss0��A��d$       B+�M	m=	���A�(*

Training_lossEBhAs*)$       B+�M	�Ĳ	���A�(*

Training_loss�8�A$!`$       B+�M	�}'
���A�(*

Training_loss�ةA��S�$       B+�M	35�
���A�(*

Training_loss1�)B�=ǆ$       B+�M	*����A�(*

Training_loss�AV�~$       B+�M	�m����A�(*

Training_lossN�A��*�$       B+�M	4����A�(*

Training_loss,"�Ab���$       B+�M	�Vt���A�(*

Training_losso��A���l$       B+�M	d�����A�(*

Training_losse�A�r�f$       B+�M	��^���A�(*

Training_loss$}�A�4��$       B+�M	�����A�(*

Training_lossf��A�s��*       ����	e����A�(*

Validation_accuracy#"T?G��&       sO� 	~����A�(*

Validation_losskp:B�2 x$       B+�M		�����A�(*

Training_loss�ęA�ז$       B+�M	c���A�(*

Training_loss��A��<$       B+�M	WB����A�(*

Training_loss�ܔA�N��$       B+�M	�����A�(*

Training_loss*��A_aq�$       B+�M	l�m���A�(*

Training_loss\AvA��$       B+�M	<1����A�(*

Training_loss���A��$       B+�M	mpX���A�(*

Training_loss(��A���D$       B+�M	aU����A�(*

Training_lossᝑA?O�$       B+�M	�sA���A�(*

Training_loss���Aw��$       B+�M	s�����A�(*

Training_lossN��AU13$       B+�M	|)���A�(*

Training_loss#Q�A�f�{$       B+�M	w�����A�(*

Training_loss���AG%��$       B+�M	�����A�(*

Training_lossxԬA$UZ�$       B+�M	������A�(*

Training_loss�êAajݟ$       B+�M	�����A�(*

Training_lossY}�A_/r$       B+�M	�w���A�(*

Training_losspo�A�Dס$       B+�M	������A�(*

Training_loss7��A`P/r$       B+�M	�a���A�(*

Training_loss�cqA^f�$       B+�M	������A�(*

Training_loss�؛A 7�$       B+�M	0HM���A�(*

Training_loss�ӋA��]$       B+�M	"m����A�(*

Training_loss��LA ]�w$       B+�M	�:���A�(*

Training_lossv�A���$       B+�M	=�����A�(*

Training_loss4��A�B��$       B+�M	vm���A�(*

Training_loss��A�O��$       B+�M	��]���A�(*

Training_loss8A�A����$       B+�M	l�����A�(*

Training_loss���AY�9�$       B+�M	l:���A�(*

Training_loss
��A�9K$       B+�M	L����A�(*

Training_lossF4�A)�$       B+�M		S?���A�(*

Training_loss��A�C�$       B+�M	2�����A�(*

Training_lossx_�A0z�t$       B+�M	{�J ���A�(*

Training_loss27.A���d$       B+�M	�� ���A�(*

Training_loss���A��U�$       B+�M	Y�1!���A�(*

Training_loss$��Ab�h$       B+�M	�ˤ!���A�(*

Training_loss���A�(!�$       B+�M	b�"���A�(*

Training_lossb>�A��hN$       B+�M	@��"���A�(*

Training_loss:&�A�r�$       B+�M	��#���A�(*

Training_loss�w�A�$       B+�M	�Ə#���A�(*

Training_lossB��A�%L$       B+�M	�� $���A�(*

Training_lossn��A��#$       B+�M	�7s$���A�(*

Training_loss���A��Û$       B+�M	J�$���A�(*

Training_loss��A{��A$       B+�M	�V%���A�(*

Training_loss"@pA��?$       B+�M	;6�%���A�(*

Training_loss_�}A&���$       B+�M	#�I&���A�(*

Training_loss��cA�H��$       B+�M	�q�&���A�(*

Training_loss+H�A�m�$       B+�M	�n;'���A�(*

Training_lossVQ�AF�2$       B+�M	�2�'���A�(*

Training_loss��Ak��Y$       B+�M	��(���A�(*

Training_loss��Aڭ�$       B+�M	E��(���A�(*

Training_loss���A��?7$       B+�M	�})���A�(*

Training_loss��PA�0�*       ����	"T*���A�(*

Validation_accuracy#"T?�2&       sO� 	�W*���A�(*

Validation_loss�=B�Z$       B+�M	,}�-���A�(*

Training_losszǳAG�a$       B+�M	�#].���A�(*

Training_loss�f�A��p$       B+�M	��.���A�(*

Training_loss0^�A��)�$       B+�M	?/���A�(*

Training_lossq�=AuD�e$       B+�M	ۉ�/���A�(*

Training_loss4n�A���}$       B+�M	�0���A�(*

Training_loss��A�"$       B+�M	m�0���A�(*

Training_loss.CqA��$       B+�M	�*1���A�(*

Training_loss�AW�Y$       B+�M	��1���A�(*

Training_lossb��A(�	E$       B+�M	d@12���A�(*

Training_lossVJ�A��[$       B+�M	-��2���A�(*

Training_loss�S�A� 7�$       B+�M	c3���A�(*

Training_lossgnA�T��$       B+�M	m��3���A�(*

Training_loss��A���$       B+�M	1{4���A�(*

Training_loss@�
B;-F�$       B+�M	�"y4���A�(*

Training_loss6��A8�3�$       B+�M	i�4���A�(*

Training_loss<��Aߣ�u$       B+�M	5�b5���A�(*

Training_loss���A��pj$       B+�M	�s�5���A�(*

Training_lossq7�A�~�$       B+�M	v�Q6���A�(*

Training_lossfީA;��$       B+�M	n�6���A�(*

Training_loss�(�A����$       B+�M	��=7���A�(*

Training_lossh�A��%$       B+�M	.�7���A�(*

Training_loss��AV��$       B+�M	�^(8���A�(*

Training_lossfl�A4�)$       B+�M	EJ�8���A�(*

Training_lossp��A�.�G$       B+�M	o9���A�(*

Training_loss���AiG0A$       B+�M	�S�9���A�(*

Training_lossL��A��$       B+�M	�^:���A�(*

Training_loss�ϭAŷ��$       B+�M	ݶ�:���A�(*

Training_lossp�A��=�$       B+�M	�h;���A�(*

Training_loss2	�A�9F�$       B+�M	Ė;���A�(*

Training_loss(��A�'1O$       B+�M	��<���A�(*

Training_lossT��A�Ʊ$       B+�M	��<���A�(*

Training_loss�$yA�lOY$       B+�M	H7�<���A�(*

Training_loss�8aA�T�$       B+�M	�c=���A�(*

Training_loss���A��|U$       B+�M	l!�=���A�(*

Training_loss�yA� �$       B+�M	�)H>���A�(*

Training_loss��A#�$       B+�M	ka�>���A�(*

Training_loss�J�A�a$       B+�M	 �*?���A�(*

Training_lossupA.M�$       B+�M	8k�?���A�(*

Training_lossV&�A���I$       B+�M	�)@���A�(*

Training_loss/4A��c�$       B+�M	��@���A�(*

Training_loss�7�Azx޲$       B+�M	�S9A���A�(*

Training_loss���A?/J$       B+�M	��A���A�(*

Training_loss�%�Amu$       B+�M	�]BB���A�(*

Training_loss'�{Ag?��$       B+�M	��B���A�(*

Training_loss�łA��{$       B+�M	[�]C���A�(*

Training_loss�I�A,�a$       B+�M	��C���A�(*

Training_loss0%�Ad�^�$       B+�M	+0xD���A�)*

Training_loss�zAX2Y�$       B+�M	c�E���A�)*

Training_loss<{hA�@E$       B+�M	麇E���A�)*

Training_lossh�kA/fɓ*       ����	.ƉF���A�)*

Validation_accuracyxwU?ċ(�&       sO� 	�ɉF���A�)*

Validation_lossQ�6B���$       B+�M	(ԀJ���A�)*

Training_loss�F�A�)J$       B+�M	��J���A�)*

Training_loss�ΠA�ia$       B+�M	�eK���A�)*

Training_lossᇍAv �/$       B+�M		�K���A�)*

Training_lossdK�ASt�6$       B+�M	6#GL���A�)*

Training_lossv�A��$       B+�M	���L���A�)*

Training_loss�؜A�g��$       B+�M	c�,M���A�)*

Training_loss4A�d��$       B+�M	L3�M���A�)*

Training_lossǓAJ�A�$       B+�M	[�N���A�)*

Training_loss���A�\��$       B+�M	�u�N���A�)*

Training_loss�LpAۡ{9$       B+�M	�O���A�)*

Training_loss�:Aӛ�$       B+�M	exO���A�)*

Training_losss�wA�Ҧ�$       B+�M	�d�O���A�)*

Training_lossx�Av�d$       B+�M	�]P���A�)*

Training_loss�N�A2��$       B+�M	[C�P���A�)*

Training_loss.K�A����$       B+�M	 �HQ���A�)*

Training_loss�lA��$       B+�M	�~�Q���A�)*

Training_loss��OA��$       B+�M	�-R���A�)*

Training_loss�qA_���$       B+�M	��R���A�)*

Training_lossN3�A��'�$       B+�M	��S���A�)*

Training_loss��AқϽ$       B+�M	�+�S���A�)*

Training_loss�-�Aȕr�$       B+�M	�]�S���A�)*

Training_lossR.�A��8l$       B+�M	�gT���A�)*

Training_loss� �A��8�$       B+�M	}��T���A�)*

Training_loss]C�A��+)$       B+�M	�LU���A�)*

Training_losspAZA�6�^$       B+�M	6��U���A�)*

Training_loss/��A��H�$       B+�M	 3V���A�)*

Training_loss߈A@n�<$       B+�M	⏪V���A�)*

Training_lossq��A�8d�$       B+�M	CrW���A�)*

Training_loss���AhaNp$       B+�M	��W���A�)*

Training_loss���A� 3j$       B+�M	Y�X���A�)*

Training_loss?�A�d�I$       B+�M	u|X���A�)*

Training_loss ��AR�RT$       B+�M	�wY���A�)*

Training_lossV`�A��g�$       B+�M	�уY���A�)*

Training_lossu�A�!�C$       B+�M	��Y���A�)*

Training_lossJ~�Aʕ	�$       B+�M	�mgZ���A�)*

Training_loss�M�A��T$       B+�M	� �Z���A�)*

Training_loss7 �A��$       B+�M	��M[���A�)*

Training_loss�I�A05��$       B+�M	��[���A�)*

Training_loss��oAh/N�$       B+�M	��4\���A�)*

Training_lossb��AX���$       B+�M	&�\���A�)*

Training_loss5Y|A���]$       B+�M	�]���A�)*

Training_lossf.�A�֧�$       B+�M	���]���A�)*

Training_loss@ܒA�R8/$       B+�M	���]���A�)*

Training_loss��A���$       B+�M		q^���A�)*

Training_losspUB�c��$       B+�M	���^���A�)*

Training_loss�&�Axe��$       B+�M	9�V_���A�)*

Training_lossF�AB�\�$       B+�M	��_���A�)*

Training_loss-CNA	�K)$       B+�M	/l9`���A�)*

Training_loss��A�^�$       B+�M	���`���A�)*

Training_loss���Axy�*       ����	�Ýa���A�)*

Validation_accuracyxwT?x�� &       sO� 	ȝa���A�)*

Validation_loss��9B���w$       B+�M	Л�e���A�)*

Training_lossV��AKB�$       B+�M	+�f���A�)*

Training_loss���A�S�$       B+�M	G�~f���A�)*

Training_loss��A���$       B+�M	T��f���A�)*

Training_lossFIPA�E`�$       B+�M	x�gg���A�)*

Training_loss6֛A(��K$       B+�M	q�g���A�)*

Training_loss���A7�P$       B+�M	Vh���A�)*

Training_loss�ԌA��>$       B+�M	J|�h���A�)*

Training_loss�zhA�<N$       B+�M	�Ai���A�)*

Training_loss��
B��v$       B+�M	\�i���A�)*

Training_loss�Q�A��*z$       B+�M	��@j���A�)*

Training_loss|I�At�bF$       B+�M	V-�j���A�)*

Training_loss��A�U�$       B+�M	"T1k���A�)*

Training_loss^�A2��B$       B+�M	kG�k���A�)*

Training_loss�ϠA��3�$       B+�M	/kl���A�)*

Training_loss��AIh�B$       B+�M	/��l���A�)*

Training_loss� �AI�!$       B+�M	�m���A�)*

Training_lossf�A�w��$       B+�M	z9vm���A�)*

Training_lossӽ�A�6�$       B+�M	j�m���A�)*

Training_loss��Ai��%$       B+�M	��Un���A�)*

Training_loss<y�A�'z$       B+�M	;��n���A�)*

Training_lossV�wAw	�E$       B+�M	7>o���A�)*

Training_loss�N�A�Z'$       B+�M	�;�o���A�)*

Training_loss`��A�5_$       B+�M	ü%p���A�)*

Training_loss���A���$       B+�M	T��p���A�)*

Training_lossg��AMm�$       B+�M	q���A�)*

Training_losst�Am,F�$       B+�M	�|q���A�)*

Training_loss^��A2;"�$       B+�M	���q���A�)*

Training_loss3�AB��}$       B+�M	Oubr���A�)*

Training_loss#��A��>p$       B+�M	Oy�r���A�)*

Training_lossC�RAE��$       B+�M	RGHs���A�)*

Training_loss���A��VD$       B+�M	Gv�s���A�)*

Training_lossE]�A��4$       B+�M	��,t���A�)*

Training_loss�XOA���$       B+�M	�؟t���A�)*

Training_loss���A��[�$       B+�M	�u���A�)*

Training_loss-0�A4
�$       B+�M	��u���A�)*

Training_lossM�A����$       B+�M	GY�u���A�)*

Training_loss��A��$       B+�M	�skv���A�)*

Training_losstΌA�Ku7$       B+�M	Eb�v���A�)*

Training_loss�tA�5�$       B+�M	��Vw���A�)*

Training_loss�1�A�[$       B+�M	��w���A�)*

Training_loss�AJA�y'�$       B+�M	�>Cx���A�)*

Training_loss��AV���$       B+�M	�E�x���A�)*

Training_loss���A��(>$       B+�M	�%y���A�)*

Training_loss���As��^$       B+�M	"��y���A�)*

Training_loss�9HAe�WX$       B+�M	ް	z���A�)*

Training_lossgy�A��4$       B+�M	@�zz���A�)*

Training_lossŘ�A<T�T$       B+�M	���z���A�)*

Training_loss���A�6s$       B+�M	g�h{���A�)*

Training_loss���A2���$       B+�M	΍�{���A�)*

Training_loss���A�>I*       ����	�P�|���A�)*

Validation_accuracy#"U?C�H&       sO� 	mS�|���A�)*

Validation_loss�8BXI��$       B+�M	��g����A�)*

Training_lossJ��Aρ5$       B+�M	} �����A�)*

Training_lossF��Ac�5p$       B+�M	F^b����A�)*

Training_loss��Az7�$       B+�M	�1؂���A�)*

Training_loss!&�A���$       B+�M	>P����A�)*

Training_loss�gAW�$�$       B+�M	�Vƃ���A�)*

Training_loss��hAXRO�$       B+�M	�'@����A�)*

Training_loss�tA��"w$       B+�M	�������A�)*

Training_loss��A����$       B+�M	>Y%����A�)*

Training_loss��A�=�$       B+�M	<�����A�)*

Training_loss5�A����$       B+�M	{�����A�)*

Training_lossPHAc%��$       B+�M	j�w����A�)*

Training_lossf��A�0b�$       B+�M	�*놈��A�)*

Training_lossݜ�A}�x_$       B+�M	�]����A�)*

Training_lossJz�A��D$       B+�M	�v҇���A�)*

Training_loss��=A�Ѓ$       B+�M	�oD����A�)*

Training_loss ��A&Q�4$       B+�M	:"�����A�)*

Training_loss��AT	�&$       B+�M	-\7����A�)*

Training_loss�5�Au��$       B+�M	=�����A�)*

Training_lossn*�A!�$       B+�M	Ҧ����A�)*

Training_loss���A��f$       B+�M	�vf����A�)*

Training_lossƽ�A��~�$       B+�M	��ϊ���A�)*

Training_loss��A��_�$       B+�M	�RD����A�)*

Training_loss'�qA��x$       B+�M	?S�����A�)*

Training_loss�� BH+�$       B+�M	�ME����A�)*

Training_loss0�A�R��$       B+�M	�cȌ���A�**

Training_lossv��Aot<G$       B+�M	�0����A�**

Training_lossJ'�AS��$       B+�M	�������A�**

Training_lossܙA�,��$       B+�M	�r�����A�**

Training_loss>S�A��`h$       B+�M	UP^����A�**

Training_loss���A�s�$       B+�M	&������A�**

Training_loss\u�A��j�$       B+�M	j�?����A�**

Training_lossmH�A���$       B+�M	L�Ǐ���A�**

Training_loss�Ad�$       B+�M	hwH����A�**

Training_lossn�A��~$       B+�M	4�ʐ���A�**

Training_lossv��A}���$       B+�M	K\K����A�**

Training_loss���A`M$       B+�M	�s͑���A�**

Training_loss���A]5E�$       B+�M	E�N����A�**

Training_loss6k�A�\�$       B+�M	f�ϒ���A�**

Training_loss��A�Oi�$       B+�M	�U����A�**

Training_loss��AwѪ$       B+�M	�ʓ���A�**

Training_loss�+�A�vkl$       B+�M	GE����A�**

Training_losshm�Aۗ��$       B+�M	��ɔ���A�**

Training_loss��qA��=�$       B+�M	)�M����A�**

Training_loss�ӐAsYA$       B+�M	Y�ϕ���A�**

Training_lossql�A��r$       B+�M	��S����A�**

Training_lossd�AƯ�g$       B+�M	{�ٖ���A�**

Training_loss��A$o�$       B+�M	Z�Y����A�**

Training_loss�<�A�Ğv$       B+�M	͗���A�**

Training_lossx3�A��$       B+�M	�F����A�**

Training_loss�gA�^��*       ����	�#����A�**

Validation_accuracy��T?��+c&       sO� 	m�#����A�**

Validation_lossx�9B��ج$       B+�M	'�����A�**

Training_loss<�A'Ztt$       B+�M	�������A�**

Training_loss�gB	qż$       B+�M	n����A�**

Training_loss���A����$       B+�M	-������A�**

Training_losss>�A����$       B+�M	�����A�**

Training_loss���A�.G8$       B+�M	a�����A�**

Training_loss�v�AJ޲$       B+�M	�������A�**

Training_loss��A���$       B+�M	ans����A�**

Training_loss�}�A���#$       B+�M	(*ꠈ��A�**

Training_loss�X�Ai$�2$       B+�M	��`����A�**

Training_losss/�A�
S5$       B+�M	S�ء���A�**

Training_loss�k�A���T$       B+�M	>�R����A�**

Training_loss��Ao�$       B+�M	,ʢ���A�**

Training_lossB��A2~h$       B+�M	��L����A�**

Training_loss�G]A��7�$       B+�M	Ee�����A�**

Training_losst�A�S��$       B+�M	�m>����A�**

Training_loss5�A߿��$       B+�M	e߱����A�**

Training_lossT��A$��$       B+�M	�(����A�**

Training_loss��A0��$       B+�M	�[�����A�**

Training_loss�A`ZWp$       B+�M	jP����A�**

Training_loss�x�Aه�$       B+�M	d�����A�**

Training_loss��A�bt$       B+�M	��
����A�**

Training_lossy9~ApI�$       B+�M	j}����A�**

Training_loss>��A1Gc�$       B+�M	�N杻��A�**

Training_loss\��A�$       B+�M	{�c����A�**

Training_lossߙ>ABr$       B+�M	�[ب���A�**

Training_lossvfzA8t�($       B+�M	1�J����A�**

Training_loss���AW	s�$       B+�M	������A�**

Training_loss�Ad��$       B+�M	�1����A�**

Training_loss�p�A����$       B+�M	E�����A�**

Training_loss�}�Ax�)$       B+�M	�5����A�**

Training_loss�-AYC�'$       B+�M	�:�����A�**

Training_loss�`A���$       B+�M	S�����A�**

Training_loss�m�AB=7$       B+�M	v������A�**

Training_loss�P�AÄ�$       B+�M	:�����A�**

Training_loss��EA0���$       B+�M	}�t����A�**

Training_lossޯ�A��0�$       B+�M	�����A�**

Training_losso�AS�`$       B+�M	�gp����A�**

Training_loss\��A����$       B+�M	�?���A�**

Training_loss���AKZ\�$       B+�M	�Du����A�**

Training_loss�*�A��$       B+�M	Ϣ믈��A�**

Training_loss�ʇA�mEb$       B+�M	 h����A�**

Training_loss,$�A���h$       B+�M	S�簈��A�**

Training_loss��A^���$       B+�M	�k����A�**

Training_loss
�A"�1j$       B+�M	EH걈��A�**

Training_lossV�A�_$       B+�M	g�a����A�**

Training_loss�vA�g��$       B+�M	5�ز���A�**

Training_loss�|�A͋�$       B+�M	��O����A�**

Training_loss��kA�.�$       B+�M	rnҳ���A�**

Training_loss���A�ޟ1$       B+�M	�*N����A�**

Training_loss�>�Aǎ��*       ����	iF����A�**

Validation_accuracy��T?&�)�&       sO� 	LkF����A�**

Validation_lossѐ:B���R$       B+�M	�2[����A�**

Training_loss�B�A�cΐ$       B+�M	5�չ���A�**

Training_loss���A�,0|$       B+�M	�	I����A�**

Training_loss@k�A�y�.$       B+�M	:z�����A�**

Training_lossQ�A擙$       B+�M	��3����A�**

Training_loss\��AU���$       B+�M	�Ĥ����A�**

Training_loss5KAȂ��$       B+�M	w�����A�**

Training_loss �Ar��$       B+�M	�8�����A�**

Training_lossfv�Aǭ�s$       B+�M	�>����A�**

Training_loss��A?J.P$       B+�M	[�|����A�**

Training_loss�-�A�M��$       B+�M	�B�����A�**

Training_lossS��AZ���$       B+�M	8�l����A�**

Training_loss�cA8¿�$       B+�M	�侈��A�**

Training_loss"NFA�&F"$       B+�M	�[����A�**

Training_loss�a�A�k�$       B+�M	��ݿ���A�**

Training_loss��A�s�%$       B+�M	�Y����A�**

Training_loss�T�A�i,�$       B+�M	֏�����A�**

Training_lossf@�AĨ8�$       B+�M	��C����A�**

Training_lossk��A��:Y$       B+�M	H������A�**

Training_lossӘ�A�7k�$       B+�M	��,��A�**

Training_loss��rA�|�i$       B+�M	�	���A�**

Training_lossRe�A��$       B+�M	j�È��A�**

Training_loss[�NA�j $       B+�M	���È��A�**

Training_lossǻAy<�$       B+�M	@�Ĉ��A�**

Training_loss$}OA���$       B+�M	�5�Ĉ��A�**

Training_loss�$wA��,�$       B+�M	e��Ĉ��A�**

Training_loss���A�t<2$       B+�M	�zň��A�**

Training_loss.G�A���U$       B+�M	���ň��A�**

Training_loss�b�AJ�$       B+�M	��lƈ��A�**

Training_loss�O�Aq�*W$       B+�M	#�ƈ��A�**

Training_lossvv�Aq�j�$       B+�M	.�aǈ��A�**

Training_lossz�A�M�	$       B+�M	��ǈ��A�**

Training_loss���A&}�$       B+�M	~VkȈ��A�**

Training_losssK�A�K�$       B+�M	�+�Ȉ��A�**

Training_loss�SbA�<�$       B+�M	�BuɈ��A�**

Training_loss���AF.\\$       B+�M	��Ɉ��A�**

Training_lossąpA���$       B+�M	s�oʈ��A�**

Training_loss�yWA��ھ$       B+�M	+k�ʈ��A�**

Training_loss׻zA��U$       B+�M	�cˈ��A�**

Training_loss{�A�p/$       B+�M	|`�ˈ��A�**

Training_loss�R�AG��W$       B+�M	� Ẅ��A�**

Training_loss�ڍA�T��$       B+�M	U��̈��A�**

Training_loss��JA�/$       B+�M	 <N͈��A�**

Training_lossn�yA5*��$       B+�M	0�͈��A�**

Training_lossJ�A�3"$       B+�M	Q�BΈ��A�**

Training_loss�YfA
.�$       B+�M	�	�Έ��A�**

Training_loss��&A�4��$       B+�M	�0?ψ��A�**

Training_loss�yA
D��$       B+�M	�ψ��A�**

Training_lossb}�A�7�$       B+�M	�4Ј��A�**

Training_loss&��A��o�$       B+�M	�r�Ј��A�**

Training_loss��Aº��*       ����	�(�ш��A�**

Validation_accuracyxwU?��A&       sO� 	�-�ш��A�**

Validation_lossp6B!�#�$       B+�M	���Ո��A�**

Training_loss�A��^$       B+�M	�T@ֈ��A�**

Training_loss�qAޱ��$       B+�M	�f�ֈ��A�**

Training_loss���A-E�$       B+�M	<i>׈��A�+*

Training_loss:�A�⮫$       B+�M	�3�׈��A�+*

Training_loss�p�A�
,C$       B+�M	/؈��A�+*

Training_loss���Act@$       B+�M	L¥؈��A�+*

Training_loss��A�ޙX$       B+�M	%�و��A�+*

Training_lossD��A�˭�$       B+�M	�@�و��A�+*

Training_loss`�A�)�_$       B+�M	d"
ڈ��A�+*

Training_loss���AĮc$       B+�M	�~ڈ��A�+*

Training_loss��jA�i>$       B+�M	!��ڈ��A�+*

Training_lossĒ�A���$       B+�M	X�fۈ��A�+*

Training_lossP�{A�\3�$       B+�M	ϡ�ۈ��A�+*

Training_loss��A� ��$       B+�M	,�J܈��A�+*

Training_loss��!A�1+z$       B+�M	М�܈��A�+*

Training_loss�EwAai$       B+�M	�H݈��A�+*

Training_losso�hACe�$       B+�M	,(�݈��A�+*

Training_loss 9�Aﱚ�$       B+�M	֭,ވ��A�+*

Training_loss ��A�ɉ�$       B+�M	'��ވ��A�+*

Training_lossB��A��$       B+�M	R��ވ��A�+*

Training_loss���AZ�9$       B+�M	B�o߈��A�+*

Training_lossf�`A³��$       B+�M	��߈��A�+*

Training_loss`A�AZ瞷$       B+�M	�6����A�+*

Training_loss��ALt��$       B+�M	�����A�+*

Training_losso�B�H]I$       B+�M	"������A�+*

Training_loss3�A�S4,$       B+�M	m7Q���A�+*

Training_lossߦB3��&$       B+�M	������A�+*

Training_loss�d�AS�y�$       B+�M	�
���A�+*

Training_loss0�A�,�i$       B+�M	�e���A�+*

Training_lossQA���&$       B+�M	�@����A�+*

Training_loss:�xA���$       B+�M	��6���A�+*

Training_lossA��A-��$       B+�M	�-����A�+*

Training_lossp��AZ?t$       B+�M	M-����A�+*

Training_loss���A<'�$       B+�M	2�W���A�+*

Training_lossP�xA�ېE$       B+�M	�����A�+*

Training_loss�ջAɡ��$       B+�M	����A�+*

Training_loss���AS*^�$       B+�M	H����A�+*

Training_lossk {Av���$       B+�M	����A�+*

Training_loss]8�A�L	�$       B+�M	W^����A�+*

Training_loss�
�AN�m�$       B+�M		Q$���A�+*

Training_loss�L?Ap�"$       B+�M	ͯ����A�+*

Training_loss�H�A�(ҁ$       B+�M		�0���A�+*

Training_loss}֗A�*��$       B+�M	9����A�+*

Training_losso�A����$       B+�M	?���A�+*

Training_loss�=�A���$       B+�M	������A�+*

Training_lossp�Ah��O$       B+�M	�d'���A�+*

Training_lossvggA��$       B+�M	�����A�+*

Training_lossDqA���y$       B+�M	�����A�+*

Training_loss2��A�4��$       B+�M	�[����A�+*

Training_loss��A��{*       ����	�y���A�+*

Validation_accuracy��T?GI��&       sO� 	R�y���A�+*

Validation_loss�9B��{$       B+�M	|������A�+*

Training_lossVn�Aw\Q$       B+�M	�D&���A�+*

Training_lossߎ�A��+$       B+�M	�ՠ���A�+*

Training_lossp�AҨN�$       B+�M	�����A�+*

Training_loss�Aÿ�$       B+�M	D����A�+*

Training_loss��A429\$       B+�M	S[���A�+*

Training_lossZ��Aћ��$       B+�M	�[y���A�+*

Training_loss��A�7�~$       B+�M	_�����A�+*

Training_lossz�Al��$       B+�M	�Zs���A�+*

Training_loss_.�A�Y$�$       B+�M	&W����A�+*

Training_loss>��Aǒ�;$       B+�M	\`����A�+*

Training_lossn�A�͑h$       B+�M	�������A�+*

Training_loss.B�A ]�$       B+�M	׽N����A�+*

Training_lossw��A�{$       B+�M	V�����A�+*

Training_loss�d�A}���$       B+�M	��7����A�+*

Training_loss.�{A�YZ-$       B+�M	xA�����A�+*

Training_loss4�A�$       B+�M	/#����A�+*

Training_loss�u�AQ��$       B+�M	Fӗ����A�+*

Training_loss.�AK�+$       B+�M	�:����A�+*

Training_lossr�A�j�$       B+�M	֐�����A�+*

Training_loss�B�AƎ?�$       B+�M	�����A�+*

Training_lossN�^A��h�$       B+�M	t�{����A�+*

Training_loss�\�A	p�$       B+�M	/n�����A�+*

Training_loss��A��I$       B+�M	�o����A�+*

Training_loss��AԌ'�$       B+�M	�W�����A�+*

Training_loss�&�A~�~$       B+�M	��Y����A�+*

Training_loss�MAAB��$       B+�M	^������A�+*

Training_loss�1�A�.�/$       B+�M	QG����A�+*

Training_loss�{�A���$       B+�M	�ɼ����A�+*

Training_loss��FA�m|$       B+�M	�<����A�+*

Training_loss�A�K,o$       B+�M	�������A�+*

Training_loss �BF)��$       B+�M	`x>����A�+*

Training_loss��|A��$       B+�M	������A�+*

Training_loss̢sA�R͙$       B+�M	0�) ���A�+*

Training_loss_�bA�G�C$       B+�M	^� ���A�+*

Training_loss�xwA�w�E$       B+�M	�����A�+*

Training_loss�eA�k��$       B+�M	�����A�+*

Training_lossp�A�C$       B+�M	�����A�+*

Training_loss��A��5�$       B+�M	3�w���A�+*

Training_loss�j�A����$       B+�M	L�����A�+*

Training_loss�A�A+���$       B+�M	�ob���A�+*

Training_loss���A��$       B+�M	������A�+*

Training_lossJjeAȳ$       B+�M	�Q���A�+*

Training_loss��_A�)�$       B+�M	������A�+*

Training_loss���A�($       B+�M	P=���A�+*

Training_lossvјA>�'$       B+�M	5
����A�+*

Training_loss�h�A���$       B+�M	�'���A�+*

Training_loss���A���$       B+�M	�ǝ���A�+*

Training_loss��8A![�m$       B+�M	����A�+*

Training_loss)zA��=$       B+�M	�9����A�+*

Training_lossr�CA_n�5*       ����	�m����A�+*

Validation_accuracy#"U?�Ő�&       sO� 	�q����A�+*

Validation_loss��9B{���$       B+�M	�E����A�+*

Training_loss��^Aڍ�~$       B+�M	�@(���A�+*

Training_loss���A�hs$       B+�M	�%����A�+*

Training_loss��A@���$       B+�M	�}���A�+*

Training_loss�q�A�k��$       B+�M	������A�+*

Training_lossI��Ae#[�$       B+�M	tb���A�+*

Training_loss%dJA�{}$       B+�M	�wy���A�+*

Training_loss-P�A���n$       B+�M	������A�+*

Training_loss���A>�$$       B+�M	m�i���A�+*

Training_loss_��A�u�$       B+�M	�0����A�+*

Training_lossD�zA�c*�$       B+�M	�X���A�+*

Training_lossֆA#��$       B+�M	������A�+*

Training_loss$՞AQr1Y$       B+�M	��G���A�+*

Training_loss��TAw�]$       B+�M	�n����A�+*

Training_loss"}�A�+�S$       B+�M	�
6���A�+*

Training_loss�z�Ae���$       B+�M	�����A�+*

Training_loss�ΏAX�Đ$       B+�M	ǂ'���A�+*

Training_loss�j�AXM��$       B+�M	pa����A�+*

Training_loss�Bw�i�$       B+�M	�A���A�+*

Training_loss��gA�L�%$       B+�M	�����A�+*

Training_loss�zTAw2Rb$       B+�M	����A�+*

Training_loss��AjL]$       B+�M	�����A�+*

Training_loss�fAN�W�$       B+�M	U����A�+*

Training_loss�AF�J�$       B+�M	bv���A�+*

Training_loss�_\A+�'�$       B+�M	�����A�+*

Training_loss��A��O$       B+�M	�$p���A�+*

Training_loss�ZA�!M�$       B+�M	������A�+*

Training_loss��;A퍻�$       B+�M	�b\���A�+*

Training_loss�;A1�͛$       B+�M	������A�+*

Training_loss6��A���$       B+�M	�TF���A�+*

Training_loss�p�AԻ��$       B+�M	H6����A�+*

Training_loss���Aܜ�$       B+�M	V�/���A�,*

Training_loss3ѸAF#�l$       B+�M	h�����A�,*

Training_loss��A�m��$       B+�M	]����A�,*

Training_loss��AF[��$       B+�M	ޭ����A�,*

Training_loss��kA��;$       B+�M	�����A�,*

Training_loss(6AZ�ƚ$       B+�M	 {���A�,*

Training_loss��AP�۟$       B+�M	!�����A�,*

Training_loss��hAա=B$       B+�M	��f���A�,*

Training_loss��A���$       B+�M	%X����A�,*

Training_loss�Q�A�p0$       B+�M	3�Q���A�,*

Training_loss�X�AJ��$       B+�M	������A�,*

Training_lossg�A���c$       B+�M	��: ���A�,*

Training_loss�� A�^$       B+�M	�r� ���A�,*

Training_loss�/�AFXa�$       B+�M	R�%!���A�,*

Training_loss)4AN�{$       B+�M	35�!���A�,*

Training_loss���A���!$       B+�M	�3"���A�,*

Training_loss^]�A3��3$       B+�M	��"���A�,*

Training_loss�]A��V�$       B+�M	Me�"���A�,*

Training_loss�&RA��
�$       B+�M	�(u#���A�,*

Training_loss�~CA(��*       ����	�g$���A�,*

Validation_accuracy#"U?�=k&       sO� 	o�g$���A�,*

Validation_loss��9BA�9$       B+�M	�x(���A�,*

Training_loss���Aܙ�}$       B+�M	��(���A�,*

Training_loss���A�`��$       B+�M	#g)���A�,*

Training_loss=�A^i-$       B+�M	L��)���A�,*

Training_loss02ZA+��<$       B+�M	�0[*���A�,*

Training_loss6D�Aq�7�$       B+�M	(��*���A�,*

Training_lossi�A��r$       B+�M	w�E+���A�,*

Training_lossm�AD�mT$       B+�M	}=�+���A�,*

Training_lossx��Aa#u$       B+�M	M�.,���A�,*

Training_loss���A�h�$       B+�M	��,���A�,*

Training_loss�=�Af�)F$       B+�M	D-���A�,*

Training_lossN�zA��8�$       B+�M	��-���A�,*

Training_loss���AL4��$       B+�M	���-���A�,*

Training_loss�B�A��5y$       B+�M	js.���A�,*

Training_loss�RxA��r�$       B+�M	���.���A�,*

Training_loss$o�AŜ��$       B+�M	�>[/���A�,*

Training_loss�Q�A�H�g$       B+�M	c��/���A�,*

Training_loss��An-;�$       B+�M	l�C0���A�,*

Training_loss���A�1')$       B+�M	䆹0���A�,*

Training_lossFmyAj��$       B+�M	N�91���A�,*

Training_loss���A��5�$       B+�M	WC�1���A�,*

Training_loss�xA��$       B+�M	r4#2���A�,*

Training_loss���A��$       B+�M	'�2���A�,*

Training_lossJ�Ae�$       B+�M	iR3���A�,*

Training_loss�vA�j�5$       B+�M	��3���A�,*

Training_loss���A��k $       B+�M	��3���A�,*

Training_lossw gA),I8$       B+�M	�=m4���A�,*

Training_lossP5Aȉ�$       B+�M	�D�4���A�,*

Training_loss�i�A�տ�$       B+�M	��V5���A�,*

Training_loss���A��x�$       B+�M	/��5���A�,*

Training_lossCĄAZ�;$       B+�M	V�@6���A�,*

Training_lossj�At�$       B+�M	T9�6���A�,*

Training_lossvt�ACS��$       B+�M	�+7���A�,*

Training_loss��A�I��$       B+�M	�d�7���A�,*

Training_loss��A����$       B+�M	58���A�,*

Training_loss���AϢ6%$       B+�M	8�8���A�,*

Training_loss�A�A1�;W$       B+�M	�8���A�,*

Training_lossz�A�5�$       B+�M	�s9���A�,*

Training_losso[�A�K�^$       B+�M	{��9���A�,*

Training_loss���Ad��L$       B+�M	�{u:���A�,*

Training_lossd��A��y:$       B+�M	���:���A�,*

Training_lossG��A��)�$       B+�M	(a;���A�,*

Training_loss,�A�\`$       B+�M	<��;���A�,*

Training_loss��A�9��$       B+�M	�I<���A�,*

Training_loss�Y�A�d�$       B+�M	�Ͼ<���A�,*

Training_loss��!A��XY$       B+�M	�3=���A�,*

Training_loss�j^A�M�$       B+�M	幭=���A�,*

Training_loss�ېA�4c_$       B+�M	��#>���A�,*

Training_lossn�{A/-�>$       B+�M	F�>���A�,*

Training_loss뛋A&�|$       B+�M	��(?���A�,*

Training_lossD	�A�N�*       ����	�XS@���A�,*

Validation_accuracyxwU?7�T&       sO� 	^S@���A�,*

Validation_lossxn8B4�2�$       B+�M	���D���A�,*

Training_lossv?�A7�$       B+�M	&<E���A�,*

Training_loss;l�A��.�$       B+�M	���E���A�,*

Training_loss*E�Ab"%�$       B+�M	��F���A�,*

Training_loss�|A��r�$       B+�M	B	lF���A�,*

Training_lossx�}Az~�%$       B+�M	��F���A�,*

Training_loss��yA�WI1$       B+�M	rO-G���A�,*

Training_loss+�/A�CM$       B+�M	=*�G���A�,*

Training_loss��A��w�$       B+�M	�~�G���A�,*

Training_loss��3A�&Xn$       B+�M	�dH���A�,*

Training_loss+�A����$       B+�M	���H���A�,*

Training_loss�bbA&�vR$       B+�M	^�=I���A�,*

Training_loss���A���$$       B+�M	���I���A�,*

Training_lossWoXA�$       B+�M	_bJ���A�,*

Training_loss��qA�ih$       B+�M	��cJ���A�,*

Training_loss�<�A�"is$       B+�M	;��J���A�,*

Training_lossS�A~"ù$       B+�M	g�#K���A�,*

Training_lossu��AY˕�$       B+�M	��K���A�,*

Training_lossL�AV/0$       B+�M	��K���A�,*

Training_loss;��A@���$       B+�M	�FL���A�,*

Training_loss#U�AT�Y$       B+�M	���L���A�,*

Training_loss65hA�D@�$       B+�M	<M���A�,*

Training_loss��,AM/�:$       B+�M	�mtM���A�,*

Training_loss0��Af�$       B+�M	h=�M���A�,*

Training_loss.{�A��$       B+�M	��1N���A�,*

Training_loss�c�A�⎈$       B+�M	n��N���A�,*

Training_loss+(�A��n$       B+�M	�)�N���A�,*

Training_loss *Aw>�$       B+�M	�^QO���A�,*

Training_loss���A�
�&$       B+�M	M�O���A�,*

Training_loss�E�A]H��$       B+�M	�D*P���A�,*

Training_loss͚�A��b{$       B+�M	��P���A�,*

Training_loss2d�AِW�$       B+�M	���P���A�,*

Training_lossږ-An�P�$       B+�M	�kVQ���A�,*

Training_loss&��AVb$       B+�M	6��Q���A�,*

Training_loss�t�A�Ug$       B+�M	U�1R���A�,*

Training_loss���A)N$       B+�M	�.�R���A�,*

Training_losswB0A�B$       B+�M	�R���A�,*

Training_loss|a�AW唸$       B+�M	�(\S���A�,*

Training_loss �A@�[$       B+�M	XS�S���A�,*

Training_loss��A�f�g$       B+�M	mT���A�,*

Training_lossq�A�,�$       B+�M	��T���A�,*

Training_loss���A-?$       B+�M	�pvU���A�,*

Training_loss�%A�T�T$       B+�M	@��U���A�,*

Training_loss�*@A`�v�$       B+�M	�vnV���A�,*

Training_loss� �Ad@�$       B+�M	�R�V���A�,*

Training_loss��A��a/$       B+�M	�`W���A�,*

Training_loss'&�A���$       B+�M	0��W���A�,*

Training_loss;gA�j�\$       B+�M	
/SX���A�,*

Training_loss��A��)$       B+�M	 ��X���A�,*

Training_lossb}A�2P�$       B+�M	Q�AY���A�,*

Training_loss.��A(5^*       ����	��EZ���A�,*

Validation_accuracy��T?];V�&       sO� 	FZ���A�,*

Validation_loss��<B�o�$       B+�M	A^���A�,*

Training_loss��LA+P�$       B+�M	x_���A�,*

Training_loss��nAgo��$       B+�M	=
x_���A�,*

Training_loss���A�>�y$       B+�M	^��_���A�,*

Training_loss�"�A}-#$       B+�M	Ti`���A�,*

Training_lossv�2Ah ��$       B+�M	�f�`���A�,*

Training_loss(3�AԨ�$       B+�M	�HXa���A�,*

Training_lossą[Aߌ$       B+�M	 ��a���A�,*

Training_loss���A����$       B+�M	&7Gb���A�,*

Training_loss�ʍA���[$       B+�M	�Ͼb���A�-*

Training_loss �CA(��$       B+�M	�:7c���A�-*

Training_lossL}�A��;$       B+�M	���c���A�-*

Training_loss5�A!�K�$       B+�M	�*d���A�-*

Training_loss\�oA#� �$       B+�M	��d���A�-*

Training_lossN%�A���$       B+�M	r4e���A�-*

Training_loss�guA ��$       B+�M	Vғe���A�-*

Training_loss2��A�ܙ�$       B+�M	�
f���A�-*

Training_lossP�)A#�i�$       B+�M	Q��f���A�-*

Training_loss�A�N�$       B+�M	r��f���A�-*

Training_lossp�DA���$       B+�M	�szg���A�-*

Training_loss^@�A��$       B+�M	� h���A�-*

Training_loss�sA�KC<$       B+�M	�0�h���A�-*

Training_loss�#xAsjɱ$       B+�M	���h���A�-*

Training_lossV�A�z�$       B+�M	<��i���A�-*

Training_loss��AK=�$       B+�M	c{j���A�-*

Training_lossjb�A�q$       B+�M	�6�j���A�-*

Training_lossa-yA��Pt$       B+�M	�/k���A�-*

Training_lossw�A^ѷ�$       B+�M	�Z�k���A�-*

Training_loss.(�A��}$       B+�M	�b8l���A�-*

Training_loss�ӖAy�s2$       B+�M	���l���A�-*

Training_lossw�A���9$       B+�M	I�Hm���A�-*

Training_loss�a�A�v�_$       B+�M	ۧ�m���A�-*

Training_loss�f�ATjX�$       B+�M	�rKn���A�-*

Training_lossp�A�W��$       B+�M	���n���A�-*

Training_loss���A�u�$       B+�M	�Qo���A�-*

Training_loss��rA����$       B+�M	��o���A�-*

Training_lossV�A�:h$       B+�M	��Vp���A�-*

Training_loss:��A]4��$       B+�M	{��p���A�-*

Training_lossRu$A�4l$       B+�M	�cq���A�-*

Training_lossC�YA�K$       B+�M	��q���A�-*

Training_loss��AWəo$       B+�M	�t_r���A�-*

Training_loss��A��A�$       B+�M	��r���A�-*

Training_lossJXkA��N�$       B+�M	��Ss���A�-*

Training_loss�A}�-F$       B+�M	" �s���A�-*

Training_lossA�{A�~//$       B+�M	�Vt���A�-*

Training_lossښ"A}q�`$       B+�M	g��t���A�-*

Training_lossc�IA	9L$       B+�M	j�cu���A�-*

Training_loss܍AM�$       B+�M	E�u���A�-*

Training_loss�=�A��-$       B+�M	<0nv���A�-*

Training_loss��|Ap��D$       B+�M	��v���A�-*

Training_loss�g�A_���*       ����	��w���A�-*

Validation_accuracy#"U?��@&       sO� 	χ�w���A�-*

Validation_loss?B���A$       B+�M	�_|���A�-*

Training_lossW6�A�(�_$       B+�M	��|���A�-*

Training_loss<VA�߈$       B+�M	��S}���A�-*

Training_lossE�7A��$       B+�M	��}���A�-*

Training_loss�A"�%�$       B+�M	\�,~���A�-*

Training_lossZt�A�^��$       B+�M	7��~���A�-*

Training_lossT�VA�$       B+�M	ϡ���A�-*

Training_loss"O*A���2$       B+�M	�a���A�-*

Training_loss�@`A�s�/$       B+�M	�_����A�-*

Training_loss� 9A��'�$       B+�M	>$����A�-*

Training_lossƊ�A�@�y$       B+�M	A�w����A�-*

Training_loss��A1B$       B+�M	!�Հ���A�-*

Training_lossvލAo�E$       B+�M	�O>����A�-*

Training_loss8b�A��j$       B+�M	Gơ����A�-*

Training_lossಛA;ʳh$       B+�M	�/����A�-*

Training_loss�gHA����$       B+�M	��b����A�-*

Training_loss���A��M�$       B+�M	��ǂ���A�-*

Training_loss���A��$       B+�M	��)����A�-*

Training_lossFesA�ˡf$       B+�M	>Α����A�-*

Training_lossv�ALُ�$       B+�M	t�����A�-*

Training_loss��A��$       B+�M	0�m����A�-*

Training_loss|s�A�K,$       B+�M	�������A�-*

Training_lossT�9A�U1$       B+�M	��]����A�-*

Training_loss�A$G$       B+�M	ͅ���A�-*

Training_loss6�A��$       B+�M	M�G����A�-*

Training_lossʜAّ�$       B+�M	R߆���A�-*

Training_loss �ZA�)w�$       B+�M	�i����A�-*

Training_lossv�A�&�$       B+�M	�������A�-*

Training_loss��BAFnG$       B+�M	.7����A�-*

Training_loss>@A���/$       B+�M	~n����A�-*

Training_loss�/9A��,)$       B+�M	T������A�-*

Training_loss�tA6�� $       B+�M	�
����A�-*

Training_loss=@2A��x$       B+�M	�C�����A�-*

Training_loss^5�A�[��$       B+�M	(������A�-*

Training_lossN��A�v\$       B+�M	�kp����A�-*

Training_loss�mWA�g@�$       B+�M	��苉��A�-*

Training_loss�dA9]h$       B+�M	'.a����A�-*

Training_lossL�WA���$       B+�M	W�֌���A�-*

Training_loss���A�a�$       B+�M	P7R����A�-*

Training_losse3�A"S�$       B+�M	��ȍ���A�-*

Training_loss���A��m_$       B+�M	��>����A�-*

Training_loss�tVAO�h$       B+�M	�V���A�-*

Training_lossx(�A�ƅ�$       B+�M	��F����A�-*

Training_loss$�A��z�$       B+�M	mÏ���A�-*

Training_loss4��A�0$       B+�M	_=����A�-*

Training_loss��A�c�l$       B+�M	ر����A�-*

Training_loss��9A��UA$       B+�M	(����A�-*

Training_lossr�CA���$       B+�M	�D�����A�-*

Training_loss@�^A���&$       B+�M	.7����A�-*

Training_loss�4�Ar��8$       B+�M	I�����A�-*

Training_loss�;�A�*       ����	Ή�����A�-*

Validation_accuracy��T?/Q!&       sO� 	%������A�-*

Validation_loss�:B�� $       B+�M	/����A�-*

Training_loss(�A�\�$       B+�M	m�y����A�-*

Training_loss��A��?7$       B+�M	1[��A�-*

Training_loss|1EA2]E$       B+�M	��f����A�-*

Training_loss�PA<���$       B+�M	�Mޙ���A�-*

Training_loss�A�A�=�
$       B+�M	�m[����A�-*

Training_loss��;AWa	r$       B+�M	�}⚉��A�-*

Training_loss�4�A�!��$       B+�M	�c����A�-*

Training_loss���A�abo$       B+�M	��䛉��A�-*

Training_loss��ZA�H��$       B+�M	�6\����A�-*

Training_lossd�A�Z0$       B+�M	�М���A�-*

Training_loss�!2A��W�$       B+�M	��K����A�-*

Training_loss��kA>�x$       B+�M	�������A�-*

Training_loss���A*�Z�$       B+�M	��<����A�-*

Training_loss���A�`��$       B+�M	#,�����A�-*

Training_loss�q�A�\,$       B+�M	�F,����A�-*

Training_loss���AI~��$       B+�M	Ƥ�����A�-*

Training_loss��A,H�-$       B+�M	��&����A�-*

Training_loss�/A{���$       B+�M	̙�����A�-*

Training_loss<�A��ֺ$       B+�M	<l2����A�-*

Training_loss�+tA�ׄs$       B+�M	�.�����A�-*

Training_loss �ZA����$       B+�M	��K����A�-*

Training_loss7�,A�G\�$       B+�M	bѢ���A�-*

Training_loss�sCA�!�$       B+�M	q�S����A�-*

Training_loss��eA�T�$       B+�M	��ף���A�-*

Training_loss�A$�|_$       B+�M	|(Y����A�-*

Training_loss^#�A+䅥$       B+�M	�Ѥ���A�-*

Training_loss$�-AC��$       B+�M	��G����A�-*

Training_loss̭�A4Ds�$       B+�M	�������A�-*

Training_loss܌�A�q$       B+�M	9�?����A�-*

Training_loss3A^!�$       B+�M	�aƦ���A�-*

Training_loss/��A2��@$       B+�M	`K����A�-*

Training_loss�܉A����$       B+�M	a3ʧ���A�-*

Training_loss���A�_�'$       B+�M	s�E����A�-*

Training_loss�&�A�^$       B+�M	�Ｈ���A�-*

Training_loss�oA�}�S$       B+�M	�X3����A�-*

Training_loss���A����$       B+�M	M�����A�-*

Training_loss�4\A�A$       B+�M	�;#����A�.*

Training_loss���A�y/$       B+�M	�������A�.*

Training_loss*��A��d$       B+�M	��
����A�.*

Training_loss��A���$       B+�M	(񂫉��A�.*

Training_lossdqiA9�_�$       B+�M	,������A�.*

Training_lossSA'�@�$       B+�M	!Zo����A�.*

Training_loss�s�A����$       B+�M	D欉��A�.*

Training_loss
�A��E$       B+�M	�\����A�.*

Training_loss�gA�ҟ $       B+�M	sIӭ���A�.*

Training_loss��A]	_
$       B+�M	)zJ����A�.*

Training_loss��A�佹$       B+�M	gG�����A�.*

Training_loss9��Ai���$       B+�M	b�7����A�.*

Training_loss��zA�s7$       B+�M	�������A�.*

Training_loss��MA��3�*       ����	�*�����A�.*

Validation_accuracy#"U?��i�&       sO� 	f-�����A�.*

Validation_lossm2:Bh�DQ$       B+�M	�z����A�.*

Training_loss
��A��J6$       B+�M	�������A�.*

Training_loss0�A���C$       B+�M	��$����A�.*

Training_lossZ�AQ�)O$       B+�M	�:�����A�.*

Training_loss�P�A*5�$       B+�M	��0����A�.*

Training_loss��-AŔ]6$       B+�M	������A�.*

Training_losse��A`�}c$       B+�M	UC����A�.*

Training_lossyA��>$       B+�M	@Lȸ���A�.*

Training_loss$6nA�9Ȼ$       B+�M	$cJ����A�.*

Training_loss��A����$       B+�M	�
˹���A�.*

Training_loss�:A�� $       B+�M	�vO����A�.*

Training_lossX˧Awф$       B+�M	J$κ���A�.*

Training_loss�{�A�W�$       B+�M	:Z����A�.*

Training_lossn]&A�Q$       B+�M	YM޻���A�.*

Training_loss0
�A�+N$       B+�M	��c����A�.*

Training_lossC�AFL�h$       B+�M	��뼉��A�.*

Training_lossF�A���$       B+�M	��s����A�.*

Training_losspw�A�cc$       B+�M	�N�����A�.*

Training_loss6��A��$       B+�M	�Y����A�.*

Training_loss0��A�&	�$       B+�M	�����A�.*

Training_loss��uA.���$       B+�M	F_�����A�.*

Training_lossd��A?���$       B+�M	(�����A�.*

Training_loss�uA�'�]$       B+�M	ۿ�����A�.*

Training_loss��BAd2f�$       B+�M	,*����A�.*

Training_loss�pA7�
�$       B+�M	` �����A�.*

Training_lossßVA ud'$       B+�M	Eh'��A�.*

Training_loss�!hA��
m$       B+�M	%���A�.*

Training_lossh�A����$       B+�M	�7É��A�.*

Training_loss�^A_���$       B+�M	N��É��A�.*

Training_lossڱA��5$       B+�M	w�Dĉ��A�.*

Training_lossKP�A�+A$       B+�M	,(�ĉ��A�.*

Training_loss��A��$       B+�M	a�Mŉ��A�.*

Training_loss>�~A>�q�$       B+�M	�r�ŉ��A�.*

Training_loss@��AL��$       B+�M	�TƉ��A�.*

Training_loss�|A|��$       B+�M	{��Ɖ��A�.*

Training_loss�S�A���$       B+�M	!�,ǉ��A�.*

Training_loss��AB�
�$       B+�M	5$�ǉ��A�.*

Training_loss� �Ad'2R$       B+�M	��ȉ��A�.*

Training_loss��Aq,��$       B+�M	�lȉ��A�.*

Training_loss�?�A�Ұt$       B+�M	���ȉ��A�.*

Training_loss�e6A���$       B+�M	��1ɉ��A�.*

Training_loss�H(A�=+�$       B+�M	f2�ɉ��A�.*

Training_lossr��A�`�$       B+�M	oI�ɉ��A�.*

Training_loss���AHC$       B+�M	7�Rʉ��A�.*

Training_lossUVuA�"�$       B+�M	*�ʉ��A�.*

Training_loss#��A�7$       B+�M	�xˉ��A�.*

Training_loss�TA�d\$       B+�M	ʥ�ˉ��A�.*

Training_lossSa�A	c#�$       B+�M	�{�ˉ��A�.*

Training_lossp�vAk���$       B+�M	�RỈ��A�.*

Training_loss��}A3g�"$       B+�M	X;�̉��A�.*

Training_loss>�2A����*       ����	6[o͉��A�.*

Validation_accuracyxwU?S�K&       sO� 	�]o͉��A�.*

Validation_loss��=B�~z$       B+�M	��Eщ��A�.*

Training_loss��ZA���J$       B+�M	t��щ��A�.*

Training_loss(�A�z�$       B+�M	ū�щ��A�.*

Training_loss_BA��r$       B+�M	��Y҉��A�.*

Training_lossǎ�A ؃$       B+�M	��҉��A�.*

Training_loss�A��
$       B+�M	PӉ��A�.*

Training_loss�A�6�/$       B+�M	x�|Ӊ��A�.*

Training_loss��#A�2��$       B+�M	���Ӊ��A�.*

Training_loss���AQ��O$       B+�M	��6ԉ��A�.*

Training_loss'�rA�͓$       B+�M	�p�ԉ��A�.*

Training_loss �WAT�?Y$       B+�M	_��ԉ��A�.*

Training_lossl��A8D9>$       B+�M	t#LՉ��A�.*

Training_loss"#�AȮ�$       B+�M	qZ�Չ��A�.*

Training_lossVU_A~W�$       B+�M	�A։��A�.*

Training_loss�vA�y=b$       B+�M	%�`։��A�.*

Training_lossc�lA�L:$       B+�M	��։��A�.*

Training_loss��AG���$       B+�M	٘׉��A�.*

Training_loss�JA�5�$       B+�M	+�t׉��A�.*

Training_loss�~qA����$       B+�M	 ��׉��A�.*

Training_loss��ZAb	�$       B+�M	�B.؉��A�.*

Training_lossL�WAw�K$       B+�M	�'�؉��A�.*

Training_loss*qAz~M$       B+�M	(~�؉��A�.*

Training_loss��TA?�Q�$       B+�M	�Bى��A�.*

Training_loss�yGA��K$       B+�M	�Y�ى��A�.*

Training_loss��SAS�-I$       B+�M	���ى��A�.*

Training_loss�+�A0-�S$       B+�M	; Xډ��A�.*

Training_loss��yA�Y�$       B+�M	���ډ��A�.*

Training_lossX�KA�<� $       B+�M	6<ۉ��A�.*

Training_loss�dA&Z`$       B+�M	�Anۉ��A�.*

Training_lossܚA�U<�$       B+�M	��ۉ��A�.*

Training_loss�d,A$ڴ$       B+�M	�&܉��A�.*

Training_lossҖeA揝y$       B+�M	Ҧ�܉��A�.*

Training_loss\�A%�$       B+�M	=�܉��A�.*

Training_loss��zAþ��$       B+�M	�!=݉��A�.*

Training_lossg{kA�^$       B+�M	{�݉��A�.*

Training_lossZ�^A9l��$       B+�M	���݉��A�.*

Training_loss8ơAvbb�$       B+�M	NSމ��A�.*

Training_loss�Q~A >��$       B+�M	i6�މ��A�.*

Training_lossu�A(���$       B+�M	*p߉��A�.*

Training_loss�@KA{(=�$       B+�M	��i߉��A�.*

Training_loss�s�AH��v$       B+�M	�z�߉��A�.*

Training_loss`~vA���$       B+�M	V�!����A�.*

Training_loss���Ak??�$       B+�M	�����A�.*

Training_loss�6�A�x#�$       B+�M	�������A�.*

Training_loss�u�A�/��$       B+�M	��8���A�.*

Training_lossv"�A�W $       B+�M	h����A�.*

Training_lossT�A���x$       B+�M	H�����A�.*

Training_loss��uA��$       B+�M	�N���A�.*

Training_loss���A{`ep$       B+�M	_�����A�.*

Training_lossy�.A�^�$       B+�M	8����A�.*

Training_loss��AZֲ�*       ����	?�����A�.*

Validation_accuracy��U?b��&       sO� 	������A�.*

Validation_loss�=@B����$       B+�M	������A�.*

Training_loss>C�A�:}$       B+�M	J	����A�.*

Training_lossW<�A���$       B+�M	�5R���A�.*

Training_loss�,�A$�$       B+�M	2����A�.*

Training_loss#��AkJq$       B+�M	��	���A�.*

Training_lossuNA��~$       B+�M	��f���A�.*

Training_loss��<A���$       B+�M	������A�.*

Training_loss	p�A��[�$       B+�M	)����A�.*

Training_loss�ͩA�*��$       B+�M	�}{���A�.*

Training_loss>�sA���	$       B+�M	������A�.*

Training_lossV�\A�M�$       B+�M	Y5���A�.*

Training_loss�x&Ay��e$       B+�M	B����A�.*

Training_lossD�Aף$       B+�M	X����A�.*

Training_loss��A\yP$       B+�M	�rI���A�.*

Training_lossv?�Af$       B+�M	Xǥ���A�.*

Training_lossہA���$       B+�M	Ή���A�/*

Training_loss�]�A��{�$       B+�M	�-]���A�/*

Training_loss\�(A��;e$       B+�M	�(����A�/*

Training_lossf�AAQ��$       B+�M	@����A�/*

Training_lossy�uA��p$       B+�M		r���A�/*

Training_loss�AHg'$       B+�M	�9����A�/*

Training_loss{o�A7 �$       B+�M	��*���A�/*

Training_loss��A*3vr$       B+�M	������A�/*

Training_lossb�>A�k�*$       B+�M	�)����A�/*

Training_loss��AY�k�$       B+�M	z�?����A�/*

Training_loss���A��$       B+�M	������A�/*

Training_loss��A+�94$       B+�M	������A�/*

Training_loss�D�A1>�$       B+�M	�oS���A�/*

Training_loss`��A��[$       B+�M	㩯���A�/*

Training_lossʉA|�}$       B+�M	�����A�/*

Training_lossrlAA%q#$       B+�M	Xh���A�/*

Training_loss fA�V�$       B+�M	�b����A�/*

Training_loss�.2As,��$       B+�M	77!���A�/*

Training_loss'_cA~�{$       B+�M	]P~���A�/*

Training_loss���A�@��$       B+�M	n4����A�/*

Training_loss��Amu$       B+�M	��7���A�/*

Training_loss�JA����$       B+�M	v����A�/*

Training_lossjҖA_뛯$       B+�M	W����A�/*

Training_loss��rAqTP�$       B+�M	4fM����A�/*

Training_loss��7A�,�$       B+�M	=�����A�/*

Training_loss`a:Af��$       B+�M	������A�/*

Training_lossE��@;C�$       B+�M	֭b����A�/*

Training_loss
�rA�Z�S$       B+�M	�m�����A�/*

Training_lossbA/�~�$       B+�M	������A�/*

Training_loss+�A�O.$       B+�M	sfx����A�/*

Training_loss�h�Aa���$       B+�M	������A�/*

Training_lossL�MA�75�$       B+�M	K1����A�/*

Training_lossQ��A�[�$       B+�M	������A�/*

Training_lossi�A�D��$       B+�M	W�����A�/*

Training_loss8��A�^��$       B+�M	e�E����A�/*

Training_loss"$uA����*       ����	�z
����A�/*

Validation_accuracy��U?�3"2&       sO� 	�|
����A�/*

Validation_loss��AB�[s$       B+�M	٘�����A�/*

Training_loss�V�A���$       B+�M	������A�/*

Training_loss�O�A1ɢ�$       B+�M	X9u����A�/*

Training_loss�W�A{�x�$       B+�M	�m�����A�/*

Training_loss,�A�uh$       B+�M	I.����A�/*

Training_loss���A���3$       B+�M	(`�����A�/*

Training_loss��A�3��$       B+�M	~������A�/*

Training_loss��Aa|$       B+�M	�xC ���A�/*

Training_loss/�A�ХE$       B+�M	М� ���A�/*

Training_lossl)�AdG�$       B+�M	,�� ���A�/*

Training_lossm�A��C$       B+�M	��Z���A�/*

Training_loss|�A�o\/$       B+�M	����A�/*

Training_loss\A@t�~$       B+�M	����A�/*

Training_loss�(�A�"�$       B+�M	p�p���A�/*

Training_loss "A�hf$       B+�M	������A�/*

Training_loss�ҏA��mb$       B+�M	R�(���A�/*

Training_loss~A�L,$       B+�M	]����A�/*

Training_loss��hA�i�O$       B+�M	p|����A�/*

Training_loss)G�A_l�$       B+�M	/k>���A�/*

Training_loss��/A��C�$       B+�M	)z����A�/*

Training_losslN�A��D�$       B+�M		�����A�/*

Training_loss$Y$AbM�$       B+�M	 T���A�/*

Training_lossr�nA�!��$       B+�M	%˰���A�/*

Training_lossBH�A�2D$       B+�M	�����A�/*

Training_loss�%zAd�-$       B+�M	{h���A�/*

Training_loss��Ag)~$       B+�M	�7����A�/*

Training_lossk73A7��n$       B+�M	ZK!���A�/*

Training_loss���AD��O$       B+�M	u}���A�/*

Training_lossQ�$A3�P$       B+�M	�����A�/*

Training_loss�O�A��8$       B+�M	D46���A�/*

Training_loss�E�A~��$       B+�M	q����A�/*

Training_loss��A���$       B+�M	�����A�/*

Training_lossPt�@�)�	$       B+�M	�,J	���A�/*

Training_loss���A+�&�$       B+�M	��	���A�/*

Training_loss�PA�@d$       B+�M	�k
���A�/*

Training_loss�"�Aw�,$       B+�M	�_
���A�/*

Training_loss�KqA2�$       B+�M	C�
���A�/*

Training_loss�Y�A'X��$       B+�M	#����A�/*

Training_loss���A���$       B+�M	��t���A�/*

Training_loss^O�A�'�$       B+�M	[?����A�/*

Training_loss�vRAp+D$       B+�M	�<-���A�/*

Training_loss�:dA�R��$       B+�M	�����A�/*

Training_loss�k�A����$       B+�M	+����A�/*

Training_lossR�A�>�$       B+�M	]�B���A�/*

Training_loss/w�A��~�$       B+�M	H����A�/*

Training_loss<��AF�$       B+�M	������A�/*

Training_loss� A����$       B+�M	`w\���A�/*

Training_loss0�zA����$       B+�M	oF����A�/*

Training_lossD�IA�A�$       B+�M	3����A�/*

Training_loss*͆A��r�$       B+�M	�s���A�/*

Training_loss�tA����*       ����	�8���A�/*

Validation_accuracy#"V?f�;&       sO� 	m�8���A�/*

Validation_lossA�?B��:<$       B+�M	O���A�/*

Training_losspJ�A��$       B+�M	A�m���A�/*

Training_lossd��AN��T$       B+�M	������A�/*

Training_loss��wA�}�t$       B+�M	��%���A�/*

Training_loss.�A1�)$       B+�M	�����A�/*

Training_lossD\\A�%�$       B+�M	�<����A�/*

Training_loss��A%��$       B+�M	��;���A�/*

Training_loss_��A&�l_$       B+�M	LQ����A�/*

Training_loss�A�q��$       B+�M	S�����A�/*

Training_loss$�KA{�$       B+�M	5�P���A�/*

Training_loss���ADUH�$       B+�M	v�����A�/*

Training_loss�;aA�y�$       B+�M	�4	���A�/*

Training_loss���A�+�l$       B+�M	%�f���A�/*

Training_loss}AK҉�$       B+�M	�h����A�/*

Training_lossK�dA6�$       B+�M	�����A�/*

Training_loss���A�p3 $       B+�M	�d}���A�/*

Training_loss�K�A���_$       B+�M	�5����A�/*

Training_loss�A0��"$       B+�M	6v<���A�/*

Training_lossE�A�h21$       B+�M	iT����A�/*

Training_loss:P�A�q`�$       B+�M	?����A�/*

Training_loss#�A0�)�$       B+�M	�b���A�/*

Training_lossdA�p�$       B+�M	������A�/*

Training_loss��MA�M+�$       B+�M	� ���A�/*

Training_loss�<~A�
{b$       B+�M	��|���A�/*

Training_loss&w�A�<�$       B+�M	�����A�/*

Training_loss���AL���$       B+�M	>]5���A�/*

Training_loss�s_Am&eE$       B+�M	E�����A�/*

Training_loss��EA����$       B+�M	������A�/*

Training_loss$՞Ab�ȝ$       B+�M	k�K���A�/*

Training_lossR*hA��ڼ$       B+�M	̨���A�/*

Training_loss�t�A�L�v$       B+�M	�d���A�/*

Training_loss+vkAjÇF$       B+�M	a�b���A�/*

Training_lossB�$A9��Z$       B+�M	�¿���A�/*

Training_loss8�{A1�6$       B+�M	k ���A�/*

Training_loss3D�A��ٮ$       B+�M	�y ���A�/*

Training_loss0ƁA��0^$       B+�M	)�� ���A�/*

Training_loss��[AF/.1$       B+�M	�2!���A�/*

Training_lossl�aA��[�$       B+�M	F\�!���A�/*

Training_lossz�AM4�$       B+�M	L3�!���A�/*

Training_loss�A���$       B+�M	��G"���A�/*

Training_loss�M�AK�]�$       B+�M	V��"���A�/*

Training_loss�s�A���$       B+�M	�@�"���A�/*

Training_lossV{A�XZ�$       B+�M	.\#���A�/*

Training_loss�0Ay���$       B+�M	�Y�#���A�0*

Training_loss<̘AqG �$       B+�M	Ƨ%$���A�0*

Training_loss���Aob�8$       B+�M	ǽ�$���A�0*

Training_loss��XA�D�|$       B+�M	0�%���A�0*

Training_loss�=�A>a��$       B+�M	s�%���A�0*

Training_loss���Aג6�$       B+�M	4��%���A�0*

Training_loss��dAi
x�$       B+�M	F[p&���A�0*

Training_loss�D~AQ��r*       ����	�Pf'���A�0*

Validation_accuracyxwU?��|�&       sO� 	�Sf'���A�0*

Validation_loss��>B�$       B+�M	���+���A�0*

Training_lossY�A���$       B+�M	z�,���A�0*

Training_loss|>QA�0$       B+�M	��v,���A�0*

Training_loss�&KA����$       B+�M	8��,���A�0*

Training_loss�0�Ab4#V$       B+�M	:-���A�0*

Training_loss�$hA
�4h$       B+�M	�ϖ-���A�0*

Training_loss^�KAxwW'$       B+�M	�g�-���A�0*

Training_loss+��A�:��$       B+�M	�R.���A�0*

Training_loss��[A3�0�$       B+�M	q�.���A�0*

Training_loss��BAv��$       B+�M	��/���A�0*

Training_loss�ۂA�/~�$       B+�M	�q/���A�0*

Training_losst��A����$       B+�M	w/�/���A�0*

Training_lossZ�iAa���$       B+�M	�<0���A�0*

Training_loss8��A�U�V$       B+�M	L��0���A�0*

Training_loss��FA@r(�$       B+�M	�p�0���A�0*

Training_loss���A:h�$       B+�M	.U1���A�0*

Training_loss���Aĝ��$       B+�M	��1���A�0*

Training_loss�VoAëI4$       B+�M	�/2���A�0*

Training_loss�A!�Pl$       B+�M	�(q2���A�0*

Training_loss�1A���+$       B+�M	$��2���A�0*

Training_lossHЎA�+]$       B+�M	��*3���A�0*

Training_loss7b�A�,��$       B+�M	W�3���A�0*

Training_loss�KbAJ%+t$       B+�M	��3���A�0*

Training_lossu�qA<�@�$       B+�M	|W4���A�0*

Training_loss��)A�3_d$       B+�M	���4���A�0*

Training_loss��A���$       B+�M	�p 5���A�0*

Training_loss��A��h$       B+�M	h�5���A�0*

Training_loss"`�A�1�$       B+�M	�:�5���A�0*

Training_loss�{A�h�t$       B+�M	8,a6���A�0*

Training_loss��A�nu�$       B+�M	�g�6���A�0*

Training_loss�wA	�+�$       B+�M	��=7���A�0*

Training_loss���Ai�l�$       B+�M	��7���A�0*

Training_lossٿA!!�G$       B+�M	=�58���A�0*

Training_loss~VKA��I�$       B+�M	K?�8���A�0*

Training_loss��A�(l&$       B+�M	
1-9���A�0*

Training_lossB�RA�ۭ�$       B+�M	���9���A�0*

Training_loss��A��8$       B+�M	W�!:���A�0*

Training_loss'݈A%pv$       B+�M	��:���A�0*

Training_loss�p,Ah���$       B+�M	�I
;���A�0*

Training_loss�T�Av,$       B+�M	�\;���A�0*

Training_loss��]AL�;$       B+�M	�c�;���A�0*

Training_loss�q�A��eO$       B+�M	|en<���A�0*

Training_lossH�2A�$       B+�M	?�<���A�0*

Training_loss�(ZA���	$       B+�M	Ӈ@=���A�0*

Training_loss�TA,$�W$       B+�M	�׭=���A�0*

Training_loss�:�A��:$       B+�M	�>���A�0*

Training_loss)e+A�5f$       B+�M	�;q>���A�0*

Training_losstq%An�]�$       B+�M	Su�>���A�0*

Training_loss�WA�|֮$       B+�M	�3W?���A�0*

Training_loss�0A!���$       B+�M	I��?���A�0*

Training_loss��A3j**       ����	O]&A���A�0*

Validation_accuracyxwU?�K�&       sO� 	�_&A���A�0*

Validation_loss_�?BҋO�$       B+�M	j��F���A�0*

Training_lossp{2Ac�|�$       B+�M	�G���A�0*

Training_loss��rAQ%��$       B+�M	ް�G���A�0*

Training_lossx�4A}��$       B+�M	}\8H���A�0*

Training_loss��A�c��$       B+�M	!�H���A�0*

Training_loss�Ai�$       B+�M	u=ZI���A�0*

Training_loss�j.A���Y$       B+�M	{��I���A�0*

Training_loss[A yK�$       B+�M	]m]J���A�0*

Training_loss�ZEA��Ū$       B+�M	��J���A�0*

Training_lossh�Apܙ�$       B+�M	�eK���A�0*

Training_loss,��A"[`$       B+�M	�4L���A�0*

Training_loss��.A�H��$       B+�M	�L���A�0*

Training_lossxd�A)�~<$       B+�M	kc	M���A�0*

Training_loss&��A�,f$       B+�M	j�M���A�0*

Training_loss�7�A3��$       B+�M	I�N���A�0*

Training_loss�A�:�$       B+�M	�֔N���A�0*

Training_loss�oAV�E$       B+�M	% O���A�0*

Training_lossR��A�⃍$       B+�M	��O���A�0*

Training_loss��^A����$       B+�M	�k#P���A�0*

Training_loss�	A�!�$       B+�M	@ðP���A�0*

Training_loss$�YA*�;$       B+�M	P�@Q���A�0*

Training_lossaYZA\�9�$       B+�M	oc�Q���A�0*

Training_loss�G�A�R0$       B+�M	 o]R���A�0*

Training_loss'�A��$       B+�M	z��R���A�0*

Training_lossv��A���%$       B+�M	P:RS���A�0*

Training_loss�A���$       B+�M	�|�S���A�0*

Training_loss�NA%�*$       B+�M	j0HT���A�0*

Training_loss]G�Ar�C�$       B+�M	6r�T���A�0*

Training_lossk�1A���$       B+�M	��@U���A�0*

Training_loss*_A��$       B+�M	�.�U���A�0*

Training_loss��uA��~$       B+�M	��;V���A�0*

Training_loss���A2��j$       B+�M	$(�V���A�0*

Training_losswNA��K�$       B+�M	F}-W���A�0*

Training_loss��A���<$       B+�M	���W���A�0*

Training_loss�݋A���$       B+�M	��+X���A�0*

Training_loss��<A6#}�$       B+�M	�]�X���A�0*

Training_loss�!oAİ��$       B+�M	��Y���A�0*

Training_loss��A���$       B+�M	�ёY���A�0*

Training_losse�A�<�|$       B+�M	~�Z���A�0*

Training_lossZ�YAZ{h�$       B+�M	+/�Z���A�0*

Training_loss��A
^��$       B+�M	��[���A�0*

Training_lossH�A�8Hv$       B+�M	�)�[���A�0*

Training_loss��A�3T�$       B+�M	�T\���A�0*

Training_loss�˶A�a�:$       B+�M	c��\���A�0*

Training_loss�+�A�Z�$       B+�M	��]���A�0*

Training_loss��EA��0@$       B+�M	�:�]���A�0*

Training_lossFoA/e�$       B+�M	��^���A�0*

Training_lossΛ�A�h��$       B+�M	y]�^���A�0*

Training_loss��JA��&$       B+�M	�l�^���A�0*

Training_lossX�BA+��$       B+�M	
�t_���A�0*

Training_loss�O�A��*       ����	��p`���A�0*

Validation_accuracy��U?�	�=&       sO� 	h�p`���A�0*

Validation_loss@�BBy{ɣ$       B+�M	j�+e���A�0*

Training_loss\|bA5�$       B+�M	�ӣe���A�0*

Training_lossb��A��$       B+�M	�$f���A�0*

Training_lossL�IA�7��$       B+�M	�ߘf���A�0*

Training_loss��~A���$       B+�M	#2(g���A�0*

Training_loss�ӌA���?$       B+�M	�j�g���A�0*

Training_lossF�)A2��$       B+�M	�1h���A�0*

Training_loss��A�_k$       B+�M	KY�h���A�0*

Training_loss�Y+A+�$$       B+�M	/�8i���A�0*

Training_lossZ��A@�c$       B+�M	�
�i���A�0*

Training_loss��MA�vE�$       B+�M	�R3j���A�0*

Training_loss�ґA��a1$       B+�M	���j���A�0*

Training_loss�1�A,��B$       B+�M	}'k���A�0*

Training_loss�@A��Κ$       B+�M	��k���A�0*

Training_lossG9lAg	�Z$       B+�M	�El���A�0*

Training_loss8h�Ayye~$       B+�M	���l���A�0*

Training_loss�A�Z�$       B+�M	��m���A�0*

Training_loss�5:AW]�$       B+�M	辌m���A�0*

Training_loss0�fA���$       B+�M	G�n���A�0*

Training_loss��A����$       B+�M	��n���A�0*

Training_lossF��A����$       B+�M	���n���A�0*

Training_loss��lA�P�$       B+�M	g�wo���A�1*

Training_loss��sA�(]$       B+�M	@��o���A�1*

Training_lossW{�A�$�$       B+�M	0�np���A�1*

Training_lossN�dAS�<5$       B+�M	p��p���A�1*

Training_loss��VAqH��$       B+�M	F&bq���A�1*

Training_loss���A���$       B+�M	l�q���A�1*

Training_loss��A�q�3$       B+�M	��Sr���A�1*

Training_loss�KtAU3�$       B+�M	%��r���A�1*

Training_loss@OA�
�$       B+�M	�Rs���A�1*

Training_loss�-jA��L$       B+�M	/��s���A�1*

Training_lossc�jA�Q�'$       B+�M	��Jt���A�1*

Training_loss�7;A�'�$       B+�M	M0�t���A�1*

Training_lossj`^A�$$       B+�M	]�Gu���A�1*

Training_lossep#A� ��$       B+�M	ڌ�u���A�1*

Training_loss��3As��$       B+�M	�@v���A�1*

Training_loss�rFA�y��$       B+�M	���v���A�1*

Training_lossS�@A	j`$       B+�M	lZ,w���A�1*

Training_loss�S�ATPT�$       B+�M	φ�w���A�1*

Training_loss��A�z{l$       B+�M	�� x���A�1*

Training_loss�`�A;�$       B+�M		��x���A�1*

Training_loss-��A�d%$       B+�M	��y���A�1*

Training_lossx�A��Nz$       B+�M	�B�y���A�1*

Training_loss�rA��"R$       B+�M	��y���A�1*

Training_loss�AZ��$       B+�M	��mz���A�1*

Training_lossD)2A/�C�$       B+�M	t��z���A�1*

Training_loss��A<��$       B+�M	^]{���A�1*

Training_loss:Y�A���w$       B+�M	M��{���A�1*

Training_loss�
Ah�j$       B+�M	2H|���A�1*

Training_loss@�eAבA$       B+�M	�һ|���A�1*

Training_loss *A?��*       ����	l^�}���A�1*

Validation_accuracyxwU?q� u&       sO� 	xa�}���A�1*

Validation_loss��<BE�_4$       B+�M	{2M����A�1*

Training_lossЉ�A³��$       B+�M	�ǂ���A�1*

Training_loss7#�Af�1$       B+�M	�>����A�1*

Training_loss�C2A?�I�$       B+�M	������A�1*

Training_lossr7AOֹ$       B+�M	$�#����A�1*

Training_loss�(�A�
��$       B+�M	J�����A�1*

Training_loss^��AL���$       B+�M	u�����A�1*

Training_loss짂A(rZs$       B+�M	�k�����A�1*

Training_lossu��A��Y�$       B+�M	�����A�1*

Training_lossbcA�Mn$       B+�M	R�k����A�1*

Training_lossR�A����$       B+�M	�;ᆊ��A�1*

Training_loss(�AW_�$       B+�M	0V����A�1*

Training_lossԮMA�q�$       B+�M	��ʇ���A�1*

Training_loss�fzA#0�d$       B+�M	_'@����A�1*

Training_loss�AB�|�$       B+�M	H������A�1*

Training_loss�];A��5�$       B+�M	�.*����A�1*

Training_loss�k�A*ƣ�$       B+�M	'������A�1*

Training_loss�ZA��u$       B+�M	>\����A�1*

Training_loss�U�A%��f$       B+�M	y"�����A�1*

Training_lossb�BA�m$       B+�M	�������A�1*

Training_loss:�;Aw/�$       B+�M	��s����A�1*

Training_lossgVdA�&��$       B+�M	F苊��A�1*

Training_loss��NA����$       B+�M	6�c����A�1*

Training_lossRW�@Cm�$       B+�M	 `ٌ���A�1*

Training_loss6�+A�Qn�$       B+�M	hN����A�1*

Training_lossbsA;��h$       B+�M	!�č���A�1*

Training_lossDS1AuuC$       B+�M	y":����A�1*

Training_loss�ANAq�:�$       B+�M	N�����A�1*

Training_loss91A�Q�$       B+�M	g3����A�1*

Training_losslg�A��$       B+�M	\������A�1*

Training_loss��6A�z�K$       B+�M	��'����A�1*

Training_loss�ʎA���$       B+�M	�������A�1*

Training_loss�oAA R�$       B+�M	�����A�1*

Training_loss}sEA[�z�$       B+�M	�8�����A�1*

Training_loss��UA`�($       B+�M	�@����A�1*

Training_loss��4A&Q"F$       B+�M	�������A�1*

Training_loss?A�H�4$       B+�M	O<����A�1*

Training_lossJ?IAEXT5$       B+�M	czz����A�1*

Training_loss�ΡA��$       B+�M	?n�����A�1*

Training_loss�W�A�Cż$       B+�M	������A�1*

Training_loss�3oA*H��$       B+�M	t� ����A�1*

Training_loss�d�@i��-$       B+�M	kv����A�1*

Training_loss{UA�h'_$       B+�M	��啊��A�1*

Training_loss�AAG�$       B+�M	Zl����A�1*

Training_loss�VA��D$       B+�M	G�ꖊ��A�1*

Training_loss��A�#e�$       B+�M	��e����A�1*

Training_losstRA[��|$       B+�M	�Mܗ���A�1*

Training_lossV{�A]!��$       B+�M	�ES����A�1*

Training_loss�jA����$       B+�M	Aǘ���A�1*

Training_loss5��@�@{$       B+�M	��<����A�1*

Training_loss�>�Ad�TO*       ����	i�3����A�1*

Validation_accuracy#"V?K��{&       sO� 	\�3����A�1*

Validation_loss�KBBG\�$       B+�M	����A�1*

Training_loss���A�z�$       B+�M	��g����A�1*

Training_loss	A�"��$       B+�M	V�ݟ���A�1*

Training_loss��yA�(�$       B+�M	=T����A�1*

Training_losst��A�Ϝ�$       B+�M	zpˠ���A�1*

Training_loss�)�@���$       B+�M	'�?����A�1*

Training_lossf�}A$���$       B+�M	D������A�1*

Training_loss�FA9���$       B+�M	�_,����A�1*

Training_loss⎌A��k$       B+�M	�̡����A�1*

Training_loss��fA�.�1$       B+�M	� ����A�1*

Training_loss��A�y9>$       B+�M	!�����A�1*

Training_loss�(~A�>�$       B+�M	f����A�1*

Training_loss�fAЩ@�$       B+�M	.<�����A�1*

Training_loss�m(A�1m$       B+�M	c~�����A�1*

Training_loss�{�A����$       B+�M	�iz����A�1*

Training_loss��As���$       B+�M	������A�1*

Training_loss�!�A��$       B+�M	�ŝ����A�1*

Training_loss(�A \��$       B+�M	#--����A�1*

Training_loss���AW\�-$       B+�M	ݾ����A�1*

Training_loss��dA}P�$       B+�M	&pH����A�1*

Training_lossL)�Aɺ)$       B+�M	w�Ϩ���A�1*

Training_loss��rAS��?$       B+�M	d@W����A�1*

Training_loss�cA'�z$       B+�M	ݩ���A�1*

Training_loss@� A'��$       B+�M	d����A�1*

Training_loss��NAq��$       B+�M	P�쪊��A�1*

Training_loss��oA�Q��$       B+�M	�n����A�1*

Training_losstEA��n�$       B+�M	>쫊��A�1*

Training_lossn�pA����$       B+�M	q�i����A�1*

Training_loss%A���$       B+�M	��A�1*

Training_loss�4�A����$       B+�M	�v~����A�1*

Training_loss��An+�Z$       B+�M	������A�1*

Training_loss~A^���$       B+�M	ߦx����A�1*

Training_loss�v4A'��<$       B+�M	�������A�1*

Training_lossqFA��x!$       B+�M	(,�����A�1*

Training_lossFP9AOՠ�$       B+�M	������A�1*

Training_lossP�A+��_$       B+�M	����A�1*

Training_loss��^A+�$�$       B+�M	܂+����A�1*

Training_loss�aA�C�$       B+�M	.9�����A�1*

Training_loss��A�p�$       B+�M	P�<����A�1*

Training_loss5�A����$       B+�M	�G�����A�1*

Training_loss���Aj��$       B+�M	��G����A�1*

Training_loss�sAAd�h�$       B+�M	��Գ���A�1*

Training_loss��`A����$       B+�M	O����A�1*

Training_loss�j�AO��$       B+�M	1	ݴ���A�1*

Training_lossf�A���$       B+�M	n�]����A�1*

Training_loss�sA��e$       B+�M	��׵���A�1*

Training_loss8!�A��p$       B+�M	;rb����A�1*

Training_loss�?AK��s$       B+�M	XXඊ��A�1*

Training_loss�DAdsF�$       B+�M	�c����A�1*

Training_loss�6AZ��*$       B+�M	��᷊��A�2*

Training_loss��=A6�{"*       ����	l|�����A�2*

Validation_accuracy#"V?�u�&       sO� 	�������A�2*

Validation_lossí@B��$       B+�M	j/�����A�2*

Training_loss�ȀA� ��$       B+�M	��F����A�2*

Training_loss[yvA����$       B+�M	��Ὴ��A�2*

Training_loss��$A��$       B+�M	Jn����A�2*

Training_loss��\A�=�$       B+�M	�E����A�2*

Training_loss;�A�z��$       B+�M	mY�����A�2*

Training_loss��A5�B%$       B+�M	6��A�2*

Training_losspŃA�2	a$       B+�M	n����A�2*

Training_loss%F1A����$       B+�M	0�Ê��A�2*

Training_lossK�A�k$       B+�M	���Ê��A�2*

Training_loss�8�A4���$       B+�M	A�Ê��A�2*

Training_loss�#A�-]$       B+�M	ٗMĊ��A�2*

Training_loss`�wAʶ�<$       B+�M	���Ċ��A�2*

Training_loss��A����$       B+�M	�YŊ��A�2*

Training_loss�m@A�l�$       B+�M	�kŊ��A�2*

Training_loss|��A�lgg$       B+�M	���Ŋ��A�2*

Training_loss�A�
�+$       B+�M	�IƊ��A�2*

Training_loss$ �Am$       B+�M	i��Ɗ��A�2*

Training_loss�A0VA�$       B+�M	�KǊ��A�2*

Training_lossɲ�A�}��$       B+�M	�@�Ǌ��A�2*

Training_loss[�/A�v�$       B+�M	�kIȊ��A�2*

Training_loss BpAˑ�$       B+�M	��Ȋ��A�2*

Training_loss��tA���Y$       B+�M	oJYɊ��A�2*

Training_loss��Ao�X$       B+�M	8L�Ɋ��A�2*

Training_loss~�A~�$       B+�M	Ggʊ��A�2*

Training_loss^�Aw��$       B+�M	`��ʊ��A�2*

Training_lossX;3A���U$       B+�M	}	oˊ��A�2*

Training_loss�+_A��$       B+�M	gd�ˊ��A�2*

Training_loss؉=A��c�$       B+�M	���̊��A�2*

Training_loss��fA��Qt$       B+�M	��͊��A�2*

Training_lossv/vA0�+$       B+�M	�?j͊��A�2*

Training_loss�$bA����$       B+�M	^��͊��A�2*

Training_loss(�^AjF$       B+�M	��/Ί��A�2*

Training_loss���A;T$       B+�M	!w�Ί��A�2*

Training_loss���A+��)$       B+�M	�%ϊ��A�2*

Training_loss�'�A;'f$       B+�M	��aϊ��A�2*

Training_loss[htA:֑_$       B+�M	���ϊ��A�2*

Training_loss&~\Aa
e$       B+�M	{�Њ��A�2*

Training_lossQ��A*0�$       B+�M	��vЊ��A�2*

Training_loss>{GAu@2$       B+�M	�{�Њ��A�2*

Training_loss��8A]�mx$       B+�M	��Aъ��A�2*

Training_lossB=�@���$$       B+�M	z��ъ��A�2*

Training_lossoQ�A�U�$       B+�M	��Ҋ��A�2*

Training_loss�WA�؆$       B+�M	�haҊ��A�2*

Training_loss�A0�[>$       B+�M	-�Ҋ��A�2*

Training_loss/�A�p�$       B+�M	��,ӊ��A�2*

Training_lossҵ4A�3
y$       B+�M	�7�ӊ��A�2*

Training_loss�ˈAo��$       B+�M	Y�ӊ��A�2*

Training_losspE)A�lƒ$       B+�M	�UԊ��A�2*

Training_loss�A���$       B+�M	ݕ�Ԋ��A�2*

Training_loss�>,ArOl�*       ����	PŋՊ��A�2*

Validation_accuracyxwU?�q~&       sO� 	�ǋՊ��A�2*

Validation_loss�?B$ȁ�$       B+�M	h8ۊ��A�2*

Training_loss�&�A���$       B+�M	#J�ۊ��A�2*

Training_loss�dVAyx��$       B+�M	.�O܊��A�2*

Training_loss_@�A:,�$       B+�M	}�܊��A�2*

Training_loss"lwA��$       B+�M	��d݊��A�2*

Training_loss��;A��>�$       B+�M	�x�݊��A�2*

Training_loss�L�A΀I$       B+�M	�fފ��A�2*

Training_lossZuA��ė$       B+�M	���ފ��A�2*

Training_loss�SfA�=�$       B+�M	�K~ߊ��A�2*

Training_loss��bA�-w<$       B+�M	������A�2*

Training_loss?�A�Z@$       B+�M	^�����A�2*

Training_lossMA7W��$       B+�M	ۈ���A�2*

Training_loss�/�A|�0�$       B+�M	�h����A�2*

Training_loss�@A�l]$       B+�M	�=���A�2*

Training_loss�[rA�.A�$       B+�M	�����A�2*

Training_loss�fA�4:$       B+�M	�����A�2*

Training_loss'k�A���$       B+�M	������A�2*

Training_lossU�A4�Nv$       B+�M	�}-���A�2*

Training_lossuǊA����$       B+�M	�`����A�2*

Training_loss}ǁA�Q��$       B+�M	�C���A�2*

Training_lossFwvA�MO�$       B+�M	�w����A�2*

Training_lossֺAx�:$       B+�M	?XO���A�2*

Training_loss��A7�$       B+�M	�c����A�2*

Training_loss`WA��f$       B+�M	�Fe���A�2*

Training_loss`|�A���$       B+�M	������A�2*

Training_loss��oA�><$       B+�M	�z���A�2*

Training_lossY3AC$       B+�M	�����A�2*

Training_loss�(Ah=�$       B+�M	(c����A�2*

Training_lossA7���$       B+�M	Ɖ���A�2*

Training_lossS�mA[��c$       B+�M	K�����A�2*

Training_loss�MA��H�$       B+�M	�-���A�2*

Training_loss���Ag���$       B+�M	�̢���A�2*

Training_loss�VdA�ᖄ$       B+�M	}$���A�2*

Training_lossZ"+AjFP�$       B+�M	r����A�2*

Training_loss3�wA��:�$       B+�M	�`2���A�2*

Training_lossJ�GAG�:$       B+�M	n�����A�2*

Training_lossh�A�4�$       B+�M	ԂI���A�2*

Training_loss�XsA�\$       B+�M	�B����A�2*

Training_lossGu�A��gF$       B+�M	`�Y���A�2*

Training_lossj$�AUY�$       B+�M	d:����A�2*

Training_loss:OA�G<�$       B+�M	�)p����A�2*

Training_lossn�A>`P�$       B+�M	������A�2*

Training_lossW��@�I��$       B+�M	o�x���A�2*

Training_lossx��A?�;�$       B+�M	������A�2*

Training_loss]�7Ag���$       B+�M	h�|���A�2*

Training_loss$�SA��$       B+�M	�]����A�2*

Training_loss#Q7A�,­$       B+�M	|Et���A�2*

Training_loss ��A���%$       B+�M	������A�2*

Training_loss�j�A^^sS$       B+�M	��u���A�2*

Training_loss�A��$       B+�M	K�����A�2*

Training_loss �CA,d�*       ����	�������A�2*

Validation_accuracyxwU?��l�&       sO� 	>������A�2*

Validation_loss8�>Bȼ��$       B+�M	�V�����A�2*

Training_lossQ�A �u$$       B+�M	Y�Q����A�2*

Training_loss��>A�_�$       B+�M	�������A�2*

Training_loss�AQ]:l$       B+�M	ڨo����A�2*

Training_loss
,�A��X�$       B+�M	�������A�2*

Training_loss"��AWY�$       B+�M	L5{����A�2*

Training_loss�>OAy��2$       B+�M	�W�����A�2*

Training_lossq��A��Z�$       B+�M	3�|����A�2*

Training_loss�A�DU{$       B+�M	�o	 ���A�2*

Training_loss��^AS}�Q$       B+�M	�܊ ���A�2*

Training_lossW'A�6�$       B+�M	
����A�2*

Training_loss��A�xPj$       B+�M	������A�2*

Training_lossr^	Aڒ��$       B+�M	Y�����A�2*

Training_lossR\A��O$       B+�M	Ov����A�2*

Training_loss�63A��d�$       B+�M	#���A�2*

Training_loss��\A����$       B+�M	�X����A�2*

Training_loss�_�@(��$       B+�M	/5���A�2*

Training_loss���A�'��$       B+�M	����A�2*

Training_loss�u.A�v��$       B+�M	xF���A�2*

Training_loss��0A\}<$       B+�M	R����A�2*

Training_loss�A���$       B+�M	/�
���A�2*

Training_lossvϗAP���$       B+�M	������A�2*

Training_lossw��@ç $       B+�M	����A�2*

Training_loss�)�Ak�$       B+�M	ni����A�2*

Training_loss�}�@�x(}$       B+�M	3���A�2*

Training_loss��AA�`$Z$       B+�M	������A�2*

Training_loss�Y]A�>f$       B+�M		���A�2*

Training_lossi�oA���\$       B+�M	e6�	���A�3*

Training_lossvUhA���$       B+�M	��
���A�3*

Training_loss�cAֵ��$       B+�M	㩍
���A�3*

Training_lossj��Ap��A$       B+�M	j����A�3*

Training_loss;�/A�b	$       B+�M	�����A�3*

Training_lossyRA����$       B+�M	S?���A�3*

Training_loss�.:AJ8ʸ$       B+�M	3����A�3*

Training_lossr�]A ��$       B+�M	&���A�3*

Training_loss�N�@��f@$       B+�M	ެ����A�3*

Training_loss�A��"�$       B+�M	z���A�3*

Training_loss�{�A��D�$       B+�M	�s����A�3*

Training_loss�RAx�T$       B+�M	����A�3*

Training_lossQ�pAP�bQ$       B+�M	tԓ���A�3*

Training_loss��A���$       B+�M	�Q���A�3*

Training_loss`t�A��U^$       B+�M	`����A�3*

Training_loss��NA$0�$       B+�M	����A�3*

Training_loss $gA�S��$       B+�M	1]����A�3*

Training_lossF�XA��?}$       B+�M	�o!���A�3*

Training_loss.΋A͚�$       B+�M	� ����A�3*

Training_loss�e6A��_]$       B+�M	��"���A�3*

Training_loss�UAJ��?$       B+�M	V�����A�3*

Training_loss<2A�B��$       B+�M	��#���A�3*

Training_loss�bA��G$       B+�M	n����A�3*

Training_loss��3A��(*       ����	ퟴ���A�3*

Validation_accuracyMMU?�}!o&       sO� 	P�����A�3*

Validation_loss��=B��($       B+�M	U�x���A�3*

Training_loss�%
At��X$       B+�M	 �����A�3*

Training_loss9�5AAmJ�$       B+�M	��|���A�3*

Training_loss�A�){`$       B+�M	������A�3*

Training_loss.��A�9d�$       B+�M	4+w���A�3*

Training_loss[YA+���$       B+�M	������A�3*

Training_loss���A{-y�$       B+�M	SZz���A�3*

Training_loss4�A��x�$       B+�M	�}����A�3*

Training_loss��;AM�3�$       B+�M	/1����A�3*

Training_losst��AK�zL$       B+�M	V*
 ���A�3*

Training_lossB�QA�z�$       B+�M	�� ���A�3*

Training_lossc�@�Ź�$       B+�M	�1!���A�3*

Training_loss$�A�kxS$       B+�M	K9�!���A�3*

Training_loss��9AT=��$       B+�M	��!���A�3*

Training_loss8A���1$       B+�M	�K"���A�3*

Training_loss��@�?��$       B+�M	�.�"���A�3*

Training_lossm��@���$       B+�M	�[	#���A�3*

Training_loss�K
A)�9$       B+�M	@f#���A�3*

Training_loss%C,A��{�$       B+�M	V��#���A�3*

Training_lossUA�o�$       B+�M	T�!$���A�3*

Training_loss+A�AD}�$       B+�M	�Y�$���A�3*

Training_loss�A:�X$       B+�M	0��$���A�3*

Training_loss�$�Av*�$       B+�M	�3H%���A�3*

Training_loss)lAY�$       B+�M	#M�%���A�3*

Training_loss!��A�M>7$       B+�M	�L
&���A�3*

Training_loss�O�@�|�w$       B+�M	ems&���A�3*

Training_loss�[A+:�$       B+�M	���&���A�3*

Training_loss�ciA���$       B+�M	�mA'���A�3*

Training_loss���A��E�$       B+�M	wM�'���A�3*

Training_loss�aA����$       B+�M	�c(���A�3*

Training_loss��kA� e$       B+�M	���(���A�3*

Training_lossr��@��@�$       B+�M	"��(���A�3*

Training_loss|�\AVBi�$       B+�M	��@)���A�3*

Training_lossEĝA:#0�$       B+�M	}X�)���A�3*

Training_lossv�|A�6��$       B+�M	��*���A�3*

Training_loss�(�AF��}$       B+�M	'�k*���A�3*

Training_loss.��A۫�$       B+�M	�g�*���A�3*

Training_loss��sAd��$       B+�M	ۆ4+���A�3*

Training_lossll�AB $       B+�M	/O�+���A�3*

Training_lossS�:An��^$       B+�M	�W�+���A�3*

Training_loss�l�@r�$       B+�M	�mJ,���A�3*

Training_lossh@"ABO$       B+�M	��,���A�3*

Training_loss�� A��z�$       B+�M	+M-���A�3*

Training_loss�WAv�P'$       B+�M	Ԃ_-���A�3*

Training_loss]kA�i�b$       B+�M	1�-���A�3*

Training_loss `�AK��~$       B+�M	 %.���A�3*

Training_loss(��A&���$       B+�M	��u.���A�3*

Training_lossp[�A�X$       B+�M	��.���A�3*

Training_loss>��@�88$       B+�M	�</���A�3*

Training_loss�#A���A$       B+�M	n��/���A�3*

Training_loss��A̟�*       ����	��\0���A�3*

Validation_accuracy#"U?���&       sO� 	��\0���A�3*

Validation_loss�?B`�QH$       B+�M	]�]4���A�3*

Training_loss�!mA��$       B+�M	t��4���A�3*

Training_loss<��A���N$       B+�M	��5���A�3*

Training_loss^?4A&s��$       B+�M	[z�5���A�3*

Training_loss�'A����$       B+�M	���5���A�3*

Training_loss&�Af�	�$       B+�M	��;6���A�3*

Training_loss��A��&�$       B+�M	�6���A�3*

Training_loss��YA�(B$       B+�M	���6���A�3*

Training_lossm�1A��?�$       B+�M	&S7���A�3*

Training_loss�e-AZ�PV$       B+�M	<2�7���A�3*

Training_loss�t
A^+�$       B+�M	�08���A�3*

Training_loss�oAA�[C$       B+�M	�j8���A�3*

Training_loss�m@A+��$       B+�M	+��8���A�3*

Training_loss�bA����$       B+�M	��"9���A�3*

Training_loss��dAհ�E$       B+�M	��9���A�3*

Training_loss'�AH�h$       B+�M	=�9���A�3*

Training_lossL,�A���$       B+�M	�q;:���A�3*

Training_loss_}AG�9�$       B+�M	�.�:���A�3*

Training_lossw�AQ��D$       B+�M	m9�:���A�3*

Training_loss��@A.
!$       B+�M	�Z;���A�3*

Training_loss1��AI�Q$       B+�M	\r�;���A�3*

Training_loss~�3A.���$       B+�M	B� <���A�3*

Training_loss�"AGљ�$       B+�M	x^�<���A�3*

Training_loss��HA�"�=$       B+�M	8��<���A�3*

Training_loss��aA�[�'$       B+�M	��A=���A�3*

Training_loss���A�N�?$       B+�M	��=���A�3*

Training_lossv�WA�s$       B+�M	'��=���A�3*

Training_lossԁgAޢ��$       B+�M	�BW>���A�3*

Training_loss��A8�6�$       B+�M	��>���A�3*

Training_lossRjBAgϞ�$       B+�M	'(?���A�3*

Training_lossА�@c�$       B+�M	]N�?���A�3*

Training_lossN<\A�Rs^$       B+�M	h�?���A�3*

Training_loss
�dA���$       B+�M	�9Y@���A�3*

Training_losss�gA�u�B$       B+�M	
��@���A�3*

Training_loss~fA�??�$       B+�M	A���A�3*

Training_losse#�A�%�$       B+�M	�kqA���A�3*

Training_loss�hA^($       B+�M	�0�A���A�3*

Training_loss_VA2��=$       B+�M	.8,B���A�3*

Training_lossKmAM��$       B+�M	y�B���A�3*

Training_loss&[6A�D�u$       B+�M	2��B���A�3*

Training_loss�n:A&���$       B+�M	��BC���A�3*

Training_loss�"�A��$       B+�M	'f�C���A�3*

Training_loss�K/A�z8$       B+�M	�b�C���A�3*

Training_lossX� AN�{�$       B+�M	��fD���A�3*

Training_lossx�	AX�Ts$       B+�M	{��D���A�3*

Training_loss׽iA	?}Z$       B+�M	�1E���A�3*

Training_lossFA��fL$       B+�M	��E���A�3*

Training_loss�f8A�N��$       B+�M	>��E���A�3*

Training_loss AA�z�]$       B+�M	��OF���A�3*

Training_loss�>/A.�[�$       B+�M	G�F���A�3*

Training_loss�9A�>�*       ����	X��G���A�3*

Validation_accuracy#"V?�{��&       sO� 	)��G���A�3*

Validation_loss�CB��~$       B+�M	��L���A�3*

Training_lossc�A����$       B+�M	[�oL���A�3*

Training_loss*�vA��;$       B+�M	h�L���A�3*

Training_loss�7A,s=$       B+�M	q83M���A�3*

Training_lossESHA����$       B+�M	!��M���A�3*

Training_loss��yA��$       B+�M	��M���A�4*

Training_loss��aAf�X$       B+�M	z4RN���A�4*

Training_loss;"dA��	$       B+�M	bg�N���A�4*

Training_loss< 3AX��$       B+�M	�XO���A�4*

Training_loss�.xA�}r�$       B+�M	�rgO���A�4*

Training_loss_6pASp�Q$       B+�M	k��O���A�4*

Training_loss�v�A���8$       B+�M	дP���A�4*

Training_loss�WPA��$       B+�M	�|P���A�4*

Training_loss�l A���$       B+�M	�Z�P���A�4*

Training_loss�׀Ae#�$       B+�M	��;Q���A�4*

Training_loss�7�A�+$       B+�M	�b�Q���A�4*

Training_loss��oA���$       B+�M	��Q���A�4*

Training_loss�ӄA)
$       B+�M	��WR���A�4*

Training_loss�FA�P�n$       B+�M	�m�R���A�4*

Training_loss�טA��L�$       B+�M	0FS���A�4*

Training_loss�jA!v�$       B+�M	!mS���A�4*

Training_lossb�kA/�x�$       B+�M	[�S���A�4*

Training_loss�?A<o�,$       B+�M	�X%T���A�4*

Training_lossu�A���$       B+�M	���T���A�4*

Training_loss��<A���h$       B+�M	���T���A�4*

Training_loss�`
A�"l�$       B+�M	{�;U���A�4*

Training_lossH�lA�G��$       B+�M	�G�U���A�4*

Training_loss`YAdN��$       B+�M	�N�U���A�4*

Training_loss��9A�8u�$       B+�M	��XV���A�4*

Training_lossm�LA.�$       B+�M	�׵V���A�4*

Training_loss�;JA�}#$       B+�M	&�W���A�4*

Training_loss�.uA;���$       B+�M	l$�W���A�4*

Training_loss�qGAEp�u$       B+�M	#�W���A�4*

Training_loss�t�@�2b�$       B+�M	��?X���A�4*

Training_loss�A��N$       B+�M	���X���A�4*

Training_lossz?WAC�{p$       B+�M	f�X���A�4*

Training_loss��@OD$       B+�M	MUY���A�4*

Training_loss�yA�z�$       B+�M	Ĵ�Y���A�4*

Training_loss�AM�5�$       B+�M	F�Z���A�4*

Training_loss���A���,$       B+�M	L�kZ���A�4*

Training_loss3/AW�*�$       B+�M	���Z���A�4*

Training_loss�o�AV��$       B+�M	'�-[���A�4*

Training_lossB��@84�d$       B+�M	��[���A�4*

Training_loss�A��Ab$       B+�M	�f�[���A�4*

Training_loss��IAi��D$       B+�M	xzY\���A�4*

Training_loss�`A|��;$       B+�M	cc�\���A�4*

Training_loss0�@/-��$       B+�M	К]���A�4*

Training_loss
^�A��$       B+�M	�i|]���A�4*

Training_loss�A�m�L$       B+�M	���]���A�4*

Training_loss�4hA��܅$       B+�M	26^���A�4*

Training_loss�%A*Nj*       ����	TU_���A�4*

Validation_accuracy#"U?��&       sO� 	X_���A�4*

Validation_loss�P@Bӆ�,$       B+�M	���c���A�4*

Training_lossȇ\A���7$       B+�M	��d���A�4*

Training_loss,�@-���$       B+�M	xC�d���A�4*

Training_loss��iA��l$       B+�M	�ve���A�4*

Training_loss�>gA�o�$       B+�M	�<�e���A�4*

Training_loss;nxA;x�l$       B+�M	�~f���A�4*

Training_lossT6:Au�)�$       B+�M	�Yg���A�4*

Training_loss*(TAs�<$       B+�M	,��g���A�4*

Training_loss$YA����$       B+�M	��!h���A�4*

Training_lossJ�'A���$       B+�M	���h���A�4*

Training_loss�vAvN�$       B+�M	?U/i���A�4*

Training_lossh�=A�ii�$       B+�M	��i���A�4*

Training_loss�A���$       B+�M	v3j���A�4*

Training_loss�3�A&�э$       B+�M	�X�j���A�4*

Training_loss���A%���$       B+�M	��-k���A�4*

Training_loss&C-A���$       B+�M	�$�k���A�4*

Training_lossu�@�v($       B+�M	�/l���A�4*

Training_loss��DAqrK�$       B+�M	=D�l���A�4*

Training_loss�/�AW��Q$       B+�M	0*
m���A�4*

Training_loss�WqA�5�$       B+�M	5F�m���A�4*

Training_loss�IA�'�$       B+�M	2v�m���A�4*

Training_loss��YA���$       B+�M	^hpn���A�4*

Training_lossa�A�~"�$       B+�M	�g�n���A�4*

Training_loss �A#R$       B+�M	^�bo���A�4*

Training_lossG&A(�P$       B+�M	o��o���A�4*

Training_loss�A8e�$       B+�M	�ip���A�4*

Training_loss|c�@T�,�$       B+�M	�@�p���A�4*

Training_loss�A>.N�$       B+�M	(sq���A�4*

Training_lossH#A:��$       B+�M	(�q���A�4*

Training_loss �fA��Z$       B+�M	^�qr���A�4*

Training_lossЇAm��$       B+�M	(��r���A�4*

Training_loss2�CA{��$       B+�M	��os���A�4*

Training_loss��_A^�$       B+�M	��s���A�4*

Training_loss�qfAN]j�$       B+�M	��^t���A�4*

Training_loss"�xA�T$       B+�M	�_�t���A�4*

Training_loss�uAk��6$       B+�M	[gu���A�4*

Training_loss�e�A*�$�$       B+�M	���u���A�4*

Training_loss_�-A�R$       B+�M	��`v���A�4*

Training_loss���A.h	�$       B+�M	�A�v���A�4*

Training_loss��HA7�<$       B+�M	�!mw���A�4*

Training_loss�%8AO2&�$       B+�M	�n�w���A�4*

Training_lossAIs0U$       B+�M	O�\x���A�4*

Training_loss�nHA��$       B+�M	�G�x���A�4*

Training_lossW�'AO-�$       B+�M	ywVy���A�4*

Training_loss��,A|���$       B+�M	p^�y���A�4*

Training_loss�ZA�$       B+�M	��ez���A�4*

Training_loss6>YA��9$       B+�M	�U�z���A�4*

Training_loss���@�]��$       B+�M	��g{���A�4*

Training_loss�Ah�,$       B+�M	l��{���A�4*

Training_loss֔VAQp}�$       B+�M	�8l|���A�4*

Training_loss��A,�0*       ����	E�i}���A�4*

Validation_accuracy#"V?��?�&       sO� 	��i}���A�4*

Validation_loss #EB��l$       B+�M	������A�4*

Training_lossc��@��$       B+�M	��+����A�4*

Training_losspϋA���v$       B+�M	�]�����A�4*

Training_loss �A��$       B+�M	������A�4*

Training_loss�&AiYS$       B+�M	�瘄���A�4*

Training_lossX5A%F$       B+�M	������A�4*

Training_loss~��@��g$       B+�M	�<�����A�4*

Training_loss��A�T�$       B+�M	�����A�4*

Training_loss��Au�1�$       B+�M	Pn}����A�4*

Training_lossږ3A-/�$       B+�M	�������A�4*

Training_lossl�]A�,��$       B+�M	T�k����A�4*

Training_loss(dlA��"�$       B+�M	.Y�����A�4*

Training_loss�}A�[O$       B+�M	��X����A�4*

Training_loss��`Awe��$       B+�M	j�҈���A�4*

Training_loss�Av�S�$       B+�M	-�J����A�4*

Training_loss��A��-$       B+�M	�һ����A�4*

Training_loss��LA�(�$       B+�M	B� ����A�4*

Training_loss���@��;^$       B+�M	�₊���A�4*

Training_loss��A��<y$       B+�M	�����A�4*

Training_loss�A枊�$       B+�M	{/h����A�4*

Training_loss�G!A�b�$       B+�M	h�닋��A�4*

Training_loss�#A{G$       B+�M	]6}����A�4*

Training_loss�zA>L�r$       B+�M	�A�����A�4*

Training_loss��BAf�r$       B+�M	������A�4*

Training_loss�2.A����$       B+�M	�e�����A�4*

Training_loss��A,�(j$       B+�M	_]v����A�4*

Training_lossG[lA�ԍ�$       B+�M	�^뎋��A�4*

Training_lossnnA�{i$       B+�M	M�V����A�4*

Training_lossAՋA��H$       B+�M	�u�����A�4*

Training_loss7�A�O�$       B+�M	Ѯ ����A�4*

Training_loss�@A/E/�$       B+�M	�p�����A�4*

Training_loss_�@�4]�$       B+�M	 �����A�4*

Training_loss�UA
j$       B+�M	�|�����A�4*

Training_lossv�IA�fRi$       B+�M	F�����A�5*

Training_loss� Aɞ$       B+�M	�Ȣ����A�5*

Training_lossHIA"JSD$       B+�M	����A�5*

Training_loss%�PA��t$       B+�M	喓���A�5*

Training_lossl�KA�?�$       B+�M	�K!����A�5*

Training_loss�AK��$       B+�M	�G�����A�5*

Training_loss��=A�*)$       B+�M	�x(����A�5*

Training_loss��@ڜc.$       B+�M	;q�����A�5*

Training_loss
��A�?�$       B+�M	c�-����A�5*

Training_lossÅSA��C$       B+�M	Z~�����A�5*

Training_lossl�5A�kja$       B+�M	̸8����A�5*

Training_loss%�AR/��$       B+�M	�տ����A�5*

Training_loss� Ak�w�$       B+�M	�@<����A�5*

Training_loss��)A���$       B+�M	b1�����A�5*

Training_lossK��Aːs $       B+�M	�)/����A�5*

Training_loss ��AQ5f9$       B+�M	�ӧ����A�5*

Training_loss4�eA�ʥ�$       B+�M	� ����A�5*

Training_lossJ��AiD�*       ����	8*����A�5*

Validation_accuracy��U?�^&       sO� 	�*����A�5*

Validation_losssgIB�8O$       B+�M	˝N����A�5*

Training_lossXVDA���$       B+�M	d�Ԡ���A�5*

Training_lossV:�@a�ϵ$       B+�M	�ga����A�5*

Training_loss�<-A�'�=$       B+�M	�������A�5*

Training_lossU�A� �$       B+�M	7�����A�5*

Training_lossA�a[�$       B+�M	r�����A�5*

Training_loss�{[A�P<$       B+�M	�7�����A�5*

Training_lossY�A�+Q�$       B+�M	\����A�5*

Training_loss�hAB��-$       B+�M	�+�����A�5*

Training_lossgA��l�$       B+�M	������A�5*

Training_loss6�Aܤ$       B+�M	��c����A�5*

Training_loss�=�@o���$       B+�M	�Nͥ���A�5*

Training_lossP�cAWW�$       B+�M	��)����A�5*

Training_loss4?tAۙ�0$       B+�M	ׅ����A�5*

Training_loss\A�E�$       B+�M	P�見��A�5*

Training_loss��A+Wכ$       B+�M	��F����A�5*

Training_loss͠�@��Q$       B+�M	�������A�5*

Training_loss��+A���K$       B+�M	�������A�5*

Training_loss踐AEbb$       B+�M	7�n����A�5*

Training_loss�$�AR�)�$       B+�M	TqҨ���A�5*

Training_lossb;�@F-;$       B+�M	q�.����A�5*

Training_lossJ�_A��t$       B+�M	�u�����A�5*

Training_lossW�"A��$       B+�M	j������A�5*

Training_lossg\A��(�$       B+�M	F�e����A�5*

Training_loss��@�3�$       B+�M	�dȪ���A�5*

Training_loss:�QADUI�$       B+�M	9F+����A�5*

Training_loss��`AЦ��$       B+�M	 r�����A�5*

Training_loss�3�@TK�B$       B+�M	E������A�5*

Training_loss�R/A7J�$       B+�M	�Z����A�5*

Training_loss]/A%�#R$       B+�M	�/ͬ���A�5*

Training_loss*AT��o$       B+�M	M�6����A�5*

Training_losss^ A��O$       B+�M	hz�����A�5*

Training_loss�&IA#��$       B+�M	������A�5*

Training_lossO8zA`��W$       B+�M	`�n����A�5*

Training_loss��DA��#$       B+�M	�\ʮ���A�5*

Training_loss2�6Au`�$       B+�M	(-����A�5*

Training_lossbdA�?vU$       B+�M	�?�����A�5*

Training_loss���Aā�$       B+�M	
����A�5*

Training_loss��A(ۭ�$       B+�M	کk����A�5*

Training_loss�lQA��N#$       B+�M	Tа���A�5*

Training_lossfU�@h>8�$       B+�M	4�8����A�5*

Training_lossM��@M��$       B+�M	1|�����A�5*

Training_loss|y�@X�7$       B+�M	�L����A�5*

Training_loss�OA>�Z6$       B+�M	�'l����A�5*

Training_loss'	kAv�h$       B+�M	�ղ���A�5*

Training_lossEzdA(�F$       B+�M	A,1����A�5*

Training_loss���@�y�$       B+�M	�B�����A�5*

Training_loss�yA7}�$       B+�M	ض�����A�5*

Training_lossh�(Ak��$       B+�M	��Y����A�5*

Training_loss�:Av�}$       B+�M	b������A�5*

Training_loss��AD��*       ����	�򌵋��A�5*

Validation_accuracy��U?�/�&       sO� 	M������A�5*

Validation_loss��BBў�@$       B+�M	�F�����A�5*

Training_lossj�
A���$       B+�M	vn]����A�5*

Training_loss ��Asm�D$       B+�M	�Pź���A�5*

Training_lossxhjA�|�O$       B+�M	�3:����A�5*

Training_loss@�A:�d$       B+�M	$D�����A�5*

Training_losss"A�o$       B+�M	�1�����A�5*

Training_loss �(A{�>$       B+�M	��X����A�5*

Training_lossJ
A�)k�$       B+�M	�pɼ���A�5*

Training_loss�GAІ $       B+�M	)@'����A�5*

Training_lossy�A�k�$       B+�M	�ރ����A�5*

Training_loss�M�@��	$       B+�M	�M潋��A�5*

Training_loss�J�@�uU$       B+�M	+�B����A�5*

Training_loss3�@�$z�$       B+�M	�@�����A�5*

Training_loss<ӄACOk $       B+�M	�_
����A�5*

Training_lossB-2A?�T�$       B+�M	� f����A�5*

Training_loss䌎A|H�$       B+�M	'¿���A�5*

Training_lossQUA��$       B+�M	�L����A�5*

Training_loss�-DA�L*$       B+�M	��z����A�5*

Training_loss�8vAĻB$       B+�M	�<�����A�5*

Training_loss.A�l�<$       B+�M	�,<����A�5*

Training_loss��sA���$       B+�M	������A�5*

Training_loss�AkZU�$       B+�M	h���A�5*

Training_lossR�@ɀ��$       B+�M	��s��A�5*

Training_loss=��@�?�$       B+�M	><���A�5*

Training_loss
='A�Ȓ�$       B+�M	aDË��A�5*

Training_loss�9�AI��$       B+�M	1A�Ë��A�5*

Training_lossp� A] �D$       B+�M	Ll!ċ��A�5*

Training_loss.��A�h$       B+�M	B�ċ��A�5*

Training_loss6&Aӿ�$       B+�M	��ċ��A�5*

Training_loss��WA�Q��$       B+�M	��Gŋ��A�5*

Training_loss�p<A���$       B+�M	�w�ŋ��A�5*

Training_loss��,A���$       B+�M	�>�ŋ��A�5*

Training_loss��BAf�<�$       B+�M	h�ZƋ��A�5*

Training_loss*��A����$       B+�M	DL�Ƌ��A�5*

Training_loss�^�A�	3"$       B+�M	��ǋ��A�5*

Training_loss+A�o5$       B+�M	'0nǋ��A�5*

Training_loss$�QA2���$       B+�M	6�ǋ��A�5*

Training_loss�l�@�x�m$       B+�M	5�Dȋ��A�5*

Training_loss`��@H[$       B+�M	��ȋ��A�5*

Training_loss��.A9��$       B+�M	.�ȋ��A�5*

Training_loss�zdAf��N$       B+�M	7Yɋ��A�5*

Training_loss���Aތd$       B+�M	�ʵɋ��A�5*

Training_loss�`�@�� �$       B+�M	�ʋ��A�5*

Training_lossTRAH7��$       B+�M	�nʋ��A�5*

Training_loss�xkAy�$       B+�M	j��ʋ��A�5*

Training_loss��xA�ܛY$       B+�M	'�$ˋ��A�5*

Training_loss���@:K��$       B+�M	���ˋ��A�5*

Training_loss��AR&|$       B+�M	��ˋ��A�5*

Training_loss�<�@`X��$       B+�M	��9̋��A�5*

Training_loss���@�H6$       B+�M	�̋��A�5*

Training_loss�*�An|!�*       ����	gGf͋��A�5*

Validation_accuracy��U?����&       sO� 	{If͋��A�5*

Validation_loss�.BBO��i$       B+�M	�x�ы��A�5*

Training_lossOh^A=�qW$       B+�M	�c�ы��A�5*

Training_loss�O�A@1h�$       B+�M	�Fҋ��A�5*

Training_loss��#A�>{B$       B+�M	���ҋ��A�5*

Training_loss�6A**�$       B+�M	?��ҋ��A�5*

Training_loss�+�A�)�$       B+�M	C8ZӋ��A�5*

Training_loss��8A���.$       B+�M	U��Ӌ��A�5*

Training_loss�f�AY��$       B+�M	�ԋ��A�5*

Training_loss�WA��?h$       B+�M	�oԋ��A�5*

Training_loss�.A�$       B+�M	5A�ԋ��A�5*

Training_loss �A�H�$       B+�M	$�'Ջ��A�5*

Training_loss��A���c$       B+�M	a�Ջ��A�6*

Training_loss�V9A�W�$       B+�M	��Ջ��A�6*

Training_lossMaJAQ�R�$       B+�M	��;֋��A�6*

Training_loss�AKq�$       B+�M	ӣ�֋��A�6*

Training_loss��1A@�*D$       B+�M	?��֋��A�6*

Training_loss~�<A3c�"$       B+�M	��P׋��A�6*

Training_lossM�8Arz��$       B+�M	���׋��A�6*

Training_loss�i!A]�e	$       B+�M	�B	؋��A�6*

Training_loss�QAId.c$       B+�M	_�e؋��A�6*

Training_loss
�@���$       B+�M	���؋��A�6*

Training_loss%K>A@ӵ$       B+�M	5]ً��A�6*

Training_loss(�ZA;S�$       B+�M	��zً��A�6*

Training_loss��jA���$       B+�M	q�ً��A�6*

Training_lossrsA.��o$       B+�M	6w2ڋ��A�6*

Training_loss�u�A��R�$       B+�M	�܎ڋ��A�6*

Training_loss��%A�F$       B+�M	�w�ڋ��A�6*

Training_loss ��A���$       B+�M	�xHۋ��A�6*

Training_loss��2A�EL$       B+�M	(b�ۋ��A�6*

Training_loss��APߵ�$       B+�M	�V܋��A�6*

Training_loss(�AX*$       B+�M	��]܋��A�6*

Training_loss�4A���b$       B+�M	5$�܋��A�6*

Training_loss��EA��$       B+�M	��݋��A�6*

Training_losseP%A ��$       B+�M	Q3z݋��A�6*

Training_loss��dA�}��$       B+�M	���݋��A�6*

Training_loss��XAh2��$       B+�M	�U1ދ��A�6*

Training_loss��AZ\��$       B+�M	@��ދ��A�6*

Training_lossvAs�Ir$       B+�M	���ދ��A�6*

Training_losswOA��$       B+�M	8KFߋ��A�6*

Training_loss�xAU�?z$       B+�M	�)�ߋ��A�6*

Training_lossL�@�5
c$       B+�M	�8����A�6*

Training_loss�.A�SH$       B+�M	�\]����A�6*

Training_loss�WA;Xs�$       B+�M	������A�6*

Training_lossR�@�'!�$       B+�M	����A�6*

Training_loss[A+��$       B+�M	ҫr���A�6*

Training_loss!]=A���l$       B+�M	>����A�6*

Training_lossg��A}1��$       B+�M	��*���A�6*

Training_loss`�AM6'V$       B+�M	{�����A�6*

Training_loss���@��AE$       B+�M	������A�6*

Training_loss-^#A���$       B+�M	��>���A�6*

Training_loss��bA��	*       ����	�&���A�6*

Validation_accuracy#"V?j%��&       sO� 	)���A�6*

Validation_loss��DBi�tF$       B+�M	?%���A�6*

Training_lossp�8A��}$       B+�M	4ہ���A�6*

Training_loss�PkA)PM$       B+�M	������A�6*

Training_lossN�XA�/�$       B+�M	�:���A�6*

Training_loss2.A�:	O$       B+�M	vT����A�6*

Training_loss�@3J$       B+�M	U����A�6*

Training_lossy�/A=L�$       B+�M	�XO���A�6*

Training_loss��jA�,�_$       B+�M	֫���A�6*

Training_loss��FA��6$       B+�M	:����A�6*

Training_lossd/A{�A$       B+�M	%$f���A�6*

Training_loss��#AA��$       B+�M	������A�6*

Training_loss�:5A����$       B+�M	����A�6*

Training_lossc5A��+�$       B+�M	nk{���A�6*

Training_lossZ�EAF�!m$       B+�M	Q�����A�6*

Training_loss5A3A�KX�$       B+�M	�4���A�6*

Training_lossjmA�$I$       B+�M	B�����A�6*

Training_loss��hA`�m�$       B+�M	������A�6*

Training_loss�hLA�|�Q$       B+�M	��I���A�6*

Training_loss%CmA�e�$       B+�M	汦���A�6*

Training_loss�VA�Bj�$       B+�M	����A�6*

Training_loss� A�`��$       B+�M	 A`���A�6*

Training_loss�dA�\�$       B+�M	�p����A�6*

Training_loss, :A�Ϥ$       B+�M	������A�6*

Training_loss���A��[$       B+�M	Cru����A�6*

Training_loss�~0AD��$       B+�M	�������A�6*

Training_lossv_A�R�$       B+�M	+N-���A�6*

Training_lossD�lAr/�Z$       B+�M	������A�6*

Training_loss�'�Av��G$       B+�M	������A�6*

Training_loss�naAd'��$       B+�M	�B���A�6*

Training_loss�u�@��m4$       B+�M	������A�6*

Training_lossRK&AZ���$       B+�M	������A�6*

Training_loss��6A�q�$       B+�M	�wW���A�6*

Training_loss�pJA�j�o$       B+�M	�b����A�6*

Training_losspu\A�#�$       B+�M	ڎ���A�6*

Training_lossd�-A���O$       B+�M	k�k���A�6*

Training_lossS��A�ǯ�$       B+�M	�����A�6*

Training_loss��Aa�7$       B+�M	N�$����A�6*

Training_loss\kAT�_$       B+�M	�����A�6*

Training_loss�\�@�uJ$       B+�M	�������A�6*

Training_lossșA)��$       B+�M	�9����A�6*

Training_loss��&AN���$       B+�M	�/�����A�6*

Training_loss�GAW~8�$       B+�M	������A�6*

Training_lossr��Ac.�$       B+�M	d�M����A�6*

Training_loss�D>A��$       B+�M	������A�6*

Training_loss9�A��$       B+�M	:�����A�6*

Training_lossW�@�'�3$       B+�M	�b����A�6*

Training_loss�0Aߩ��$       B+�M	�J�����A�6*

Training_lossj]A	�,$       B+�M	Q�����A�6*

Training_lossP%:AA���$       B+�M	��y����A�6*

Training_lossm�@N,�$       B+�M	������A�6*

Training_loss��A��n�*       ����	jٛ����A�6*

Validation_accuracy#"V?f�B&       sO� 	�ۛ����A�6*

Validation_loss��EB���q$       B+�M	�F�����A�6*

Training_lossP�YA���$       B+�M	�%5����A�6*

Training_loss���@I0�$       B+�M	}�����A�6*

Training_loss�0A�I�j$       B+�M	5}�����A�6*

Training_loss��*A2��$       B+�M	��I ���A�6*

Training_loss��LAº"�$       B+�M	�� ���A�6*

Training_loss�8A��M%$       B+�M	�����A�6*

Training_losszA7@yn$       B+�M	�Yi���A�6*

Training_loss��3A�],$       B+�M	�����A�6*

Training_loss�g�@��>l$       B+�M	�/[���A�6*

Training_loss�9�@����$       B+�M	>����A�6*

Training_loss��@����$       B+�M	�����A�6*

Training_loss@YaA���$       B+�M	�n���A�6*

Training_loss�j�@O��6$       B+�M	�����A�6*

Training_loss\�A�|E$       B+�M	u '���A�6*

Training_losslRA�J�$       B+�M	ɋ���A�6*

Training_loss�T+A��8$       B+�M	�^����A�6*

Training_lossZ�[A�-��$       B+�M	J	H���A�6*

Training_loss�A�K)�$       B+�M	������A�6*

Training_loss�A��$       B+�M	�� ���A�6*

Training_loss>�FA�!��$       B+�M	��\���A�6*

Training_loss�	A��$       B+�M	~U����A�6*

Training_loss�?�@�E�$       B+�M	�����A�6*

Training_loss��]A���$       B+�M	˝q���A�6*

Training_loss�1A!.�$       B+�M	����A�6*

Training_loss�	�@�Ѷ�$       B+�M	nh*���A�6*

Training_loss�\5AN[��$       B+�M	�/����A�6*

Training_loss��@�"�V$       B+�M	9�����A�6*

Training_loss>PA5Tn�$       B+�M	*�?	���A�6*

Training_loss�DZA��Y{$       B+�M	���	���A�6*

Training_losswA�Y��$       B+�M	�,�	���A�6*

Training_loss��(A;��($       B+�M	�pT
���A�6*

Training_lossJ�HA0�$       B+�M	��
���A�6*

Training_loss ]SA��$       B+�M	�P���A�6*

Training_lossbaA�Q�$       B+�M	�i���A�6*

Training_loss��;A�T�"$       B+�M	FD����A�6*

Training_loss�"A_4�?$       B+�M	Ԃ ���A�6*

Training_loss��A�{�$       B+�M	�|���A�6*

Training_loss��A�
q$       B+�M	�(����A�6*

Training_loss�#=Aj))�$       B+�M	�4���A�7*

Training_lossFr*A�>�)$       B+�M	kԐ���A�7*

Training_lossp�KAX��$       B+�M	a�����A�7*

Training_loss�]�A���$       B+�M	��H���A�7*

Training_loss��A*��$       B+�M	�5����A�7*

Training_loss�A���$       B+�M	:w���A�7*

Training_lossjyA�W�b$       B+�M	��]���A�7*

Training_loss���A�b��$       B+�M	Ի����A�7*

Training_loss��A)�Oe$       B+�M	$*���A�7*

Training_loss�4A���d$       B+�M	:r���A�7*

Training_lossb�@�I��$       B+�M	�����A�7*

Training_loss��gA�!�*       ����	�����A�7*

Validation_accuracy��U?��R&       sO� 	�����A�7*

Validation_lossH8DB��$       B+�M	g'����A�7*

Training_loss�A'Wa�$       B+�M	I�4���A�7*

Training_loss.6DA��$       B+�M	�T����A�7*

Training_loss�"AT���$       B+�M	J�����A�7*

Training_lossX"DA=�$       B+�M	��K���A�7*

Training_loss�4A���$       B+�M	k�����A�7*

Training_lossb�5A2@s�$       B+�M	If���A�7*

Training_loss�}lA�>=�$       B+�M	k+b���A�7*

Training_lossV�A9�h�$       B+�M	�þ���A�7*

Training_lossk�aA���$       B+�M	�P���A�7*

Training_loss��A�$       B+�M	\ w���A�7*

Training_loss|��A�ɬ$       B+�M	�(����A�7*

Training_loss��oA���^$       B+�M	И0���A�7*

Training_lossn�jA��<$       B+�M	������A�7*

Training_lossL;A����$       B+�M	O����A�7*

Training_lossI�LA�1]�$       B+�M	p\E���A�7*

Training_loss�Z$A�z��$       B+�M	r����A�7*

Training_loss��A4Q�$       B+�M	�0����A�7*

Training_loss�LAxKd|$       B+�M	��Z���A�7*

Training_loss��<A]t�2$       B+�M	X�����A�7*

Training_lossS��A*$��$       B+�M	����A�7*

Training_loss��A��sO$       B+�M	�5q���A�7*

Training_loss��[AǱ��$       B+�M	�L����A�7*

Training_loss�mmA�?��$       B+�M	D�*���A�7*

Training_loss!w#A]h%�$       B+�M	�y����A�7*

Training_loss��A�3f@$       B+�M	������A�7*

Training_lossϥvA4vr$       B+�M	��@���A�7*

Training_loss��\Aկ`�$       B+�M	�[����A�7*

Training_loss���@���$       B+�M	3P����A�7*

Training_loss�:AS���$       B+�M	��X ���A�7*

Training_loss� A+��$       B+�M	�� ���A�7*

Training_loss�-)A4�{$       B+�M	��!���A�7*

Training_lossk�:A�c�x$       B+�M	X�n!���A�7*

Training_lossc�EA���_$       B+�M	0��!���A�7*

Training_losse=LA;��E$       B+�M	�("���A�7*

Training_loss�+@Au��$       B+�M	LÄ"���A�7*

Training_lossG̫@9֬y$       B+�M	�(�"���A�7*

Training_lossH�Ag��9$       B+�M	KY>#���A�7*

Training_loss]�RA!FI�$       B+�M	��#���A�7*

Training_loss!� A� �$       B+�M	3S�#���A�7*

Training_loss'�Ao��$       B+�M	�R$���A�7*

Training_loss��A7L'$       B+�M	&R�$���A�7*

Training_loss��cA_��1$       B+�M	��
%���A�7*

Training_loss��.A�g�$       B+�M	�Zg%���A�7*

Training_loss�@��ѡ$       B+�M	)��%���A�7*

Training_loss9��@)�~e$       B+�M	��&���A�7*

Training_loss[F<A�Ά$       B+�M	�|&���A�7*

Training_loss��RA���$       B+�M	P�&���A�7*

Training_loss4=;Aߦvx$       B+�M	�|5'���A�7*

Training_loss��eA�D*�$       B+�M	�'���A�7*

Training_loss��A��7l*       ����	�Wc(���A�7*

Validation_accuracy��U?�{&       sO� 	�Zc(���A�7*

Validation_loss�GCB�}$       B+�M	M��,���A�7*

Training_loss��8A�	J�$       B+�M	[D4-���A�7*

Training_loss&�LA�W�$       B+�M	�-���A�7*

Training_loss>�#A���X$       B+�M	��-���A�7*

Training_lossD��@ⅱ
$       B+�M	��H.���A�7*

Training_lossna�@t�*�$       B+�M	B@�.���A�7*

Training_loss�>iA��?�$       B+�M	Y�/���A�7*

Training_lossb`A���j$       B+�M	�^/���A�7*

Training_loss��/AW�n$       B+�M	fݺ/���A�7*

Training_lossR�@AZ���$       B+�M	�0���A�7*

Training_loss8A���}$       B+�M	��r0���A�7*

Training_loss��LA���$       B+�M	���0���A�7*

Training_loss�N�@�Je_$       B+�M	�^*1���A�7*

Training_loss�+A���$       B+�M	�+�1���A�7*

Training_lossBV-Ak�8$       B+�M	�1���A�7*

Training_loss;�A�lO$       B+�M	e�?2���A�7*

Training_lossOs%A�)N$       B+�M	�.�2���A�7*

Training_loss2�	Aw��$       B+�M	A��2���A�7*

Training_loss0�Af�`J$       B+�M	��S3���A�7*

Training_lossO��A�?2�$       B+�M	�3���A�7*

Training_loss�*BA`��($       B+�M	�
4���A�7*

Training_loss0� A���$       B+�M	�dh4���A�7*

Training_loss� AU٨-$       B+�M	��4���A�7*

Training_lossn?�A� 1�$       B+�M	հ 5���A�7*

Training_loss*n�A�ӷ$       B+�M	��}5���A�7*

Training_loss��
A��@$       B+�M	���5���A�7*

Training_loss5�@&q�a$       B+�M	��66���A�7*

Training_loss�'Ao�%.$       B+�M	io�6���A�7*

Training_loss�m�A4)L�$       B+�M	�6�6���A�7*

Training_loss��A_!ˉ$       B+�M	RK7���A�7*

Training_loss���@� �$       B+�M	�B�7���A�7*

Training_loss��TA`��$       B+�M	�38���A�7*

Training_lossɅ�@���$       B+�M	Ǻ^8���A�7*

Training_lossp6An�T_$       B+�M	��8���A�7*

Training_lossN�A!�4$       B+�M	�9���A�7*

Training_lossR�A���[$       B+�M	�r9���A�7*

Training_loss�;AMK��$       B+�M	)y�9���A�7*

Training_loss��@1�=$       B+�M	$�+:���A�7*

Training_lossDA�uV$       B+�M	:̆:���A�7*

Training_loss�SYA4[�$       B+�M	/m�:���A�7*

Training_loss���@`Z��$       B+�M	ݖ?;���A�7*

Training_loss|�A�2�$       B+�M	�f�;���A�7*

Training_lossh]}A(�Տ$       B+�M	�y�;���A�7*

Training_loss���@����$       B+�M	@�U<���A�7*

Training_loss$�HA*�>$       B+�M	�U�<���A�7*

Training_loss��'A$���$       B+�M	]�=���A�7*

Training_loss�$A�n�$       B+�M	̶i=���A�7*

Training_loss~AqF�$       B+�M	�S�=���A�7*

Training_lossL�@��) $       B+�M	��">���A�7*

Training_loss��
Ag�ۥ$       B+�M	n�~>���A�7*

Training_loss�Apq#*       ����	lvC?���A�7*

Validation_accuracy#"V?uM&A&       sO� 	JyC?���A�7*

Validation_loss]MKB��$       B+�M	�{zC���A�7*

Training_loss^�9A�\�"$       B+�M	���C���A�7*

Training_loss�4A%���$       B+�M	23D���A�7*

Training_lossH<A���$       B+�M	@O�D���A�7*

Training_lossV�9A�^�$       B+�M	���D���A�7*

Training_loss���@ȝ(�$       B+�M	f�GE���A�7*

Training_loss��:A���s$       B+�M	f/�E���A�7*

Training_lossF%�@{&N�$       B+�M	ٕ F���A�7*

Training_loss��A3�fx$       B+�M	��\F���A�7*

Training_loss��RA�^l$       B+�M	fܸF���A�7*

Training_lossuF�@�s�+$       B+�M	kG���A�7*

Training_lossl��@!{A�$       B+�M	A�qG���A�7*

Training_loss>k�@���$       B+�M	~��G���A�7*

Training_loss^�!A͚Y$       B+�M	�0*H���A�7*

Training_loss�D4A*��w$       B+�M	2ˆH���A�7*

Training_loss\`�A�'V�$       B+�M	m�H���A�7*

Training_loss�;SA�o�M$       B+�M	�~?I���A�7*

Training_loss�GA�8m�$       B+�M	�כI���A�8*

Training_loss�X A��$       B+�M	��I���A�8*

Training_lossr��A�$       B+�M	؛UJ���A�8*

Training_loss�IA�*�E$       B+�M	:�J���A�8*

Training_loss�~&A��-$       B+�M	*�K���A�8*

Training_loss`��A
C�$       B+�M	�iK���A�8*

Training_loss`BA[���$       B+�M	��K���A�8*

Training_lossZ!A*�� $       B+�M	�|"L���A�8*

Training_loss~a,A_�$       B+�M	A�~L���A�8*

Training_loss��A��'$       B+�M	F}�L���A�8*

Training_loss��QAѤ�l$       B+�M	��7M���A�8*

Training_lossSԫ@]ۢ�$       B+�M	���M���A�8*

Training_loss�Ay��$       B+�M	�X�M���A�8*

Training_loss^�A��$       B+�M	�MN���A�8*

Training_loss�aA�x��$       B+�M	��N���A�8*

Training_loss��A!��l$       B+�M	9�O���A�8*

Training_loss��5A� �6$       B+�M	�M`O���A�8*

Training_loss��=A&�2$       B+�M	y�O���A�8*

Training_loss��@���1$       B+�M	I0P���A�8*

Training_lossTA�t�$       B+�M	0tP���A�8*

Training_loss8'A�H={$       B+�M	oE�P���A�8*

Training_loss�SA�!W$       B+�M	��,Q���A�8*

Training_loss �@�)�i$       B+�M	ϡ�Q���A�8*

Training_lossF=[A5��$       B+�M	�'�Q���A�8*

Training_loss��@s��$       B+�M	��@R���A�8*

Training_loss<�-AX�O$       B+�M	J�R���A�8*

Training_loss�A��"!$       B+�M	V��R���A�8*

Training_loss��9AcOBy$       B+�M	aWS���A�8*

Training_lossJ A,TDM$       B+�M	���S���A�8*

Training_loss;�@���|$       B+�M	�T���A�8*

Training_loss��@�H�$       B+�M	!�mT���A�8*

Training_loss�*�@���$       B+�M	G��T���A�8*

Training_loss8D+A���$       B+�M	-!&U���A�8*

Training_loss���A�\b�*       ����	E��U���A�8*

Validation_accuracy#"V?"/!x&       sO� 	j��U���A�8*

Validation_loss(lHBZitn$       B+�M	�tZ���A�8*

Training_loss��As#6X$       B+�M	���Z���A�8*

Training_loss,�%A c9�$       B+�M	�a,[���A�8*

Training_lossP��@&ī�$       B+�M	���[���A�8*

Training_lossw��A>��$       B+�M	L��[���A�8*

Training_lossKA�f�r$       B+�M	��B\���A�8*

Training_loss�HDA0�~�$       B+�M	9E�\���A�8*

Training_lossH��@�]��$       B+�M	���\���A�8*

Training_loss=X�@����$       B+�M	n2X]���A�8*

Training_lossj9�@�=7$       B+�M	�³]���A�8*

Training_loss�@5bƩ$       B+�M	�K^���A�8*

Training_loss��WA��ʜ$       B+�M	��k^���A�8*

Training_loss�JIA?�$       B+�M	r�^���A�8*

Training_loss��DA�O��$       B+�M	\9$_���A�8*

Training_loss�oA�:!M$       B+�M	Fy�_���A�8*

Training_loss�1�A$       B+�M	�_���A�8*

Training_loss��kA��x$       B+�M	�8`���A�8*

Training_loss��@Ǟ�$       B+�M	qs�`���A�8*

Training_loss�~bA6�\h$       B+�M	(��`���A�8*

Training_loss:��@���]$       B+�M	D�Na���A�8*

Training_lossi�A�b�$       B+�M	�#�a���A�8*

Training_loss{�
A�ץ�$       B+�M	�b���A�8*

Training_lossy^�A�fB$       B+�M	�db���A�8*

Training_loss��fA��*$       B+�M	#k�b���A�8*

Training_loss���@ĿUv$       B+�M	%c���A�8*

Training_losse��@T=��$       B+�M	Q�yc���A�8*

Training_loss�A�-X�$       B+�M	�_�c���A�8*

Training_loss�A�Z�$       B+�M	�,2d���A�8*

Training_loss�XBA�E��$       B+�M	�/�d���A�8*

Training_loss�-6A��N$       B+�M	���d���A�8*

Training_loss�FA\fG$       B+�M	��Ge���A�8*

Training_lossbb9A�; �$       B+�M	B��e���A�8*

Training_loss��@5i|*$       B+�M	���e���A�8*

Training_loss�dA�5��$       B+�M	�\f���A�8*

Training_loss��@雛y$       B+�M	�b�f���A�8*

Training_loss(�A ���$       B+�M	2g���A�8*

Training_lossLVA���$       B+�M	�qg���A�8*

Training_loss�m�@��Ư$       B+�M	k��g���A�8*

Training_lossEj�@����$       B+�M	��)h���A�8*

Training_loss�AP��$       B+�M	E��h���A�8*

Training_loss�PAk��$       B+�M	#�h���A�8*

Training_loss1S0A*���$       B+�M	0�=i���A�8*

Training_loss�WAWԏ�$       B+�M	��i���A�8*

Training_loss��@I~'$       B+�M	i��i���A�8*

Training_loss9"�Am�$       B+�M	��Qj���A�8*

Training_loss��5A�j��$       B+�M	1�j���A�8*

Training_loss���A�l�f$       B+�M	}?
k���A�8*

Training_loss�A�܈�$       B+�M	�ufk���A�8*

Training_loss;�@,M $       B+�M	P��k���A�8*

Training_loss�sA�b�_$       B+�M	�l���A�8*

Training_loss>v4A��j�*       ����	�H�l���A�8*

Validation_accuracyxwV?��S/&       sO� 	
K�l���A�8*

Validation_loss��KB��-�$       B+�M	I�5q���A�8*

Training_loss�A�P�$       B+�M	�8�q���A�8*

Training_loss��A���$$       B+�M	>w�q���A�8*

Training_loss�dAh~�$       B+�M	niKr���A�8*

Training_loss�_PA�� $       B+�M	4��r���A�8*

Training_loss�'�@gr�$       B+�M	��s���A�8*

Training_lossN�NA�#z$       B+�M	��ms���A�8*

Training_lossׯ�A&��}$       B+�M	��s���A�8*

Training_loss5ԕ@&�$       B+�M	�B1t���A�8*

Training_loss�03A�H��$       B+�M	zo�t���A�8*

Training_loss�<�@p(�$       B+�M	��t���A�8*

Training_loss#~A�c�z$       B+�M	˞Gu���A�8*

Training_loss_t!At��:$       B+�M	N�u���A�8*

Training_loss�oA��$       B+�M	B'v���A�8*

Training_lossz�EA���$       B+�M	8�_v���A�8*

Training_loss)A�u1�$       B+�M	{�v���A�8*

Training_loss��@��V�$       B+�M	d;w���A�8*

Training_loss�A4�$       B+�M	[�tw���A�8*

Training_loss*�@�]ku$       B+�M	d��w���A�8*

Training_losssA#?~o$       B+�M	%�,x���A�8*

Training_lossH�BA��J�$       B+�M	�u�x���A�8*

Training_lossBA���	$       B+�M	�_�x���A�8*

Training_loss��A
��A$       B+�M	Ay���A�8*

Training_lossAʽ%�$       B+�M	���y���A�8*

Training_loss�@����$       B+�M	?��y���A�8*

Training_lossc LAճ	�$       B+�M	��Wz���A�8*

Training_loss��4A^���$       B+�M	Ӈ�z���A�8*

Training_loss�b�@3�/$       B+�M	Ii{���A�8*

Training_loss�[ A����$       B+�M	Pl{���A�8*

Training_loss���@�^$       B+�M		��{���A�8*

Training_lossruA��]$       B+�M	J%|���A�8*

Training_loss�b A���$       B+�M	���|���A�8*

Training_loss��A��}C$       B+�M	���|���A�8*

Training_loss"7A��;$       B+�M	�9}���A�8*

Training_loss@�TA�TQ�$       B+�M	�"�}���A�8*

Training_loss��RA��($       B+�M	e��}���A�8*

Training_loss,� A>�$       B+�M	7�L~���A�8*

Training_loss���@:���$       B+�M	V�~���A�8*

Training_loss�/�A#�ƞ$       B+�M	4����A�8*

Training_loss(�JAU<��$       B+�M	{�b���A�8*

Training_loss� "A��̖$       B+�M	-����A�8*

Training_lossV<9Ay�`�$       B+�M	m����A�8*

Training_lossB��@%��K$       B+�M	�]w����A�8*

Training_loss��A�*��$       B+�M	uӀ���A�8*

Training_loss�'A��l�$       B+�M	�Q0����A�8*

Training_loss~�8A��h�$       B+�M	�������A�9*

Training_loss���@ܗ� $       B+�M	��灌��A�9*

Training_loss�z@A1��0$       B+�M	�D����A�9*

Training_loss���@;5M�$       B+�M	t�����A�9*

Training_loss��)AA�9�$       B+�M	�����A�9*

Training_loss�99A�E�<*       ����	�_�����A�9*

Validation_accuracy��U?7*a�&       sO� 	�b�����A�9*

Validation_loss��FBM&��$       B+�M	�18����A�9*

Training_loss�g�AuZ�~$       B+�M	������A�9*

Training_loss��@ֿf�$       B+�M	a����A�9*

Training_lossՔmAoO�$       B+�M	�N����A�9*

Training_loss��Ay�~q$       B+�M	` �����A�9*

Training_loss�	�@�\�$       B+�M	�]����A�9*

Training_loss�[A���&$       B+�M	bc����A�9*

Training_lossvG�@��L$       B+�M	~8�����A�9*

Training_loss 3A�X�$       B+�M	@N����A�9*

Training_losshV�@�_.$       B+�M	7x����A�9*

Training_loss��A���$       B+�M	�ԋ���A�9*

Training_loss�lA(Bs8$       B+�M	�W0����A�9*

Training_loss]�AҦ�S$       B+�M	�?�����A�9*

Training_loss*��@�Z�$       B+�M	�9錌��A�9*

Training_loss���@ܫަ$       B+�M	�`E����A�9*

Training_loss���@ߌ��$       B+�M	�������A�9*

Training_loss�A �w�$       B+�M	������A�9*

Training_loss��A%�I�$       B+�M	�AZ����A�9*

Training_loss*�A��$       B+�M	c������A�9*

Training_loss�I)A���$       B+�M	7�����A�9*

Training_loss�RA��C$       B+�M	P�p����A�9*

Training_loss̺"A̾$:$       B+�M	xz͏���A�9*

Training_loss-�@A���$       B+�M	0�*����A�9*

Training_loss*�nAQۿ�$       B+�M	������A�9*

Training_loss�y:A�1�\$       B+�M	a�㐌��A�9*

Training_loss�5�@�U#$       B+�M	�g@����A�9*

Training_loss�&Al#w}$       B+�M	�������A�9*

Training_loss<�TA�<dp$       B+�M	U�����A�9*

Training_lossq A0Xf�$       B+�M	��U����A�9*

Training_loss[�TA����$       B+�M	u������A�9*

Training_loss ~AH��$       B+�M	ܡ����A�9*

Training_loss�@�4�$       B+�M	9
k����A�9*

Training_loss4�1A��_�$       B+�M	�~Ǔ���A�9*

Training_loss�1AJ�"}$       B+�M	jO$����A�9*

Training_lossn��@k{I_$       B+�M	�������A�9*

Training_loss�NAѲ8$       B+�M	�ݔ���A�9*

Training_loss`��@����$       B+�M	��8����A�9*

Training_loss���@�p߻$       B+�M	�������A�9*

Training_loss�=A��
$       B+�M	�����A�9*

Training_lossR:A��Tl$       B+�M	�M����A�9*

Training_loss��Ai[BO$       B+�M	;p�����A�9*

Training_losst�>A��$       B+�M	�2����A�9*

Training_loss��@��rc$       B+�M	8Hb����A�9*

Training_loss��`A~)U�$       B+�M	^�����A�9*

Training_lossX�5A|��$       B+�M	������A�9*

Training_loss��@���$       B+�M	�%{����A�9*

Training_loss{�A
�c$       B+�M	�ט���A�9*

Training_loss��LA�ۯI$       B+�M	�~3����A�9*

Training_loss
A"o��$       B+�M	�p�����A�9*

Training_lossΥ�@��9Z$       B+�M	�왌��A�9*

Training_loss&�A�==*       ����	]������A�9*

Validation_accuracy��U?	�&       sO� 	ӈ�����A�9*

Validation_loss�GB��Yj$       B+�M	R_=����A�9*

Training_loss�V�@W�Z$       B+�M	�����A�9*

Training_loss֊zA>�$       B+�M	s������A�9*

Training_loss�	A��=�$       B+�M	fR����A�9*

Training_loss �A]!*�$       B+�M	#�����A�9*

Training_loss�z.A=�J�$       B+�M	������A�9*

Training_loss"�EA�A�$       B+�M	=(h����A�9*

Training_loss�'A��&$       B+�M	�
ġ���A�9*

Training_loss��'A�d�$       B+�M	�, ����A�9*

Training_lossX{SA&��$       B+�M	$�|����A�9*

Training_loss40A��?G$       B+�M	�*٢���A�9*

Training_lossp��@$�Y�$       B+�M	��4����A�9*

Training_loss;��@Ԟ@�$       B+�M	]������A�9*

Training_loss^MAi]�$       B+�M	�?��A�9*

Training_loss%�A��$       B+�M	�8J����A�9*

Training_loss�EA ��i$       B+�M	|Ѧ����A�9*

Training_loss��x@"ܱ�$       B+�M	����A�9*

Training_loss�4A���C$       B+�M	��^����A�9*

Training_loss]�YA�w$       B+�M	 ������A�9*

Training_loss-{A�W3$       B+�M	D����A�9*

Training_loss�:Am�?�$       B+�M	;t����A�9*

Training_loss��'A?4�$       B+�M	DmЦ���A�9*

Training_loss��-A�F`�$       B+�M	��,����A�9*

Training_loss �&A�i�$       B+�M	㈧���A�9*

Training_loss�A^e.�$       B+�M	`䧌��A�9*

Training_loss[O(A}`ʩ$       B+�M	@3@����A�9*

Training_loss�g�@��3$       B+�M	�C�����A�9*

Training_loss�
�@3��$       B+�M	�������A�9*

Training_loss�A_�i`$       B+�M	 	U����A�9*

Training_loss��*A4���$       B+�M	�"�����A�9*

Training_loss�IA�Ȅ=$       B+�M	�[����A�9*

Training_lossq�@��$       B+�M	Q/k����A�9*

Training_loss�A`�"$       B+�M	��ƪ���A�9*

Training_loss��A[� 	$       B+�M	��"����A�9*

Training_loss�w�A���;$       B+�M	�����A�9*

Training_loss��@��(�$       B+�M	n�۫���A�9*

Training_loss�xA�X�$       B+�M	��7����A�9*

Training_lossy|k@�%Ƴ$       B+�M	�:�����A�9*

Training_lossG,!AHv?$       B+�M	�?���A�9*

Training_lossm�A=m#p$       B+�M	��N����A�9*

Training_loss��A�1A�$       B+�M	o������A�9*

Training_loss�'A��Gj$       B+�M	�F����A�9*

Training_loss}��@�e��$       B+�M	Q�d����A�9*

Training_loss�NA �$       B+�M	�q�����A�9*

Training_loss�K,A�CD�$       B+�M	g�����A�9*

Training_loss�A��$       B+�M	H1y����A�9*

Training_loss*��@��$       B+�M	�կ���A�9*

Training_loss��'A��z�$       B+�M	(F1����A�9*

Training_loss��@�tF<$       B+�M	U������A�9*

Training_loss,AΈ��$       B+�M	I�鰌��A�9*

Training_loss(��@u�*       ����	^������A�9*

Validation_accuracy��U?���&       sO� 	�������A�9*

Validation_loss{3GB�"�$       B+�M	�h����A�9*

Training_loss��A�92�$       B+�M	F#x����A�9*

Training_lossbCVApJO�$       B+�M	:ն���A�9*

Training_lossn�GA���$       B+�M	�2����A�9*

Training_loss^��@`W�$       B+�M	�N�����A�9*

Training_loss��7As4g$       B+�M	�귌��A�9*

Training_lossT�AG�y>$       B+�M	�F����A�9*

Training_loss�%%AKx�,$       B+�M	�������A�9*

Training_lossP�@�Fy�$       B+�M	Ze�����A�9*

Training_lossE��AH��$       B+�M	?�Y����A�9*

Training_lossV#�@�� $       B+�M	Lݵ����A�9*

Training_loss�.�A���h$       B+�M	������A�9*

Training_loss��'A+��$       B+�M	�n����A�9*

Training_lossV�A(6�A$       B+�M	o�ʺ���A�9*

Training_loss���@���^$       B+�M	��&����A�9*

Training_loss�GA�ZP$       B+�M	������A�9*

Training_loss2��AG�X$       B+�M	�&߻���A�9*

Training_loss:DA4�:�$       B+�M	l;����A�9*

Training_loss�hHA탯$       B+�M	�×����A�9*

Training_lossK2A�M'e$       B+�M	������A�9*

Training_loss�|HA+�։$       B+�M	��O����A�9*

Training_loss	��@�"�$       B+�M	�h�����A�9*

Training_loss"�3A�z�$       B+�M	Y����A�9*

Training_lossZ>AHV��$       B+�M	&Qk����A�:*

Training_loss�3AI�$       B+�M	�_Ǿ���A�:*

Training_loss�c=An�s�$       B+�M	5#����A�:*

Training_loss�5Ax��[$       B+�M	t�����A�:*

Training_loss#D�@�p$       B+�M	T�ۿ���A�:*

Training_loss�=A��}�$       B+�M	ް7����A�:*

Training_loss��3A���K$       B+�M	�E�����A�:*

Training_loss%[�@�^x$       B+�M	ȕ�����A�:*

Training_loss�A010($       B+�M	��L����A�:*

Training_loss�W&A2]K$       B+�M	I������A�:*

Training_loss(�XA<P�u$       B+�M	� ��A�:*

Training_loss�p�@��$       B+�M	�6a��A�:*

Training_loss�]fA�E�$       B+�M	Ed���A�:*

Training_lossl�A�`_U$       B+�M	۾Ì��A�:*

Training_loss��@���$       B+�M	FvÌ��A�:*

Training_loss��A�rW�$       B+�M	��Ì��A�:*

Training_loss��aA��n_$       B+�M	k�-Č��A�:*

Training_loss�)A���$       B+�M	���Č��A�:*

Training_loss�6�@^�+�$       B+�M	�p�Č��A�:*

Training_lossx �@��$       B+�M	l�BŌ��A�:*

Training_loss�K�@[��w$       B+�M	�-�Ō��A�:*

Training_loss�r�@��`�$       B+�M	���Ō��A�:*

Training_lossY}@��$       B+�M	/Wƌ��A�:*

Training_loss�%ATZ��$       B+�M	ͬ�ƌ��A�:*

Training_loss��<A��ȑ$       B+�M	`ǌ��A�:*

Training_loss���@���$       B+�M	�Nlǌ��A�:*

Training_losstyAr��r$       B+�M	�ǌ��A�:*

Training_loss+ A6{<'*       ����	l��Ȍ��A�:*

Validation_accuracy��V?e*�&       sO� 	���Ȍ��A�:*

Validation_loss�
NB$$       B+�M	m�̌��A�:*

Training_loss��qAS���$       B+�M	�Q͌��A�:*

Training_loss��A�C�$       B+�M	��͌��A�:*

Training_lossЏAy�9M$       B+�M	0d	Ό��A�:*

Training_loss�7A:���$       B+�M	
�eΌ��A�:*

Training_lossCA�x�A$       B+�M	(��Ό��A�:*

Training_loss?� Aw�1($       B+�M	�[ό��A�:*

Training_loss��@����$       B+�M	m�zό��A�:*

Training_loss@|iA�E�$       B+�M	P��ό��A�:*

Training_loss&A[&$       B+�M	��2Ќ��A�:*

Training_loss���@�̬�$       B+�M	w܎Ќ��A�:*

Training_loss���@}`�m$       B+�M	�R�Ќ��A�:*

Training_loss4GAlK<V$       B+�M	ެGь��A�:*

Training_loss���@Y��[$       B+�M	���ь��A�:*

Training_loss��A;6v�$       B+�M	���ь��A�:*

Training_loss��@jm�$       B+�M	E�[Ҍ��A�:*

Training_loss� �@��r�$       B+�M	��Ҍ��A�:*

Training_loss!�ALr$       B+�M	`�ӌ��A�:*

Training_loss5��@	o�D$       B+�M	DLqӌ��A�:*

Training_loss;#AI�*$       B+�M	1_�ӌ��A�:*

Training_loss��ZAb*��$       B+�M	r�)Ԍ��A�:*

Training_loss��#A��$       B+�M	؅Ԍ��A�:*

Training_loss�Ax��$       B+�M	E��Ԍ��A�:*

Training_loss��\A�X�N$       B+�M	�6?Ռ��A�:*

Training_loss���@zW�$       B+�M	���Ռ��A�:*

Training_loss���A��I�$       B+�M	&�Ռ��A�:*

Training_loss��A :T?$       B+�M	�!T֌��A�:*

Training_loss��@'"e$       B+�M	1$�֌��A�:*

Training_lossV\�@l3�$       B+�M	G�׌��A�:*

Training_loss��6A�Ɲ�$       B+�M	Q�g׌��A�:*

Training_lossxdA�6�v$       B+�M	�d�׌��A�:*

Training_loss���@�'�$       B+�M		،��A�:*

Training_loss�[EA�3 $       B+�M	�S{،��A�:*

Training_loss�s�@�G%$       B+�M	��،��A�:*

Training_loss�P�@`ˎ�$       B+�M	�2ٌ��A�:*

Training_loss	�@z*�$       B+�M	��ٌ��A�:*

Training_lossB�kA +bT$       B+�M	f��ٌ��A�:*

Training_lossHu�@k�R$       B+�M	xFHڌ��A�:*

Training_loss�6A�ۛ^$       B+�M	�ƣڌ��A�:*

Training_lossѣA_q)�$       B+�M	���ڌ��A�:*

Training_loss���@�M�p$       B+�M	�2\ی��A�:*

Training_loss��WA��>U$       B+�M	̗�ی��A�:*

Training_lossr�@`#7$       B+�M	/�܌��A�:*

Training_loss,�7A8H�$       B+�M	غq܌��A�:*

Training_loss(%A�dO$       B+�M	Ui�܌��A�:*

Training_loss{��@�`��$       B+�M	�L*݌��A�:*

Training_loss6OA�+�K$       B+�M	�)�݌��A�:*

Training_loss�:
AH���$       B+�M	rp�݌��A�:*

Training_loss�MAp�|�$       B+�M	]3?ތ��A�:*

Training_loss�7A���$       B+�M	���ތ��A�:*

Training_loss��GA�L�,*       ����	��`ߌ��A�:*

Validation_accuracy��V?��&       sO� 	��`ߌ��A�:*

Validation_loss�BOB�9#$       B+�M	�����A�:*

Training_loss2j�A��+�$       B+�M	üD���A�:*

Training_loss�6�@�|�$       B+�M	�;����A�:*

Training_loss��@��I$       B+�M	�a����A�:*

Training_loss0A���T$       B+�M	��Y���A�:*

Training_loss�b�A����$       B+�M	�ص���A�:*

Training_loss\�mA�Z�H$       B+�M	����A�:*

Training_loss��A�ݳ$       B+�M	dn���A�:*

Training_lossqA�`R$       B+�M	ŏ����A�:*

Training_losslb8A���A$       B+�M	��%���A�:*

Training_loss�t�@���$       B+�M	@/����A�:*

Training_lossd�@�$$       B+�M	�
����A�:*

Training_loss�|A�9�$       B+�M	�8���A�:*

Training_loss�AOAY���$       B+�M	$G����A�:*

Training_lossL�2A��($       B+�M	c_����A�:*

Training_loss�IA/eh$       B+�M	�=M���A�:*

Training_loss��XA	}��$       B+�M	U�����A�:*

Training_loss8�AO��U$       B+�M	4���A�:*

Training_lossr�WA�װ$       B+�M	�Tb���A�:*

Training_loss�J$A�&c$       B+�M	������A�:*

Training_lossd�@A7��r$       B+�M	����A�:*

Training_loss�%A5�er$       B+�M	|v���A�:*

Training_loss�%�@��][$       B+�M	������A�:*

Training_lossJ�Acd��$       B+�M	�-���A�:*

Training_loss���@�)l$       B+�M	c+����A�:*

Training_loss���@�_��$       B+�M	�Y����A�:*

Training_lossB4A/@�$       B+�M	�QA���A�:*

Training_loss��A�<�$       B+�M	�ל���A�:*

Training_loss��qA�N�*$       B+�M	����A�:*

Training_lossV��@Be$       B+�M	�\U���A�:*

Training_loss9S�@ys-$       B+�M	�����A�:*

Training_loss ��@qp!$       B+�M	�����A�:*

Training_loss��@��g�$       B+�M	h���A�:*

Training_loss��A��$       B+�M	������A�:*

Training_lossj�;A0��7$       B+�M	>�����A�:*

Training_loss:�qA�զ�$       B+�M	�|����A�:*

Training_loss�P�As�;�$       B+�M	�������A�:*

Training_loss�-�@a"��$       B+�M	Y�3���A�:*

Training_losskt�@R�\W$       B+�M	�&����A�:*

Training_loss���Af�ԕ$       B+�M	AJ����A�:*

Training_lossr�A�\�$       B+�M	O�H���A�:*

Training_lossVDA�(��$       B+�M	ɫ����A�:*

Training_loss���@1!V$       B+�M	<����A�:*

Training_loss���@�[�$       B+�M	O�^���A�:*

Training_loss˼�@���$       B+�M	������A�:*

Training_lossq�A#f*>$       B+�M	 ����A�:*

Training_loss�Aª�$       B+�M	�4r���A�:*

Training_lossN�%Ad�&�$       B+�M	�����A�:*

Training_loss.�,AW*�F$       B+�M	b�)����A�:*

Training_loss=��@Ɠ$       B+�M	ݙ�����A�:*

Training_loss?)"A��)*       ����	(�G����A�:*

Validation_accuracy��V?���&       sO� 	��G����A�:*

Validation_loss�`LB����$       B+�M	[?�����A�:*

Training_loss�G A�=R$       B+�M	�`/����A�;*

Training_loss�aIA h��$       B+�M	������A�;*

Training_lossԀiAӰ�h$       B+�M	�!�����A�;*

Training_loss���@��w$       B+�M	CD����A�;*

Training_lossC�@��{$       B+�M	������A�;*

Training_lossΉA���$       B+�M	6x�����A�;*

Training_loss�I�@3'o$       B+�M	��X����A�;*

Training_loss�#�@��.�$       B+�M	�c�����A�;*

Training_lossJ�As!�$       B+�M	KZ����A�;*

Training_loss�A����$       B+�M	^l����A�;*

Training_loss�f�@��\�$       B+�M	�Z�����A�;*

Training_loss�fA;f�$       B+�M	�z$����A�;*

Training_loss�HAc�$       B+�M	+n�����A�;*

Training_loss?%A��n�$       B+�M	=G�����A�;*

Training_lossa�	A*p��$       B+�M	��9 ���A�;*

Training_loss��@��:<$       B+�M	}� ���A�;*

Training_lossˉ�@�\e$       B+�M	x�� ���A�;*

Training_lossm(A֯T�$       B+�M	d�L���A�;*

Training_loss��
A9�!M$       B+�M	S>����A�;*

Training_loss��@�f�$       B+�M	[}���A�;*

Training_loss��@Q|��$       B+�M	��_���A�;*

Training_loss&@A�#��$       B+�M	�����A�;*

Training_loss��$AN��$       B+�M	����A�;*

Training_lossF�~ACD%E$       B+�M	�rs���A�;*

Training_loss�07A�RG$       B+�M	U����A�;*

Training_loss�w A�.��$       B+�M	��*���A�;*

Training_loss�VA�st�$       B+�M	�!����A�;*

Training_loss�HA��;&$       B+�M	������A�;*

Training_loss���@Bb��$       B+�M	�b>���A�;*

Training_loss�T6A���$       B+�M	 �����A�;*

Training_loss�{%A�{�o$       B+�M	k����A�;*

Training_losst�[A|���$       B+�M	cR���A�;*

Training_loss�B^Axtu$       B+�M	%����A�;*

Training_loss�6[A��}g$       B+�M	rR
���A�;*

Training_losse5�@�E>$       B+�M	%�f���A�;*

Training_loss��sA,��$       B+�M	������A�;*

Training_loss��TA�P$       B+�M	�A���A�;*

Training_lossd�@{6A�$       B+�M	)�z���A�;*

Training_lossRC�@��n$       B+�M	F�����A�;*

Training_loss�~A�Q�Z$       B+�M	$F>	���A�;*

Training_lossg��@����$       B+�M	�	���A�;*

Training_lossH��@�*�$       B+�M	���	���A�;*

Training_loss]�6A�S�0$       B+�M	�|Q
���A�;*

Training_loss±�@MC�&$       B+�M	q�
���A�;*

Training_lossw?�@�R�-$       B+�M	0,	���A�;*

Training_loss��kAj��0$       B+�M	��d���A�;*

Training_loss i�@g�B$       B+�M	_a����A�;*

Training_lossV �?�R�-$       B+�M	a����A�;*

Training_loss���@pƎ$       B+�M	HNx���A�;*

Training_loss�f A�Y��*       ����	p�<���A�;*

Validation_accuracy��V?�Z"&       sO� 	��<���A�;*

Validation_lossLB1-�U$       B+�M	�����A�;*

Training_lossFLAƢk�$       B+�M	s_���A�;*

Training_loss&�AO�h$       B+�M	o����A�;*

Training_loss��qA���$       B+�M	�<���A�;*

Training_loss���@Jɬ�$       B+�M	��r���A�;*

Training_loss>9A�M�$       B+�M	�	����A�;*

Training_lossX�@	�+$       B+�M	�F+���A�;*

Training_loss�9�@���$       B+�M	. ����A�;*

Training_lossHjAwn�$       B+�M	{�����A�;*

Training_loss��At��l$       B+�M	�@���A�;*

Training_loss�-AK[�V$       B+�M	������A�;*

Training_loss<� Az��$       B+�M	������A�;*

Training_loss��rA�y�z$       B+�M	_~U���A�;*

Training_loss�`�@B��o$       B+�M	������A�;*

Training_loss?�@�Ix�$       B+�M	c~���A�;*

Training_loss��kA��B�$       B+�M	�i���A�;*

Training_loss��:A�c_W$       B+�M	Uh����A�;*

Training_loss��@��$       B+�M	�!���A�;*

Training_loss:�5A����$       B+�M	$(}���A�;*

Training_loss �@�(��$       B+�M	D�����A�;*

Training_losshT%AꎽC$       B+�M	$5���A�;*

Training_loss?�:A���4$       B+�M	�F����A�;*

Training_lossļ�@H�4$       B+�M	�����A�;*

Training_loss�lQA5���$       B+�M	o�I���A�;*

Training_loss�� AC�"$       B+�M	@�����A�;*

Training_loss+pA#�],$       B+�M	c� ���A�;*

Training_losst9(A/�ţ$       B+�M	�b]���A�;*

Training_loss��f@:���$       B+�M	@����A�;*

Training_loss~K5A�B^/$       B+�M	����A�;*

Training_loss��A��$       B+�M	i�q���A�;*

Training_loss�4�@(U2�$       B+�M	�J����A�;*

Training_lossX��@H��C$       B+�M	�)���A�;*

Training_loss��A�hl�$       B+�M	Ή����A�;*

Training_loss�qA����$       B+�M	k�����A�;*

Training_lossA��z$       B+�M	+�<���A�;*

Training_loss�݊A�!��$       B+�M	�h����A�;*

Training_loss.��@ 6	�$       B+�M	�}����A�;*

Training_loss>��@�#�$       B+�M	��P���A�;*

Training_lossQ�_A�<�$       B+�M	������A�;*

Training_loss�v8A��7e$       B+�M	�� ���A�;*

Training_loss%�A(��$       B+�M	͓j ���A�;*

Training_loss4Aes,$       B+�M	�� ���A�;*

Training_loss�A`B��$       B+�M	P#!���A�;*

Training_lossC�@Wj�$       B+�M	�t!���A�;*

Training_loss���@C$       B+�M	��!���A�;*

Training_loss��$A��N$       B+�M	��6"���A�;*

Training_loss��@� �F$       B+�M	F�"���A�;*

Training_lossz�@�pU8$       B+�M	Q��"���A�;*

Training_loss�GXA0p�P$       B+�M	�*J#���A�;*

Training_loss���@>/�*       ����	�o$���A�;*

Validation_accuracy��U?5��!&       sO� 	Tr$���A�;*

Validation_loss��JB� �