       �K"	   �Q��Abrain.Event:2��5Su7     ,4+3	Ǽ)�Q��A"��
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
: "#�p}\     ��#	!C�Q��AJ�
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
output/b_out:0output/b_out/Assignoutput/b_out/read:0�#�1#       ��wC	 A��Q��A*

Training_loss��(C�Ò�#       ��wC	4=�Q��A*

Training_loss��}C��L�#       ��wC	���Q��A*

Training_loss�#�CE�4#       ��wC	}��Q��A*

Training_loss #iCM#U[#       ��wC	IGY�Q��A*

Training_lossQyeC��V�#       ��wC	���Q��A*

Training_loss��.CM���#       ��wC	���Q��A*

Training_lossj<>C ׵�#       ��wC	��p�Q��A*

Training_loss�rCF���#       ��wC	T���Q��A	*

Training_loss�D[C<�(�#       ��wC	W@B�Q��A
*

Training_loss�_C���#       ��wC	���Q��A*

Training_loss�DC.)�#       ��wC	�v��Q��A*

Training_loss��qC��#       ��wC	��_ R��A*

Training_loss���C�7�#       ��wC	�� R��A*

Training_lossִ�C� �#       ��wC	�. R��A*

Training_loss7��CY� �#       ��wC	\��R��A*

Training_loss1\|Cs��#       ��wC	*��R��A*

Training_loss>!=C�w�#       ��wC	igR��A*

Training_loss�C��ֱ#       ��wC	+��R��A*

Training_lossn�VC�?|G#       ��wC	�*?R��A*

Training_lossMϟC+X�#       ��wC	_ѝR��A*

Training_loss��wC��j�#       ��wC	�R��A*

Training_loss
CC�#�\#       ��wC	)�bR��A*

Training_loss2�C���#       ��wC	�e�R��A*

Training_loss-��C,ͬ�#       ��wC	@2R��A*

Training_loss�a�C�q�#       ��wC	��|R��A*

Training_lossl$C�e��#       ��wC	�.�R��A*

Training_loss��cCUSQ#       ��wC	�G9R��A*

Training_loss�4CCL��#       ��wC	�R��A*

Training_loss,ybC~h��#       ��wC	���R��A*

Training_lossP�_C�Kظ#       ��wC	��[R��A*

Training_loss(}SC=&�#       ��wC	
��R��A *

Training_loss5�3Cчp�#       ��wC	��SR��A!*

Training_loss2�SC&ԥw#       ��wC	���R��A"*

Training_lossz�uCE!�#       ��wC	�R	R��A#*

Training_loss�j�C�v�}#       ��wC	_�	R��A$*

Training_loss��GCH2��#       ��wC	��I
R��A%*

Training_loss*�yCFpE#       ��wC	���
R��A&*

Training_lossB�=C���#       ��wC	[$<R��A'*

Training_loss��@C�p��#       ��wC	�ֲR��A(*

Training_lossd݃C�O��#       ��wC	d�)R��A)*

Training_lossv�nC0�z)#       ��wC	���R��A**

Training_loss�P�CBM��#       ��wC	
�R��A+*

Training_loss��jC�M�#       ��wC	��R��A,*

Training_loss��/Cd���#       ��wC	��R��A-*

Training_loss��KC$�#       ��wC	,��R��A.*

Training_loss��qC�j��#       ��wC	5AR��A/*

Training_loss��lCeP$#       ��wC	�G�R��A0*

Training_loss:�]C���r#       ��wC	W# R��A1*

Training_lossжoCҠ=�#       ��wC	(exR��A2*

Training_loss�PmC��)       7�_ 	80tR��A2*

Validation_accuracywv8?���%       �6�	L3tR��A2*

Validation_loss�ЩBY��#       ��wC	�G3R��A3*

Training_loss�1Ca��#       ��wC	␫R��A4*

Training_loss���CҬ�#       ��wC	%w!R��A5*

Training_loss��qC���#       ��wC	�R��A6*

Training_loss�_aC$T��#       ��wC	��R��A7*

Training_lossv(_C�s��#       ��wC	
��R��A8*

Training_loss>>CK҆�#       ��wC	ɪ	R��A9*

Training_loss(�CRn9d#       ��wC	B�~R��A:*

Training_loss�,AC�&w�#       ��wC	2��R��A;*

Training_loss[KC��#       ��wC	�jR��A<*

Training_losscb>C���-#       ��wC	|��R��A=*

Training_loss
�C�!8�#       ��wC	�__R��A>*

Training_loss�oC$Ԋ#       ��wC	��R��A?*

Training_loss�OQC���#       ��wC	^�WR��A@*

Training_loss�KC�g�#       ��wC	�R��AA*

Training_loss�F�Cx�t;#       ��wC	 NR��AB*

Training_loss��>C"�Z#       ��wC	�#�R��AC*

Training_lossEFqCye �#       ��wC	D=R��AD*

Training_loss �VC8�gT#       ��wC	�;�R��AE*

Training_lossp�OC� 8�#       ��wC	��+R��AF*

Training_losswRgC)���#       ��wC	q��R��AG*

Training_loss�sWC��T#       ��wC	�"R��AH*

Training_loss!�^C��d�#       ��wC	Dj�R��AI*

Training_loss
M�C�5�1#       ��wC	��R��AJ*

Training_loss�NC_{��#       ��wC	��R��AK*

Training_losst�CY�d�#       ��wC	�XR��AL*

Training_loss1�YCX�#       ��wC	'�vR��AM*

Training_loss�؄C�[D6#       ��wC	m�R��AN*

Training_loss	�PCtl�#       ��wC	HOdR��AO*

Training_loss~=Cm�r\#       ��wC	ܛ�R��AP*

Training_loss_C�~Q#       ��wC	��Q R��AQ*

Training_loss��eC�`_h#       ��wC	�� R��AR*

Training_loss��BCL�t#       ��wC	�%E!R��AS*

Training_lossvlwC1��A#       ��wC	�*�!R��AT*

Training_loss&XQC�`�o#       ��wC	֫8"R��AU*

Training_loss�scCh��#       ��wC	��"R��AV*

Training_loss�:UC�L�#       ��wC	�p(#R��AW*

Training_loss�!XC@��5#       ��wC	��#R��AX*

Training_loss�^Cw��#       ��wC	֫"$R��AY*

Training_lossp2iC[d�#       ��wC	�`�$R��AZ*

Training_loss��JC�rƨ#       ��wC	C%R��A[*

Training_loss>�XCu�#       ��wC	ro�%R��A\*

Training_lossJʔC�Pd�#       ��wC	�w&R��A]*

Training_loss��eCW-�.#       ��wC	jK�&R��A^*

Training_loss��-C��=�#       ��wC	u['R��A_*

Training_loss��4CtL
#       ��wC	��'R��A`*

Training_loss�0QCB�.t#       ��wC	4(R��Aa*

Training_loss�cC�2��#       ��wC	��|(R��Ab*

Training_loss
�jC|xi#       ��wC	�`�(R��Ac*

Training_loss�#VCL'ޞ#       ��wC	�]m)R��Ad*

Training_lossd|WC,���)       7�_ 	�jd*R��Ad*

Validation_accuracy��<?t�J%       �6�	�qd*R��Ad*

Validation_loss-��Bj�3�#       ��wC	;4$+R��Ae*

Training_loss�9C�E;�#       ��wC	]��+R��Af*

Training_loss��BC�fC�#       ��wC	mp,R��Ag*

Training_lossf�`C��Bp#       ��wC	m�,R��Ah*

Training_lossz�ZC�A[�#       ��wC	6-R��Ai*

Training_loss~�:C��w#       ��wC	ނ-R��Aj*

Training_loss\�mC���#       ��wC	}u.R��Ak*

Training_loss7KPC�9u�#       ��wC	�y.R��Al*

Training_loss�=C�1#       ��wC	:��.R��Am*

Training_loss��-C�fJ#       ��wC	�7a/R��An*

Training_lossN8mC_��#       ��wC	�6�/R��Ao*

Training_lossr�MC ]�#       ��wC	`�Q0R��Ap*

Training_loss� C�V�#       ��wC	���0R��Aq*

Training_loss�KC�B�#       ��wC	7E1R��Ar*

Training_loss�h.C���#       ��wC	�v�1R��As*

Training_loss"Y)Ca�#       ��wC	��>2R��At*

Training_lossd�mC�u��#       ��wC	�	�2R��Au*

Training_loss��TC)C`:#       ��wC	�q33R��Av*

Training_loss@C�J �#       ��wC	W_�3R��Aw*

Training_loss��@CǙ�#       ��wC	m,4R��Ax*

Training_lossC�[Ru#       ��wC	_)�4R��Ay*

Training_loss"=Cz|��#       ��wC	t�!5R��Az*

Training_loss��,C��#       ��wC	�r�5R��A{*

Training_loss´8C�I-r#       ��wC	!v6R��A|*

Training_loss��;C�_�E#       ��wC	��6R��A}*

Training_loss!�BC�w��#       ��wC	m� 7R��A~*

Training_lossv�3C�VN�#       ��wC	`�}7R��A*

Training_loss׍LCS�	$       B+�M	���7R��A�*

Training_loss�zDC�Gzf$       B+�M	z�o8R��A�*

Training_lossPECqr^�$       B+�M	�r�8R��A�*

Training_loss0�*C\6��$       B+�M	��f9R��A�*

Training_loss�xWC��a$       B+�M	���9R��A�*

Training_loss��%C���$       B+�M	:=\:R��A�*

Training_loss5�8Cp��+$       B+�M	b-�:R��A�*

Training_loss�XC�.�c$       B+�M	��Z;R��A�*

Training_loss�cC�۳$       B+�M	V�;R��A�*

Training_loss��GClg@$       B+�M	�R<R��A�*

Training_loss�PC�G��$       B+�M	�(�<R��A�*

Training_loss��PCY��$       B+�M	�<P=R��A�*

Training_lossn5eCY��$       B+�M	��=R��A�*

Training_loss��DC��x�$       B+�M	��J>R��A�*

Training_loss�NC]�t$       B+�M	.��>R��A�*

Training_loss�YZCsp�B$       B+�M	T�F?R��A�*

Training_loss�Cۓ��$       B+�M	��?R��A�*

Training_loss�PC��$       B+�M	�I?@R��A�*

Training_lossHLC5D�$       B+�M	�@R��A�*

Training_loss�aC�9&*$       B+�M	��7AR��A�*

Training_lossn~C%K��$       B+�M	���AR��A�*

Training_loss�?C���7$       B+�M	m�1BR��A�*

Training_lossTXCG
=$       B+�M	)��BR��A�*

Training_loss��"CA�X*       ����	\:�CR��A�*

Validation_accuracy��??4�.�&       sO� 	B>�CR��A�*

Validation_loss��B�t3�$       B+�M	�oDR��A�*

Training_loss�6C%b��$       B+�M	�_�DR��A�*

Training_loss��@CRvoF$       B+�M	z�fER��A�*

Training_loss�8BC�b7-$       B+�M	)��ER��A�*

Training_lossޞ+C@��i$       B+�M	
-XFR��A�*

Training_loss-?QCDK�$       B+�M	��FR��A�*

Training_loss 8CAM=K$       B+�M	��JGR��A�*

Training_loss�><C�jD$       B+�M	���GR��A�*

Training_loss�aC����$       B+�M	�S@HR��A�*

Training_loss���Bn��$       B+�M	��HR��A�*

Training_loss�{,CLi�$       B+�M	� @IR��A�*

Training_losskbC�/�[$       B+�M	)��IR��A�*

Training_loss�LC��7�$       B+�M	x^.JR��A�*

Training_loss�@LCzA�A$       B+�M	�`�JR��A�*

Training_lossdlC0>~A$       B+�M	1"KR��A�*

Training_loss4.KCn/b�$       B+�M	B�KR��A�*

Training_loss�yQC��>�$       B+�M	 LR��A�*

Training_lossd�Ca]:�$       B+�M	x��LR��A�*

Training_loss(A/C��y!$       B+�M	�jMR��A�*

Training_loss��?C�%�$       B+�M	k(�MR��A�*

Training_lossτ C���$       B+�M	�UNR��A�*

Training_loss�iC��Q�$       B+�M	ໃNR��A�*

Training_loss?OC�Us$       B+�M	^��NR��A�*

Training_loss��+C+h$       B+�M	£oOR��A�*

Training_loss�k-C�;��$       B+�M	s��OR��A�*

Training_loss| >C,0 $       B+�M	�`PR��A�*

Training_loss��(C�&2~$       B+�M	�=�PR��A�*

Training_loss�EC~�$L$       B+�M	�cYQR��A�*

Training_loss��'CI�
g$       B+�M	��QR��A�*

Training_loss��*C�S�$       B+�M	�xbRR��A�*

Training_loss��FC'x�$       B+�M	��RR��A�*

Training_loss�AC��_$       B+�M	��nSR��A�*

Training_loss��=C�6*$       B+�M	l%�SR��A�*

Training_loss�KC��,H$       B+�M	AwTR��A�*

Training_lossc�6C�$�$       B+�M	���TR��A�*

Training_loss�MCW��$       B+�M	,�nUR��A�*

Training_loss0�UC-Q�a$       B+�M	)��UR��A�*

Training_loss��,C^%�$       B+�M	E�`VR��A�*

Training_loss�WBC,�m�$       B+�M	�,�VR��A�*

Training_loss��CF���$       B+�M	G8GWR��A�*

Training_lossE�:C8�c�$       B+�M	��WR��A�*

Training_loss�NC�P!R$       B+�M		�AXR��A�*

Training_loss�NC��4�$       B+�M	���XR��A�*

Training_loss�jC���$       B+�M	}]BYR��A�*

Training_loss3n7C����$       B+�M	U��YR��A�*

Training_loss8+C�O?�$       B+�M	nl9ZR��A�*

Training_loss�4C��T_$       B+�M	ꑸZR��A�*

Training_lossQ|UC?ǒ�$       B+�M	��3[R��A�*

Training_loss�}QC ��$       B+�M	Oʳ[R��A�*

Training_loss8�\C�5I$       B+�M	��2\R��A�*

Training_loss�FC�^S�*       ����	��8]R��A�*

Validation_accuracy��A?l&       sO� 	��8]R��A�*

Validation_loss��B��I$       B+�M	�u^R��A�*

Training_loss�vTC_T1�$       B+�M	!�^R��A�*

Training_loss�FCX<�$       B+�M	%��^R��A�*

Training_loss�WJC�q��$       B+�M	�cz_R��A�*

Training_loss�E$C��$       B+�M	��_R��A�*

Training_loss�UCq�$       B+�M	?�p`R��A�*

Training_loss��5C�5�T$       B+�M	9~�`R��A�*

Training_loss�4Cu�u$       B+�M	��caR��A�*

Training_loss�k\CP�=i$       B+�M	\V�aR��A�*

Training_losscWKC�{[�$       B+�M	��fbR��A�*

Training_lossLY#C�P1.$       B+�M	�5�bR��A�*

Training_loss�"C�V�[$       B+�M	y�ZcR��A�*

Training_loss�Y-C����$       B+�M	ʤ�cR��A�*

Training_loss^�+CE�� $       B+�M	OZRdR��A�*

Training_loss��C7=�$       B+�M	{��dR��A�*

Training_loss�-Cm8��$       B+�M	U�BeR��A�*

Training_loss<D,C��0$       B+�M	���eR��A�*

Training_loss��'C��˸$       B+�M	%><fR��A�*

Training_loss�gCo�q$       B+�M	���fR��A�*

Training_lossZ YCX�$       B+�M	R*gR��A�*

Training_loss��@C�+��$       B+�M	vݠgR��A�*

Training_loss��WCI�ϟ$       B+�M	��hR��A�*

Training_lossO�GC��S�$       B+�M	8��hR��A�*

Training_lossP�-CF�@?$       B+�M	m<iR��A�*

Training_loss_��C�&�$       B+�M	c��iR��A�*

Training_lossӹC)H }$       B+�M	���iR��A�*

Training_loss,�C��G$       B+�M	��sjR��A�*

Training_loss�C�
at$       B+�M	5��jR��A�*

Training_loss��bCț$       B+�M	j�ZkR��A�*

Training_lossY�%C�C$�$       B+�M	?p�kR��A�*

Training_loss�KC'��-$       B+�M	�tLlR��A�*

Training_loss -C݃�$       B+�M	���lR��A�*

Training_lossK�9C8���$       B+�M	$
BmR��A�*

Training_loss�[�B���$       B+�M	a3�mR��A�*

Training_lossXHC�m$       B+�M	�n;nR��A�*

Training_loss}o5C�}�t$       B+�M	���nR��A�*

Training_loss�kCI���$       B+�M	��'oR��A�*

Training_loss2�SC@&�$       B+�M	$��oR��A�*

Training_loss�&C�}�$       B+�M	�[&pR��A�*

Training_loss�)C��b�$       B+�M	�2�pR��A�*

Training_lossR(HC���$       B+�M	��qR��A�*

Training_lossR�C�C1$       B+�M	�E�qR��A�*

Training_lossV�JC��]$       B+�M	�rR��A�*

Training_lossu5C�
$       B+�M	RԊrR��A�*

Training_loss��KC<&�$       B+�M	��sR��A�*

Training_loss�TSC�/q$       B+�M	�}sR��A�*

Training_loss5>RC�E;X$       B+�M	�(�sR��A�*

Training_loss�vC��\�$       B+�M	a�wtR��A�*

Training_loss(@C�=�W$       B+�M	2X�tR��A�*

Training_loss��1C ���$       B+�M	��kuR��A�*

Training_loss�0Ci�R�*       ����	��kvR��A�*

Validation_accuracy��@?á��&       sO� 	Q�kvR��A�*

Validation_lossl�B��Ϻ$       B+�M	��RwR��A�*

Training_lossV�3CX �$       B+�M	��wR��A�*

Training_lossvg5C��7$       B+�M	.�?xR��A�*

Training_lossgTC���n$       B+�M	X�xR��A�*

Training_loss�SYC�$�W$       B+�M	�&yR��A�*

Training_lossC�'�$       B+�M	nn�yR��A�*

Training_loss �YC+`�%$       B+�M	R�zR��A�*

Training_loss��TCz/�|$       B+�M	�G�zR��A�*

Training_loss/dCOh��$       B+�M	�.�zR��A�*

Training_lossj�ICΝ��$       B+�M	��i{R��A�*

Training_loss%�HC6X$       B+�M	)��{R��A�*

Training_loss��"C����$       B+�M	�pR|R��A�*

Training_loss�fC��yv$       B+�M	���|R��A�*

Training_loss��>C	���$       B+�M	G8}R��A�*

Training_loss��=C�%�$       B+�M	�p�}R��A�*

Training_loss$2C<;i$       B+�M	W@/~R��A�*

Training_loss��C��<O$       B+�M	���~R��A�*

Training_losst�2C#��B$       B+�M	�"R��A�*

Training_lossXCC�QoH$       B+�M	]j�R��A�*

Training_loss�01C��1$       B+�M	W��R��A�*

Training_loss:�XC��NV$       B+�M	���R��A�*

Training_loss��(Ce���$       B+�M	�R��A�*

Training_lossdr*C��e�$       B+�M	l��R��A�*

Training_lossXtCd�Y$       B+�M	��R��A�*

Training_loss��FCnץ$       B+�M	Q�v�R��A�*

Training_loss�a.Cc�&$       B+�M	���R��A�*

Training_loss��PCs��$       B+�M	(�`�R��A�*

Training_loss}/CD�"$       B+�M	�փR��A�*

Training_lossR8C�eSa$       B+�M	��J�R��A�*

Training_loss"�Co�K�$       B+�M	���R��A�*

Training_loss"�
C��>$       B+�M	x�:�R��A�*

Training_lossӭ	C��Y�$       B+�M	����R��A�*

Training_loss`MC�A�X$       B+�M	�B2�R��A�*

Training_lossSOC�\N$       B+�M	-w��R��A�*

Training_lossFN:C��]$       B+�M	a�(�R��A�*

Training_loss�f�B-�7G$       B+�M	����R��A�*

Training_loss8C?��$       B+�M	��R��A�*

Training_loss|*1C�'�$       B+�M	Ե��R��A�*

Training_lossb�C�m�4$       B+�M	��R��A�*

Training_loss��C���v$       B+�M	]���R��A�*

Training_loss�+BCKH�$       B+�M	 ���R��A�*

Training_loss��;CG^�$       B+�M	y }�R��A�*

Training_loss�*&C�=�$       B+�M	I��R��A�*

Training_loss/'C��I\$       B+�M	�n�R��A�*

Training_lossR2C�*$       B+�M	W`�R��A�*

Training_loss�5hC1"ң$       B+�M	�A[�R��A�*

Training_loss��PC��]�$       B+�M	y"ЌR��A�*

Training_lossG�EC�EF�$       B+�M	�G�R��A�*

Training_loss��JC���u$       B+�M	ZōR��A�*

Training_loss�ECZ>�7$       B+�M	��A�R��A�*

Training_loss
C3�!*       ����	!�9�R��A�*

Validation_accuracy��C?��]F&       sO� 	-�9�R��A�*

Validation_loss�6�B���$       B+�M	v�*�R��A�*

Training_loss��C��"�$       B+�M	����R��A�*

Training_loss��#CJ�4#$       B+�M	��R��A�*

Training_loss�^:C��$       B+�M	;��R��A�*

Training_loss�7�B
*��$       B+�M	!s�R��A�*

Training_loss��4C����$       B+�M	F���R��A�*

Training_losss� CS{HH$       B+�M	?�
�R��A�*

Training_loss��ZC�ۯb$       B+�M	q��R��A�*

Training_loss�C}��$       B+�M	�0��R��A�*

Training_loss�W;C;K\$       B+�M	��p�R��A�*

Training_loss��:C�F�$       B+�M	���R��A�*

Training_loss�IeC���y$       B+�M	�i�R��A�*

Training_loss�BCXܥ�$       B+�M	���R��A�*

Training_loss��`C7�HH$       B+�M	�mY�R��A�*

Training_loss�iC\z$       B+�M	]QԖR��A�*

Training_lossR	C��Cn$       B+�M	��Q�R��A�*

Training_loss��C��N$       B+�M	V�̗R��A�*

Training_loss��#CP��\$       B+�M	K>F�R��A�*

Training_lossҫ"C]�ӑ$       B+�M	����R��A�*

Training_loss�q7C�˅0$       B+�M	�8�R��A�*

Training_lossw+iC֔c$       B+�M	$���R��A�*

Training_loss�cC��b-$       B+�M	մ'�R��A�*

Training_lossz5=C9��$       B+�M	~䝚R��A�*

Training_loss>mCR@�$       B+�M	���R��A�*

Training_loss��6C��>$       B+�M	���R��A�*

Training_lossF}(Ch��$       B+�M	t'�R��A�*

Training_loss��.C�]�`$       B+�M	����R��A�*

Training_loss(NC{ �$       B+�M	���R��A�*

Training_loss�:QC�x�0$       B+�M	��z�R��A�*

Training_losst�C��R$       B+�M	dt��R��A�*

Training_loss	"C�Q�$       B+�M	_'t�R��A�*

Training_lossu=C��<�$       B+�M	/o�R��A�*

Training_loss���B�f�$       B+�M	&�\�R��A�*

Training_loss��C"���$       B+�M	O�ןR��A�*

Training_lossv�2C@��$       B+�M	JBO�R��A�*

Training_loss\f#C�b`$       B+�M	(�ɠR��A�*

Training_lossr�;C\��$       B+�M	�!D�R��A�*

Training_lossaWTC�,r$       B+�M	FD��R��A�*

Training_loss�C䇫�$       B+�M	K=�R��A�*

Training_loss��Cg�r$       B+�M	)���R��A�*

Training_loss`3C	D��$       B+�M	�l/�R��A�*

Training_loss�]:C�i�$       B+�M	ɓ��R��A�*

Training_loss��C�ﴪ$       B+�M	�)�R��A�*

Training_loss�AC����$       B+�M	J$��R��A�*

Training_lossl';C|m�$       B+�M	�� �R��A�*

Training_loss�(CYr!�$       B+�M	� ��R��A�*

Training_loss0�HC��ka$       B+�M	���R��A�*

Training_lossJ�%C[Sc�$       B+�M	�Ք�R��A�*

Training_loss�#CMr�$       B+�M	pA	�R��A�*

Training_lossЦC�xM$       B+�M	�P��R��A�*

Training_loss���B9��a*       ����	pz��R��A�*

Validation_accuracy��B?.��&       sO� 	j���R��A�*

Validation_loss�w�Bm� o$       B+�M	N�R��A�*

Training_loss�C��[$       B+�M	s���R��A�*

Training_lossf�C�˽5$       B+�M		k�R��A�*

Training_loss�7"C�V�$       B+�M	��ުR��A�*

Training_lossA	Ct-)�$       B+�M	�T�R��A�*

Training_loss�qkCkㅣ$       B+�M	ö˫R��A�*

Training_loss4�C>�$       B+�M	UKK�R��A�*

Training_loss��?C,sSW$       B+�M	]���R��A�*

Training_loss%�C�Kt]$       B+�M	X:�R��A�*

Training_loss&e/C�kok$       B+�M	��R��A�*

Training_losswUC\ir�$       B+�M	��/�R��A�*

Training_lossl�C��9;$       B+�M	���R��A�*

Training_loss�0C�q�q$       B+�M	2$�R��A�*

Training_loss�+C/u�$$       B+�M	�!��R��A�*

Training_loss�!C�D�$       B+�M	��R��A�*

Training_loss8�(C�Rop$       B+�M	a��R��A�*

Training_loss�NEC�B�j$       B+�M	h%�R��A�*

Training_lossn�C��8B$       B+�M	��}�R��A�*

Training_loss��<C	_G$       B+�M	�$��R��A�*

Training_loss���BvN�$       B+�M	3�m�R��A�*

Training_loss�bC�B�$       B+�M	�D�R��A�*

Training_loss�HCk��$       B+�M	8,\�R��A�*

Training_loss��8C�Dw$       B+�M	@�ԳR��A�*

Training_loss��C|.�$       B+�M	�J�R��A�*

Training_lossAzC�AJ�$       B+�M	mt��R��A�*

Training_loss�	 C:�1$       B+�M	��8�R��A�*

Training_loss�Cڱ��$       B+�M	Z��R��A�*

Training_lossj�Cz�D$       B+�M	b�,�R��A�*

Training_loss}Y;C�}�$       B+�M	�ʦ�R��A�*

Training_lossT�cC�$j$       B+�M	"�R��A�*

Training_loss�vC��&$       B+�M	�痷R��A�*

Training_loss�~�B��zo$       B+�M	�
�R��A�*

Training_loss�`C��f$       B+�M	!\{�R��A�*

Training_loss��hCC�$       B+�M	�*��R��A�*

Training_loss��0CK��b$       B+�M	@g�R��A�*

Training_loss>!C��`$       B+�M	yW�R��A�*

Training_loss��C�M��$       B+�M	F�`�R��A�*

Training_loss#]:Cz��5$       B+�M	��ںR��A�*

Training_loss���B�V$       B+�M	еU�R��A�*

Training_lossm�"Ct��$       B+�M	�ZѻR��A�*

Training_loss�O�B�D�e$       B+�M	QjZ�R��A�*

Training_lossP[C絧G$       B+�M	;��R��A�*

Training_loss�7&C$�t$       B+�M	�_�R��A�*

Training_loss��C���$       B+�M	�!ݽR��A�*

Training_loss�O�B���$       B+�M	��P�R��A�*

Training_loss�=C��<$       B+�M	�uʾR��A�*

Training_loss�CeЪ�$       B+�M	N�B�R��A�*

Training_loss�
1C��.f$       B+�M	xҺ�R��A�*

Training_loss��1C��
�$       B+�M	�	5�R��A�*

Training_loss��,C�և$       B+�M	�=��R��A�*

Training_loss8$Cvs�*       ����	�]��R��A�*

Validation_accuracy��C?�tq&       sO� 	�f��R��A�*

Validation_loss��B�7w$       B+�M	^f��R��A�*

Training_lossB�C�i$       B+�M	��8�R��A�*

Training_lossn3&C�E��$       B+�M	b-��R��A�*

Training_lossl�0C�]Fa$       B+�M	�W�R��A�*

Training_loss��JC=#�$       B+�M	���R��A�*

Training_lossaC� �$       B+�M	�a_�R��A�*

Training_lossT�C7�$       B+�M	%x��R��A�*

Training_loss�CV�$       B+�M	��K�R��A�*

Training_loss��B.��a$       B+�M	h���R��A�*

Training_lossI C�s˪$       B+�M	��G�R��A�*

Training_loss�	C��/$       B+�M	���R��A�*

Training_loss�,4C��+|$       B+�M	zU>�R��A�*

Training_loss�NCj#=$       B+�M	8���R��A�*

Training_loss��'CY4�$       B+�M	�8�R��A�*

Training_loss��>C�-y�$       B+�M	�'��R��A�*

Training_loss�
\C���	$       B+�M	|�1�R��A�*

Training_loss"CoD�g$       B+�M	+i��R��A�*

Training_loss\�
C�O`$       B+�M	�n"�R��A�*

Training_lossFeC�\�$       B+�M	Ui��R��A�*

Training_loss�$C��$       B+�M	*��R��A�*

Training_lossxC��$       B+�M	��R��A�*

Training_loss��<CK��`$       B+�M	��R��A�*

Training_loss��"CV��$       B+�M	��~�R��A�*

Training_loss�@C`�$       B+�M	:���R��A�*

Training_loss$�C'N$       B+�M	8kp�R��A�*

Training_loss�;#C1��B$       B+�M	&��R��A�*

Training_loss��"Cw��B$       B+�M	q�c�R��A�*

Training_loss�C A�$       B+�M	�J��R��A�*

Training_loss@�C ��$       B+�M	ywV�R��A�*

Training_lossh?&C�v&7$       B+�M	����R��A�*

Training_loss�MC# r$       B+�M	��I�R��A�*

Training_loss�'�B��0\$       B+�M	3��R��A�*

Training_loss�C�uj$$       B+�M	�QC�R��A�*

Training_lossW�Ct
��$       B+�M	�ӽ�R��A�*

Training_loss��#C��OY$       B+�M	]�6�R��A�*

Training_loss�?�B{	|�$       B+�M	p���R��A�*

Training_loss¯GCZ�3�$       B+�M	�7�R��A�*

Training_lossr�C0��$       B+�M	����R��A�*

Training_lossC����$       B+�M	_@/�R��A�*

Training_lossxo.CLd��$       B+�M	>���R��A�*

Training_loss=ZC5�$       B+�M	ML$�R��A�*

Training_loss�BC�}�$       B+�M	�۔�R��A�*

Training_loss��C�0�$       B+�M	?8�R��A�*

Training_loss%}C��'�$       B+�M	�z�R��A�*

Training_loss�%C󈖣$       B+�M	�I��R��A�*

Training_loss*&+C�c�H$       B+�M	�;a�R��A�*

Training_loss���B��$       B+�M	m���R��A�*

Training_loss��CUW��$       B+�M	��E�R��A�*

Training_loss�zC�Ѩ$       B+�M	.u��R��A�*

Training_lossJ5C8}�$       B+�M	,*�R��A�*

Training_loss�+CVܒ�*       ����	��R��A�*

Validation_accuracy��D?�:�&       sO� 	b�R��A�*

Validation_loss�0�BUOe�$       B+�M	�-�R��A�*

Training_lossl\#C��D$       B+�M	�y�R��A�*

Training_lossXC�b<`$       B+�M	��R��A�*

Training_loss��B3=t�$       B+�M	��w�R��A�*

Training_loss=�
C=z�J$       B+�M	� ��R��A�*

Training_loss�#C�a��$       B+�M	u��R��A�*

Training_loss��C���$       B+�M		�R��A�*

Training_loss$8C�X$       B+�M	˻��R��A�*

Training_loss�C��$       B+�M	g��R��A�*

Training_loss�%Cj5i�$       B+�M	�с�R��A�*

Training_loss��	C5�wU$       B+�M	����R��A�*

Training_lossc��B�pl$       B+�M	2p�R��A�*

Training_loss��B�b�$       B+�M	-���R��A�*

Training_lossx�B�K�$       B+�M	��U�R��A�*

Training_loss�lCA��a$       B+�M	�A��R��A�*

Training_loss��&C��NY$       B+�M	�^e�R��A�*

Training_loss�oC�Ÿ�$       B+�M	����R��A�*

Training_lossU�*Cl~ 	$       B+�M	�nq�R��A�*

Training_lossѺ�B�q�$       B+�M	�_��R��A�*

Training_lossO0C��$       B+�M	��h�R��A�*

Training_loss���B;��$       B+�M	l���R��A�*

Training_loss{�GC�G$       B+�M	�`�R��A�*

Training_loss~�C���$       B+�M	���R��A�*

Training_lossءC¨4�$       B+�M	�e�R��A�*

Training_loss(�Ctd�$       B+�M	�#��R��A�*

Training_loss@&CF��$       B+�M	��Z�R��A�*

Training_loss�j
C�s$$       B+�M	e��R��A�*

Training_lossD�C6�K�$       B+�M	{Q�R��A�*

Training_loss��.C�nC�$       B+�M	����R��A�*

Training_loss	C��8$       B+�M	hx9�R��A�*

Training_loss�zC��;�$       B+�M	���R��A�*

Training_loss��CU�p$       B+�M	���R��A�*

Training_loss"SC��ɚ$       B+�M	��m�R��A�*

Training_loss�,C�A�$       B+�M	=d��R��A�*

Training_loss�=BC2��
$       B+�M	�H?�R��A�*

Training_loss���B��*�$       B+�M	t��R��A�*

Training_loss�� Cq�j�$       B+�M	�H)�R��A�*

Training_loss��HC`Ւr$       B+�M	���R��A�*

Training_loss!wC`��$       B+�M	�6�R��A�*

Training_lossN�C�j�$       B+�M	��R��A�*

Training_loss�C�I,^$       B+�M	����R��A�*

Training_loss�C�� s$       B+�M	�Y�R��A�*

Training_loss�W�B`���$       B+�M	)Y��R��A�*

Training_loss�rRC���$       B+�M	��;�R��A�*

Training_loss�C4H�$       B+�M	ȣ�R��A�*

Training_loss�C�-Nl$       B+�M	���R��A�*

Training_loss���By�:$       B+�M	z�s�R��A�*

Training_loss�UC4֭$       B+�M	z��R��A�*

Training_lossS1<C��v$       B+�M	N�B�R��A�*

Training_loss�Z*C]z�W$       B+�M	 `��R��A�*

Training_loss<UC����*       ����	mX��R��A�*

Validation_accuracy##F?�-�U&       sO� 	�Z��R��A�*

Validation_lossPl�B`.�$       B+�M	aRd�R��A�*

Training_loss0S C@�+>$       B+�M	F���R��A�*

Training_lossNC���$       B+�M	½3�R��A�*

Training_loss-�3C�g�$       B+�M	����R��A�*

Training_loss�0�BF�M$       B+�M	P��R��A�*

Training_loss�C� ]$       B+�M	l�R��A�*

Training_loss�C�$       B+�M	����R��A�*

Training_lossQKC���$       B+�M	�v=�R��A�*

Training_loss���B���$       B+�M	�.��R��A�*

Training_loss9/&C,f��$       B+�M	�K�R��A�*

Training_loss*�	C���$       B+�M	���R��A�*

Training_loss��C��$       B+�M	�A�R��A�*

Training_loss��JC{��b$       B+�M	�h�R��A�*

Training_loss�[C����$       B+�M	 ���R��A�*

Training_loss4gC]��$       B+�M	�@�R��A�*

Training_lossp�Cw@x1$       B+�M	��R��A�*

Training_loss��<C�:�$       B+�M	� $�R��A�*

Training_loss	��B�it�$       B+�M	�g��R��A�*

Training_loss���B��b�$       B+�M	���R��A�*

Training_loss�J�Bf/�$       B+�M	"�Z�R��A�*

Training_loss��B=G�$       B+�M	^���R��A�*

Training_loss�:C�yy7$       B+�M	��*�R��A�*

Training_losse�%C��ބ$       B+�M	����R��A�*

Training_lossaC'%�b$       B+�M	����R��A�*

Training_loss7�C��/?$       B+�M	��f�R��A�*

Training_loss#J(Crs8�$       B+�M	cE��R��A�*

Training_loss��B�S��$       B+�M	S 7�R��A�*

Training_loss�LC�<!f$       B+�M	����R��A�*

Training_loss��CR(�z$       B+�M	j� S��A�*

Training_lossRs'C���$       B+�M	�H� S��A�*

Training_lossشC�3��$       B+�M	�<� S��A�*

Training_lossQ�C�7$       B+�M	�ncS��A�*

Training_loss$_C�ڃ�$       B+�M	��S��A�*

Training_loss2(Cs{�~$       B+�M	l�IS��A�*

Training_loss�Ci�$       B+�M	m��S��A�*

Training_lossu�%C�sX$       B+�M	u!#S��A�*

Training_loss$�C��<�$       B+�M	ץ�S��A�*

Training_loss(�+C-��$       B+�M	��S��A�*

Training_lossͭC��$       B+�M	�}S��A�*

Training_losslC��o$       B+�M	�k�S��A�*

Training_loss�Z#Ca⺛$       B+�M	��MS��A�*

Training_loss8~5C�9�?$       B+�M	�
�S��A�*

Training_lossxfC�gN$       B+�M	�3S��A�*

Training_loss�:�B�ow�$       B+�M	~�S��A�*

Training_lossW�B��RT$       B+�M	+3S��A�*

Training_losshr�Bf0^$       B+�M	��{S��A�*

Training_lossJ�5C�5$       B+�M	���S��A�*

Training_loss�C9>�$       B+�M	d[JS��A�*

Training_loss@"CO�$       B+�M	��S��A�*

Training_lossI�Co��Y$       B+�M	C�	S��A�*

Training_loss��#C~�;*       ����	�9�	S��A�*

Validation_accuracy##F?q�D�&       sO� 	C=�	S��A�*

Validation_losso�B��/v$       B+�M	q��
S��A�*

Training_loss�w�B�1�F$       B+�M	�ojS��A�*

Training_loss>��BMT#�$       B+�M	ۆ�S��A�*

Training_loss\ C���$       B+�M	d?;S��A�*

Training_losst~�B�}�($       B+�M	,a�S��A�*

Training_loss��C��$       B+�M	��$S��A�*

Training_loss��BP�3d$       B+�M	\��S��A�*

Training_losse+�B���}$       B+�M	�S��A�*

Training_loss@�C`Q�$       B+�M	D5xS��A�*

Training_loss��!C���$       B+�M	D�S��A�*

Training_lossX)C��7�$       B+�M	vqPS��A�*

Training_loss_ �B�gC$       B+�M	Z)�S��A�*

Training_lossDcC����$       B+�M	�N7S��A�*

Training_loss�r C��x�$       B+�M	�(�S��A�*

Training_loss<��B*�Ps$       B+�M	�zS��A�*

Training_loss*yC�P�x$       B+�M	q�nS��A�*

Training_lossI�C.t�$       B+�M	HO�S��A�*

Training_loss��CI�G$       B+�M	�?S��A�*

Training_loss]�Bt��]$       B+�M	���S��A�*

Training_loss��C��^`$       B+�M	�3S��A�*

Training_loss�F
C0EB�$       B+�M	U{S��A�*

Training_loss���B���o$       B+�M	���S��A�*

Training_loss�"�B	 ��$       B+�M	�KS��A�*

Training_loss3C'�Y�$       B+�M	�۳S��A�*

Training_loss�9C�v$       B+�M	�S��A�*

Training_loss� C�L[$       B+�M	�,�S��A�*

Training_loss�nC�c$       B+�M	 S��A�*

Training_loss1XC��^�$       B+�M	��|S��A�*

Training_loss��B��'�$       B+�M	��S��A�*

Training_loss�!CiN'�$       B+�M	��NS��A�*

Training_lossE|C��r�$       B+�M	���S��A�*

Training_loss�O�BI�V$       B+�M	�/S��A�*

Training_loss�^Cv�|`$       B+�M	�)wS��A�*

Training_loss]�C~��$       B+�M	��S��A�*

Training_loss<.C`��$       B+�M	�\]S��A�*

Training_lossuCB�XH$       B+�M	���S��A�*

Training_lossl*2C�@�H$       B+�M	O�.S��A�*

Training_lossc�C�{$       B+�M	F^�S��A�*

Training_loss�C�?��$       B+�M	>�S��A�*

Training_lossz$CU���$       B+�M	vލS��A�*

Training_loss���B��!$       B+�M	�0�S��A�*

Training_lossR�C ��y$       B+�M	b�fS��A�*

Training_loss�<%C��4�$       B+�M	\��S��A�*

Training_loss:h�Bh��G$       B+�M	��5S��A�*

Training_loss>��B�q�$       B+�M	�0�S��A�*

Training_loss���B��O$       B+�M	�bS��A�*

Training_loss��7C�'z{$       B+�M	ڐ�S��A�*

Training_loss�<<C牤�$       B+�M	�S��A�*

Training_losszP(C�!E$       B+�M	�+uS��A�*

Training_loss�C[bt$       B+�M	[%�S��A�*

Training_loss!�C�Gn|*       ����	X� S��A�*

Validation_accuracyxxG?�&       sO� 	�Z� S��A�*

Validation_loss�)�B�n$       B+�M	��!S��A�*

Training_loss��1Cu�4�$       B+�M	6Z-"S��A�*

Training_lossf�CԦ*$       B+�M	���"S��A�*

Training_lossC���$       B+�M	�B�"S��A�*

Training_loss���B�l$       B+�M	q�d#S��A�*

Training_loss�C5h�&$       B+�M	Ve�#S��A�*

Training_loss��C��a>$       B+�M	�Q$S��A�*

Training_loss�`CV��$       B+�M	=`�$S��A�*

Training_loss���B���$       B+�M	�� %S��A�*

Training_loss6�Ci�a$       B+�M	��%S��A�*

Training_lossl9CNY��$       B+�M	;��%S��A�*

Training_loss�@�B��W�$       B+�M	_EY&S��A�*

Training_loss���B��A$       B+�M	]�&S��A�*

Training_loss��C�@��$       B+�M	�N*'S��A�*

Training_loss	j(CN��=$       B+�M	�Q�'S��A�*

Training_lossEC�Z��$       B+�M	�v�'S��A�*

Training_loss�]CO$       B+�M	R�c(S��A�*

Training_loss�]�B*�k�$       B+�M	M��(S��A�*

Training_loss�)�Bp|{�$       B+�M	,(Y)S��A�*

Training_loss�C�U�`$       B+�M	���)S��A�*

Training_lossu� C�}k�$       B+�M	�+*S��A�*

Training_loss�7CA�
B$       B+�M	�Ւ*S��A�*

Training_lossL!C�}O$       B+�M		��*S��A�*

Training_loss"fC�r�$       B+�M	�_+S��A�*

Training_loss�_C/��$       B+�M	��+S��A�*

Training_loss��C��q�$       B+�M	��6,S��A�*

Training_loss�!%C@�_$       B+�M	��,S��A�*

Training_loss@pC~ʈw$       B+�M	��-S��A�*

Training_loss�C�Ǐ4$       B+�M	�}-S��A�*

Training_loss��4C|���$       B+�M	�'�-S��A�*

Training_loss��C�BW$       B+�M	�DK.S��A�*

Training_loss�ZC�S�U$       B+�M	��.S��A�*

Training_loss��Ct&��$       B+�M	��/S��A�*

Training_lossv\�B�y��$       B+�M	�:�/S��A�*

Training_lossY�B�3XT$       B+�M	�&�/S��A�*

Training_loss���B����$       B+�M	hxR0S��A�*

Training_loss �CF̃$       B+�M	�G�0S��A�*

Training_loss+��B���$       B+�M	b�!1S��A�*

Training_loss�=�B���l$       B+�M	���1S��A�*

Training_loss��Bȗ��$       B+�M	���1S��A�*

Training_lossi��B(C�C$       B+�M	&�`2S��A�*

Training_loss�WC"`��$       B+�M	��2S��A�*

Training_loss��B�S�$       B+�M	,�03S��A�*

Training_loss�C�
�$       B+�M	��3S��A�*

Training_loss��C�f+H$       B+�M	�4S��A�*

Training_loss�?CU:�D$       B+�M	Edh4S��A�*

Training_loss@:�B���$       B+�M	)]�4S��A�*

Training_loss�;�B���$       B+�M	�S95S��A�*

Training_loss;�C��k$       B+�M	�$�5S��A�*

Training_loss�;�B�v�$       B+�M	1�6S��A�*

Training_loss�Csq��*       ����	V��6S��A�*

Validation_accuracy��G?r��&       sO� 	���6S��A�*

Validation_lossp��BZ�~�$       B+�M	}��7S��A�*

Training_loss�e*C��+$       B+�M	t)B8S��A�*

Training_loss(�B�z�$       B+�M	D��8S��A�*

Training_loss<}�B���$       B+�M	�9S��A�*

Training_loss��C ��$       B+�M	�w9S��A�*

Training_lossRJ�B���1$       B+�M	�f�9S��A�*

Training_loss�NC��O$       B+�M	�H:S��A�*

Training_loss���B�u�z$       B+�M	c	�:S��A�*

Training_loss�n�B���M$       B+�M	��;S��A�*

Training_loss�S(Cn�*$       B+�M	��~;S��A�*

Training_lossOY�Bm#n$       B+�M	��;S��A�*

Training_loss��C���$       B+�M	�s�<S��A�*

Training_loss��BM�٬$       B+�M	Ѯ=S��A�*

Training_lossރ�B�8�$       B+�M	�=S��A�*

Training_loss\��BE�W$       B+�M	�>S��A�*

Training_loss("Cn7�$       B+�M	*�>S��A�*

Training_lossk��BR '�$       B+�M	��?S��A�*

Training_loss�RC�I��$       B+�M	�ʔ?S��A�*

Training_lossRW�B��fC$       B+�M	�g@S��A�*

Training_lossЗ�BE�N�$       B+�M	f��@S��A�*

Training_loss�kC㡼$       B+�M	ӅAS��A�*

Training_loss�sFCd��$       B+�M		7�AS��A�*

Training_lossK��B�XNU$       B+�M	�pBS��A�*

Training_loss>��B�ΰ�$       B+�M	P��BS��A�*

Training_lossV��B�e+s$       B+�M	b�CS��A�*

Training_loss�r�B�uU$       B+�M	�CS��A�*

Training_loss���B��P$       B+�M	���CS��A�*

Training_loss��CJ��$       B+�M	�mqDS��A�*

Training_loss�Y�B�>�$       B+�M	H�DS��A�*

Training_loss���Bv�P$       B+�M	��`ES��A�*

Training_loss6m�B����$       B+�M	�*�ES��A�*

Training_loss�Cl��K$       B+�M	�bRFS��A�*

Training_losspV�B�i�m$       B+�M	+��FS��A�*

Training_loss�z C����$       B+�M	K�DGS��A�*

Training_lossXq�B��87$       B+�M	֎�GS��A�*

Training_loss>��B�o�`$       B+�M	ü7HS��A�*

Training_loss�C�3�($       B+�M	�۴HS��A�*

Training_loss^,C���$       B+�M	�-IS��A�*

Training_lossv�B�-Y$       B+�M	��IS��A�*

Training_loss��C?h[$       B+�M	�� JS��A�*

Training_loss�B�B=�Y�$       B+�M	P7�JS��A�*

Training_lossX��B\���$       B+�M	,�KS��A�*

Training_loss<C�d$       B+�M	[�KS��A�*

Training_loss�ڸB�~�p$       B+�M	��LS��A�*

Training_lossNC{��$       B+�M	��xLS��A�*

Training_losso�B[�$       B+�M	2�LS��A�*

Training_lossT�C��V$       B+�M	m�hMS��A�*

Training_loss�hCE���$       B+�M	���MS��A�*

Training_loss���B���$       B+�M	�XNS��A�*

Training_loss0��Bd�C�$       B+�M	�n�NS��A�*

Training_loss��C$s��*       ����	�o�OS��A�*

Validation_accuracy��D?= ֯&       sO� 	�r�OS��A�*

Validation_lossx�B~R�)$       B+�M	QL�PS��A�*

Training_lossH� C��f�$       B+�M	��wQS��A�*

Training_lossi�C6}��$       B+�M	��QS��A�*

Training_lossb��B0x��$       B+�M	6�rRS��A�*

Training_loss��C��<�$       B+�M	i�RS��A�*

Training_loss:��B���$       B+�M	mSS��A�*

Training_loss~�-CP?My$       B+�M	��SS��A�*

Training_loss� C�`�$       B+�M	L�YTS��A�*

Training_loss|8�Ba=�m$       B+�M	��TS��A�*

Training_loss)��B?r�$       B+�M	�LUS��A�*

Training_loss)�B|��$       B+�M	^��US��A�*

Training_loss�8C�fL�$       B+�M	n3;VS��A�*

Training_lossV�B`Х�$       B+�M	撲VS��A�*

Training_lossܒ"Cj�7$       B+�M	�*WS��A�*

Training_loss��B��r�$       B+�M	ףWS��A�*

Training_loss{?)Cl�7$       B+�M	+�XS��A�*

Training_loss�CRK$       B+�M	2�XS��A�*

Training_lossr��B��g�$       B+�M	7S
YS��A�*

Training_loss�8�Br� 1$       B+�M	>�YS��A�*

Training_lossV�C����$       B+�M	P�YS��A�*

Training_loss�0!CD�U$       B+�M	�[qZS��A�*

Training_loss���B6rO�$       B+�M	�D�ZS��A�*

Training_loss���B��ܣ$       B+�M	��c[S��A�*

Training_loss�i�B@�$       B+�M	\w�[S��A�*

Training_lossg(�B�ܫu$       B+�M	 pT\S��A�*

Training_loss�L�BG�}�$       B+�M	b��\S��A�*

Training_lossmCl5�$       B+�M	�IB]S��A�*

Training_loss8K�B�Q?�$       B+�M	B��]S��A�*

Training_loss���B�C�$       B+�M	M�5^S��A�*

Training_loss<��BIN!$       B+�M	�E�^S��A�*

Training_lossXc�B'RQv$       B+�M	s�!_S��A�*

Training_loss��CXu?J$       B+�M	��_S��A�*

Training_loss�CU>G�$       B+�M	��`S��A�*

Training_loss�zC1W��$       B+�M		��`S��A�*

Training_loss;@�B�!$       B+�M	��aS��A�*

Training_loss�4C����$       B+�M	L�{aS��A�*

Training_loss9�B���$       B+�M	֋�aS��A�*

Training_loss�SC�F�$       B+�M	@3lbS��A�*

Training_loss���BG��$       B+�M	�z�bS��A�*

Training_loss��C]w$       B+�M	�]cS��A�*

Training_loss���B�M J$       B+�M	D�cS��A�*

Training_lossZ.Cf1�N$       B+�M	s�PdS��A�*

Training_lossE�C��I$       B+�M	L��dS��A�*

Training_loss��C��$       B+�M	z�?eS��A�*

Training_lossТ�B��o$       B+�M	�'�eS��A�*

Training_loss��B��b$       B+�M	=D.fS��A�*

Training_loss�[�B��ɒ$       B+�M	���fS��A�*

Training_loss�a C�j&q$       B+�M	�gS��A�*

Training_lossy� C��b)$       B+�M	�"�gS��A�*

Training_loss�K�Br�K$       B+�M	6hS��A�*

Training_loss~\�B%��d*       ����	��hS��A�*

Validation_accuracy��D?��gv&       sO� 	��hS��A�*

Validation_loss���B�A�$       B+�M	�<&jS��A�*

Training_loss��B���-$       B+�M	�W�jS��A�*

Training_lossC�C�r_^$       B+�M	�WkS��A�*

Training_loss�^C���$       B+�M	�#�kS��A�*

Training_loss\P�B��7&$       B+�M	�lS��A�*

Training_loss:��B'��|$       B+�M	�p�lS��A�*

Training_loss;�BH���$       B+�M	>=mS��A�*

Training_loss�fC��q�$       B+�M	$�|mS��A�*

Training_loss0L�B�>w$       B+�M	�g�mS��A�*

Training_loss}�B���$       B+�M	�onS��A�*

Training_lossFr�B��T$       B+�M	���nS��A�*

Training_loss��C�K�$       B+�M	kaoS��A�*

Training_loss^�BJ�ӫ$       B+�M	:��oS��A�*

Training_loss0@�B��j$       B+�M	��QpS��A�*

Training_loss�"C ��V$       B+�M	4��pS��A�*

Training_loss ��B����$       B+�M	KX>qS��A�*

Training_loss��C����$       B+�M	��qS��A�*

Training_loss~��BV���$       B+�M	i4rS��A�*

Training_lossLSC�Kw!$       B+�M	��rS��A�*

Training_loss/�B�@$       B+�M	�=#sS��A�*

Training_loss'm�BEn��$       B+�M	m�sS��A�*

Training_loss1�BsX�`$       B+�M	G!tS��A�*

Training_lossp��B�wF�$       B+�M	HÎtS��A�*

Training_loss6^�B� p�$       B+�M	A�
uS��A�*

Training_loss�3�BOQ�;$       B+�M	�~uS��A�*

Training_loss�oCG0�$       B+�M	Z��uS��A�*

Training_loss��B�H=$       B+�M	��`vS��A�*

Training_loss�d�Bu$       B+�M	{��vS��A�*

Training_loss�C�$       B+�M	c
JwS��A�*

Training_loss�WCs��$       B+�M	��wS��A�*

Training_lossʱ�B�-4$       B+�M	)"4xS��A�*

Training_loss��B� �$       B+�M	�1�xS��A�*

Training_loss���B�o�$       B+�M	G;#yS��A�*

Training_loss	��B%ٌ*$       B+�M	���yS��A�*

Training_lossqC2�$       B+�M	��zS��A�*

Training_loss0C�(ȫ$       B+�M	�M�zS��A�*

Training_loss�:C�>}�$       B+�M	oH{S��A�*

Training_loss��Bzf1�$       B+�M	��{S��A�*

Training_loss���B� �$       B+�M	�{�{S��A�*

Training_loss��$C����$       B+�M	y$d|S��A�*

Training_loss�.�B^L��$       B+�M	1�|S��A�*

Training_loss���B:W�/$       B+�M	�pD}S��A�*

Training_loss0w�Bpa*$       B+�M	#1�}S��A�*

Training_loss���BD%-�$       B+�M	ѐ*~S��A�*

Training_loss"�B�$       B+�M	؞�~S��A�*

Training_loss6.C���$       B+�M	��S��A�*

Training_loss�h�B|\f$       B+�M	��S��A�*

Training_loss}�BL�OP$       B+�M	q;�S��A�*

Training_loss)C�9�[$       B+�M	��n�S��A�*

Training_loss���B��H�$       B+�M	4��S��A�*

Training_lossCݶ�*       ����	��S��A�*

Validation_accuracy��H?H/�&       sO� 	��S��A�*

Validation_loss��B�b�+$       B+�M	*"�S��A�*

Training_loss���B~ƺ�$       B+�M	�6��S��A�*

Training_loss�CxĄ:$       B+�M	��S��A�*

Training_loss2CC�K�D$       B+�M	<k��S��A�*

Training_loss�NC�$       B+�M	|��S��A�*

Training_loss���B.$       B+�M	#I��S��A�*

Training_lossƶ�B��UA$       B+�M	-�S��A�*

Training_loss�e�B���$       B+�M	\V��S��A�*

Training_loss,@�BC�&$       B+�M	C���S��A�*

Training_loss!�B���<$       B+�M	�y�S��A�*

Training_loss7wC��l$       B+�M	,��S��A�*

Training_loss��B{r$       B+�M	rlo�S��A�*

Training_loss���Bj�e$       B+�M	i:�S��A�*

Training_lossH2�BC�ȉ$       B+�M	Q�m�S��A�*

Training_loss�%�BA�L�$       B+�M	��S��A�*

Training_loss�
C��+�$       B+�M	4�^�S��A�*

Training_lossp�CpJ�$       B+�M	�p֊S��A�*

Training_losso"�B9RJ$       B+�M	�P�S��A�*

Training_loss=>�B_��
$       B+�M	0ˋS��A�*

Training_lossl8�B�g�$       B+�M	HjA�S��A�*

Training_loss�Cr���$       B+�M	�ķ�S��A�*

Training_loss'�B}}��$       B+�M	[2�S��A�*

Training_loss�-�B�R�"$       B+�M	4d��S��A�*

Training_lossdt�BzGp�$       B+�M	_)�S��A�*

Training_lossOC֥�R$       B+�M	Uݦ�S��A�*

Training_loss���B�	4T$       B+�M	��$�S��A�*

Training_lossAICbϪ�$       B+�M	`��S��A�*

Training_lossf��B\L({$       B+�M	���S��A�*

Training_loss�4�B��$       B+�M	����S��A�*

Training_losshx�B&�h$       B+�M	���S��A�*

Training_loss�$Cs���$       B+�M	����S��A�*

Training_loss���BC���$       B+�M	�w��S��A�*

Training_loss���BD�Js$       B+�M	��z�S��A�*

Training_loss��B�>@x$       B+�M	���S��A�*

Training_lossl+�B)d=$       B+�M	��p�S��A�*

Training_loss\n�B�N6X$       B+�M	g�S��A�*

Training_loss�mC���.$       B+�M	��\�S��A�*

Training_loss�"�B7t$       B+�M	�ДS��A�*

Training_lossz��B��R$       B+�M	��C�S��A�*

Training_lossܠB�q$       B+�M	Sκ�S��A�*

Training_loss��B��
d$       B+�M	a0�S��A�*

Training_loss���B�ki$       B+�M	M���S��A�*

Training_loss��C��]{$       B+�M	���S��A�*

Training_lossM�B��X
$       B+�M	*Ǌ�S��A�*

Training_lossX~�B͊h$       B+�M	���S��A�*

Training_loss�x-C
�1�$       B+�M	�l�S��A�*

Training_loss$�CX��$       B+�M	�ޘS��A�*

Training_lossD��B>9��$       B+�M	^P�S��A�*

Training_loss��C��ߕ$       B+�M	�ǙS��A�*

Training_loss8�B�Zw�$       B+�M	y�=�S��A�*

Training_loss��B"Vm�*       ����	��:�S��A�*

Validation_accuracyyyJ?&��t&       sO� 	U�:�S��A�*

Validation_loss��B@��$       B+�M	�؈�S��A�*

Training_loss҃Cq,|�$       B+�M	��S��A�*

Training_lossE+�B���$       B+�M	/���S��A�*

Training_loss
CXp
�$       B+�M	=��S��A�*

Training_loss���B�c��$       B+�M	���S��A�*

Training_loss��B>�a$       B+�M	����S��A�*

Training_lossPϧBw��$       B+�M	Y2p�S��A�*

Training_loss[hCw�[$       B+�M	��S��A�*

Training_loss���Bw��$       B+�M	<�b�S��A�*

Training_loss�C|�g=$       B+�M	/�ޠS��A�*

Training_loss��Ca�U�$       B+�M	�\�S��A�*

Training_loss"��Bf���$       B+�M	DmܡS��A�*

Training_loss�g�BۗR�$       B+�M	a�U�S��A�*

Training_loss��B�\M$       B+�M	V�ԢS��A�*

Training_loss �B���$       B+�M	/�R�S��A�*

Training_loss���B4��$       B+�M	�lϣS��A�*

Training_loss͞�B7��,$       B+�M	�H�S��A�*

Training_loss��Bk�10$       B+�M	�ŤS��A�*

Training_lossD]C,P}S$       B+�M	�*G�S��A�*

Training_loss��C;m��$       B+�M	���S��A�*

Training_loss�7
Cu�l$       B+�M	W|4�S��A�*

Training_loss���B0�&$       B+�M	����S��A�*

Training_loss4�C�g�J$       B+�M	O�'�S��A�*

Training_loss*��BG���$       B+�M	�M��S��A�*

Training_loss6H�B����$       B+�M	��S��A�*

Training_lossm��B�~�$       B+�M	qr��S��A�*

Training_loss�QC��7$       B+�M	���S��A�*

Training_loss�C�F��$       B+�M	�ҙ�S��A�*

Training_lossj�B�Ke$       B+�M	��S��A�*

Training_loss8|�B�2\$       B+�M	� �S��A�*

Training_loss�.�Bd;
$       B+�M	x��S��A�*

Training_lossH0�B�Y��$       B+�M	�f��S��A�*

Training_lossX�BE$       B+�M	s�S��A�*

Training_loss���B��$       B+�M	Ed��S��A�*

Training_lossQ��B\�f$       B+�M	A��S��A�*

Training_loss�o�B*%3$       B+�M	Kt~�S��A�*

Training_loss�C���$       B+�M	�X��S��A�*

Training_lossr�C�q��$       B+�M	��i�S��A�*

Training_loss�{�B/�$       B+�M	h�S��A�*

Training_lossl�B���$       B+�M	��a�S��A�*

Training_loss�b�BwgJ$       B+�M	P9ׯS��A�*

Training_loss�]�Be�v!$       B+�M	�M�S��A�*

Training_loss*�B���$       B+�M	�tİS��A�*

Training_loss�	�B�	��$       B+�M	U�9�S��A�*

Training_loss�a�B�0Re$       B+�M	+���S��A�*

Training_loss���B����$       B+�M	c#�S��A�*

Training_loss���B�|�$       B+�M	M.��S��A�*

Training_loss���B���x$       B+�M	��S��A�*

Training_loss΅
CՏR
$       B+�M	�ҕ�S��A�*

Training_loss{n�B�2m�$       B+�M	���S��A�*

Training_loss�#�B,�H*       ����	6�	�S��A�*

Validation_accuracyONG?�_w�&       sO� 	G�	�S��A�*

Validation_loss2�B9�<$       B+�M	�@l�S��A�*

Training_loss��BV�߭$       B+�M	4�S��A�*

Training_loss ��BV̀$       B+�M	_\`�S��A�*

Training_loss�K�Bv��T$       B+�M	�۷S��A�*

Training_loss!��B`jw�$       B+�M	�sU�S��A�*

Training_lossH�B+��$       B+�M	�ѸS��A�*

Training_lossFi�B��r�$       B+�M	1�J�S��A�*

Training_losskaC�-��$       B+�M	�EŹS��A�*

Training_loss\}�B��Df$       B+�M	�?�S��A�*

Training_loss���B�B�$       B+�M	bh��S��A�*

Training_lossD��B���$       B+�M	�2�S��A�*

Training_loss���B�Kw$       B+�M	zn��S��A�*

Training_loss#Cw���$       B+�M	c$�S��A�*

Training_loss��BBo4:$       B+�M	����S��A�*

Training_loss�g�B]�E1$       B+�M	��S��A�*

Training_loss�VCܓ$�$       B+�M	��S��A�*

Training_loss���BR��t$       B+�M	M���S��A�*

Training_loss�R�BPq�1$       B+�M	�o�S��A�*

Training_loss�L�B��$       B+�M	A�S��A�*

Training_loss5C|�U$       B+�M	�Y�S��A�*

Training_loss�p�Br�l$       B+�M	�ͿS��A�*

Training_loss�'�B����$       B+�M	LkG�S��A�*

Training_loss���B���$       B+�M	C���S��A�*

Training_loss���BF�[�$       B+�M	�\8�S��A�*

Training_loss:^�B�An�$       B+�M	ٰ�S��A�*

Training_loss�}�BKٻ�$       B+�M	��)�S��A�*

Training_loss\�Cv88$       B+�M	T��S��A�*

Training_loss~�CыQ�$       B+�M	�q�S��A�*

Training_loss��B~�>$       B+�M	����S��A�*

Training_lossvA�Bc��$       B+�M	�S��A�*

Training_lossת�Bf"��$       B+�M	
��S��A�*

Training_lossx��BW�$       B+�M	ܺ�S��A�*

Training_lossZ��B��D$       B+�M	��S��A�*

Training_lossL��B�[��$       B+�M	+��S��A�*

Training_lossKuC7qq$       B+�M	8hx�S��A�*

Training_loss��B�΍t$       B+�M	S���S��A�*

Training_loss�y�B�W��$       B+�M	�$d�S��A�*

Training_lossp�B��̒$       B+�M	?���S��A�*

Training_loss`@C�v+�$       B+�M	��M�S��A�*

Training_loss�s�B�� %$       B+�M	����S��A�*

Training_loss��B-���$       B+�M	^6�S��A�*

Training_lossB;�Bj�m $       B+�M	�n��S��A�*

Training_lossݠ�B��.$       B+�M	XY-�S��A�*

Training_loss&0�B����$       B+�M	�ի�S��A�*

Training_lossZJ�BA�T�$       B+�M	��,�S��A�*

Training_loss��BQ�'�$       B+�M	j���S��A�*

Training_loss���B��	�$       B+�M	Y��S��A�*

Training_loss$�B_�$       B+�M	�D��S��A�*

Training_loss��B���`$       B+�M	0��S��A�*

Training_loss��B��ϊ$       B+�M	����S��A�*

Training_loss�A�Bq��*       ����	j���S��A�*

Validation_accuracy��H?7�	0&       sO� 	FΆ�S��A�*

Validation_lossb�B�;$       B+�M	.Y��S��A�*

Training_lossT.�Bf�L�$       B+�M	��W�S��A�*

Training_lossi�B�Uh_$       B+�M	����S��A�*

Training_lossص�B�u$       B+�M	J�E�S��A�*

Training_lossL$	C4l��$       B+�M	<���S��A�*

Training_loss�ոB��)$       B+�M	e�;�S��A�*

Training_loss���B&b�,$       B+�M	׷�S��A�*

Training_loss��C�u:$       B+�M	��/�S��A�*

Training_loss	6�B�)�9$       B+�M	D���S��A�*

Training_loss9e�B= �$       B+�M	��"�S��A�*

Training_loss� C���D$       B+�M	h��S��A�*

Training_loss��B��2$       B+�M	��S��A�*

Training_loss�k�BҘQ7$       B+�M	���S��A�*

Training_loss$�B�2$       B+�M	+��S��A�*

Training_lossSڳB?�	$       B+�M	���S��A�*

Training_loss?��B���$       B+�M	���S��A�*

Training_loss���B4��$       B+�M	�V~�S��A�*

Training_loss[��B��7�$       B+�M	ܸ��S��A�*

Training_loss��B����$       B+�M	U.x�S��A�*

Training_loss���B-H��$       B+�M	����S��A�*

Training_losslp�B�|��$       B+�M	�Fr�S��A�*

Training_lossh��B6�0�$       B+�M	���S��A�*

Training_loss���BP1��$       B+�M	�g�S��A�*

Training_loss0��B���>$       B+�M	&���S��A�*

Training_loss��B��c$       B+�M	ڎ^�S��A�*

Training_loss�L�B"�ys$       B+�M	����S��A�*

Training_loss�v�B<�8d$       B+�M	3jQ�S��A�*

Training_lossv�B��~�$       B+�M	����S��A�*

Training_loss��B�T$       B+�M	Y�A�S��A�*

Training_loss4��Bv�!$       B+�M	Fz��S��A�*

Training_loss�B��2�$       B+�M	Z�2�S��A�*

Training_loss�0�Bs>]�$       B+�M	Ԯ�S��A�*

Training_loss���Bg%4V$       B+�M	�,�S��A�*

Training_loss2�B��P�$       B+�M	���S��A�*

Training_loss-C��,C$       B+�M	�	�S��A�*

Training_loss���Br�$       B+�M	#���S��A�*

Training_loss<�B��x�$       B+�M	m
�S��A�*

Training_lossʿ�BT��$       B+�M	�P��S��A�*

Training_loss� Cxw|.$       B+�M	n��S��A�*

Training_loss���B�9'D$       B+�M	A�z�S��A�*

Training_loss`��B�`$       B+�M	����S��A�*

Training_lossT��B�`$       B+�M	�p�S��A�*

Training_loss^2�Bd��$       B+�M	N���S��A�*

Training_loss4b�B�4:$       B+�M	�zh�S��A�*

Training_loss1R�B���X$       B+�M	�W��S��A�*

Training_loss�ϽB��$       B+�M	]�[�S��A�*

Training_loss8�B{��$       B+�M	���S��A�*

Training_loss/.�BH�,$       B+�M	��P�S��A�*

Training_lossv�B��3$       B+�M	�0��S��A�*

Training_loss�/�Bw��$       B+�M	��B�S��A�*

Training_loss���B�g*       ����	�H�S��A�*

Validation_accuracy$$I?�/F�&       sO� 	<H�S��A�*

Validation_loss4n�B�1g$       B+�M	�x��S��A�*

Training_loss�:�B;��$       B+�M	�^�S��A�*

Training_loss���Bʱ�P$       B+�M	����S��A�*

Training_loss���B�/a�$       B+�M	��X�S��A�*

Training_lossX��B/�K$       B+�M	��S��A�*

Training_loss:��B�	c�$       B+�M	�]r�S��A�*

Training_loss5��B����$       B+�M	����S��A�*

Training_loss��B��&�$       B+�M	��~�S��A�*

Training_loss�)�B��~�$       B+�M	�� �S��A�*

Training_losszK�BL8�$       B+�M	F���S��A�*

Training_loss��BQ�$       B+�M	O	�S��A�*

Training_lossT/�B�S�8$       B+�M	{��S��A�*

Training_loss|v�B�g#$       B+�M	��S��A�*

Training_loss���B7�$       B+�M	%Z}�S��A�*

Training_lossA �B2J;�$       B+�M	K���S��A�*

Training_lossCG�BE��$       B+�M	~u�S��A�*

Training_lossb��B�&�$       B+�M	{0��S��A�*

Training_loss�4C��Bw$       B+�M	�p�S��A�*

Training_loss�B}�>�$       B+�M	����S��A�*

Training_loss�#�B{�i$       B+�M	gf�S��A�*

Training_loss.�B���$       B+�M	�\��S��A�*

Training_loss|K�B�G�"$       B+�M	ܜZ�S��A�*

Training_loss��C�B�p$       B+�M	����S��A�*

Training_loss:��B�kO�$       B+�M	;�c�S��A�*

Training_loss��B�"�$       B+�M	����S��A�*

Training_loss )�B(V�K$       B+�M	��a�S��A�*

Training_loss
��B�+j�$       B+�M	�?��S��A�*

Training_loss���BvK?�$       B+�M	�tX�S��A�*

Training_lossG��B���$       B+�M	���S��A�*

Training_loss�u�B����$       B+�M	��W�S��A�*

Training_loss��B����$       B+�M	��S��A�*

Training_loss���B�,�f$       B+�M	��T�S��A�*

Training_loss`C94�$       B+�M	���S��A�*

Training_loss�8�B�d�+$       B+�M	�LY�S��A�*

Training_loss���B�x$       B+�M	O���S��A�*

Training_loss�BWA�$       B+�M	�fW�S��A�*

Training_loss	��BM\e$       B+�M	O��S��A�*

Training_loss���B���$       B+�M	�mR�S��A�*

Training_loss���B�0��$       B+�M	��S��A�*

Training_loss,a�B;!�$       B+�M	�#Q�S��A�*

Training_loss�f�Bb�$       B+�M	����S��A�*

Training_loss���Br���$       B+�M	߿N�S��A�*

Training_loss�K�B��v_$       B+�M	B'��S��A�*

Training_loss\��B���$       B+�M	�9M�S��A�*

Training_loss��Ba\�$       B+�M	Ag��S��A�*

Training_loss���B�­F$       B+�M	��J T��A�*

Training_lossԎ�Bݩ3"$       B+�M	�f� T��A�*

Training_loss��BȤ~P$       B+�M	��GT��A�*

Training_losst�B���O$       B+�M	�#�T��A�*

Training_lossD��BI�KS$       B+�M	�%BT��A�*

Training_loss���B�/�k*       ����	�OHT��A�*

Validation_accuracy��G?jB��&       sO� 	mUHT��A�*

Validation_loss���B��ֵ$       B+�M	���T��A�*

Training_lossP��B�U�@$       B+�M	��UT��A�*

Training_loss�r�B���z$       B+�M	ys�T��A�*

Training_loss�5�B���2$       B+�M	��PT��A�*

Training_loss<��B�k�w$       B+�M	߉�T��A�*

Training_loss\��BE���$       B+�M	�_MT��A�*

Training_loss��Bz�N�$       B+�M	�\�T��A�*

Training_loss�Bt�1]$       B+�M	�rHT��A�*

Training_loss��B(�=�$       B+�M	+�T��A�*

Training_lossW�B$J$       B+�M	�4D	T��A�*

Training_loss���B��Yf$       B+�M	��	T��A�*

Training_loss�5�B�xD�$       B+�M	ղ>
T��A�*

Training_loss�PC��m�$       B+�M	�ۺ
T��A�*

Training_loss�{�BݍK�$       B+�M	#29T��A�*

Training_loss$Z�BEC(�$       B+�M	�t�T��A�*

Training_loss�]�B�&�$       B+�M	��3T��A�*

Training_loss�a�B,X��$       B+�M	ߊ�T��A�*

Training_lossh�Bރ1�$       B+�M	x�0T��A�*

Training_lossD��B=2a<$       B+�M	M��T��A�*

Training_loss
:�B��$       B+�M	\�0T��A�*

Training_loss:�B���$       B+�M	�k�T��A�*

Training_loss�K�B�$       B+�M	)<(T��A�*

Training_lossL@�Bѿ5 $       B+�M	��T��A�*

Training_loss�M�B�f�$       B+�M	g�"T��A�*

Training_loss��B����$       B+�M	��T��A�*

Training_lossQQ�B���$       B+�M	_`T��A�*

Training_loss4��B����$       B+�M	���T��A�*

Training_loss7�B�m�$       B+�M	�wT��A�*

Training_loss���B�}$�$       B+�M	�L�T��A�*

Training_loss�g�B��6�$       B+�M	!T��A�*

Training_loss4��B��*G$       B+�M	�ەT��A�*

Training_loss�Q�B��-�$       B+�M	1�T��A�*

Training_loss�U�B�h�$       B+�M	��T��A�*

Training_losso��B��`$       B+�M	0T��A�*

Training_loss���B���E$       B+�M	"��T��A�*

Training_loss"��B��i�$       B+�M	��T��A�*

Training_loss� �BD��$       B+�M	b��T��A�*

Training_lossܠ�B$Xk�$       B+�M	�T��A�*

Training_loss k�Bw��$       B+�M	��T��A�*

Training_loss߾B"��x$       B+�M	^/T��A�*

Training_loss���B�JM$       B+�M	'��T��A�*

Training_loss���B�J-�$       B+�M	%\T��A�*

Training_loss���B����$       B+�M	�j�T��A�*

Training_loss�T�B|��$       B+�M	��
T��A�*

Training_lossD�B{ї�$       B+�M	@�T��A�*

Training_loss�,�B�@�s$       B+�M	�T��A�*

Training_loss���B���$       B+�M	h��T��A�*

Training_loss>��B�[�$       B+�M	T��A�*

Training_lossqh�B͖5|$       B+�M	U��T��A�*

Training_lossNt�BL�l$       B+�M	W=	T��A�*

Training_loss �B"���*       ����	��T��A�*

Validation_accuracy��H?Z�Z3&       sO� 	��T��A�*

Validation_loss�Q|Bm��-$       B+�M	�u�T��A�*

Training_loss0��BEn<�$       B+�M	w� T��A�*

Training_loss��BQ���$       B+�M	�� T��A�*

Training_loss���B!��$       B+�M	�j!T��A�*

Training_loss�U�B��1$       B+�M	\�!T��A�*

Training_loss���B���R$       B+�M	��"T��A�*

Training_loss���B�r�$       B+�M	���"T��A�*

Training_loss��Bˌ3$       B+�M	�6#T��A�*

Training_loss!��B���>$       B+�M	sh�#T��A�*

Training_loss�~�B�|:$       B+�M	�Q$T��A�*

Training_loss��B+^��$       B+�M	��$T��A�*

Training_loss���Bή,$       B+�M	DM%T��A�*

Training_lossU@�Biჱ$       B+�M	b��%T��A�*

Training_loss"�B��s$       B+�M	��&T��A�*

Training_loss�P�B�j��$       B+�M	3��&T��A�*

Training_loss	{�B�}��$       B+�M	^�'T��A�*

Training_loss�ϣBA���$       B+�M	��'T��A�*

Training_lossf8�B���$       B+�M	���'T��A�*

Training_lossoj�B�B,�$       B+�M	35x(T��A�*

Training_loss-��B�p?�$       B+�M	�d�(T��A�*

Training_loss���B�\�$       B+�M	)[s)T��A�*

Training_loss�ͿB�5��$       B+�M	5�)T��A�*

Training_lossP@�B�Ul$       B+�M	(dp*T��A�*

Training_loss\�BM� $       B+�M	g'�*T��A�*

Training_loss���BF$G$       B+�M	jml+T��A�*

Training_loss)��B�*i$       B+�M	q��+T��A�*

Training_loss���B4�k�$       B+�M	�.j,T��A�*

Training_losszJ�B����$       B+�M	8��,T��A�*

Training_loss���B!�!A$       B+�M	�fk-T��A�*

Training_lossx��B�8�d$       B+�M	��-T��A�*

Training_loss�BIS�.$       B+�M	.�d.T��A�*

Training_loss!�Bn�>$       B+�M	'��.T��A�*

Training_loss��BW#�&$       B+�M	�d/T��A�*

Training_loss��Bu�;�$       B+�M	��/T��A�*

Training_loss��B]i��$       B+�M	�>b0T��A�*

Training_loss�w�B����$       B+�M	���0T��A�*

Training_loss9��B�\s$       B+�M	�Ja1T��A�*

Training_loss��B��V0$       B+�M	H3�1T��A�*

Training_loss�ʒB��ǀ$       B+�M	�Gc2T��A�*

Training_loss��B��P_$       B+�M	���2T��A�*

Training_loss��Bj<gD$       B+�M	��i3T��A�*

Training_lossG��B�P$       B+�M	��3T��A�*

Training_loss>C>�jf$       B+�M	h�`4T��A�*

Training_loss���B�Gm�$       B+�M	���4T��A�*

Training_loss��B�{�$       B+�M	��Z5T��A�*

Training_lossP��B�T�A$       B+�M	ܻ�5T��A�*

Training_loss�=�BQ &�$       B+�M		TU6T��A�*

Training_loss���BD���$       B+�M	��6T��A�*

Training_loss���Br��$       B+�M	5zS7T��A�*

Training_loss1��B{4�
$       B+�M	Ig�7T��A�*

Training_lossu�B�Rv*       ����	���8T��A�*

Validation_accuracy��I?ӬA�&       sO� 	Ͽ�8T��A�*

Validation_loss�=~B0��$       B+�M	�s:T��A�*

Training_loss��C�j $       B+�M	˄�:T��A�	*

Training_loss�B�V5S$       B+�M	�Ko;T��A�	*

Training_lossfM�BE���$       B+�M	)�;T��A�	*

Training_loss�:�B��_�$       B+�M	��h<T��A�	*

Training_loss��B�� $       B+�M	���<T��A�	*

Training_lossߨ�B՝�$       B+�M	wNc=T��A�	*

Training_loss��B�7E�$       B+�M	���=T��A�	*

Training_loss���B��ؔ$       B+�M	8�Z>T��A�	*

Training_loss�dvB���S$       B+�M	 ��>T��A�	*

Training_loss���B��$       B+�M	�T?T��A�	*

Training_loss8�B�Oa�$       B+�M	J^�?T��A�	*

Training_loss�B��$       B+�M	W@T��A�	*

Training_lossT�B�Q�$       B+�M	�	�@T��A�	*

Training_loss�+�B��{�$       B+�M	�ZTAT��A�	*

Training_loss(��B�h�$       B+�M	���AT��A�	*

Training_loss@�B��U$       B+�M	úNBT��A�	*

Training_loss���B1f($       B+�M	�j�BT��A�	*

Training_loss��Bty*$       B+�M	�RCT��A�	*

Training_loss4|�B ��!$       B+�M	���CT��A�	*

Training_loss�A�B��"�$       B+�M	�FPDT��A�	*

Training_lossW�B�#��$       B+�M	�y�DT��A�	*

Training_loss��BS�Oz$       B+�M	��HET��A�	*

Training_loss���B�سV$       B+�M	��ET��A�	*

Training_lossr\�Br�3$       B+�M	��CFT��A�	*

Training_loss꿲BE}*�$       B+�M	��FT��A�	*

Training_loss<��B��+�$       B+�M	�KGT��A�	*

Training_loss&!�BJ⦏$       B+�M	@��GT��A�	*

Training_loss���B�*2�$       B+�M	p$QHT��A�	*

Training_loss�̽B��O)$       B+�M	�i�HT��A�	*

Training_loss�d�B��%�$       B+�M	?;OIT��A�	*

Training_loss���B��$       B+�M	x��IT��A�	*

Training_loss��B���z$       B+�M	g*dJT��A�	*

Training_loss⏡B�c�$       B+�M	IH�JT��A�	*

Training_lossE��B�e`�$       B+�M	7��KT��A�	*

Training_lossR��B'3XR$       B+�M	p}0LT��A�	*

Training_loss�}�B"�$�$       B+�M	�$�LT��A�	*

Training_loss��9Bc��$       B+�M	&�)MT��A�	*

Training_loss�
�B7ஹ$       B+�M	@j�MT��A�	*

Training_lossfj�B\�=$       B+�M	���MT��A�	*

Training_lossꦝB�e�q$       B+�M	~lNT��A�	*

Training_loss�u�B}��$       B+�M	�s�NT��A�	*

Training_loss���B��jN$       B+�M	r>OT��A�	*

Training_loss�zB�K��$       B+�M	�Y�OT��A�	*

Training_loss8��B&@�x$       B+�M	^PT��A�	*

Training_loss��iBQ�&�$       B+�M	:̇PT��A�	*

Training_loss�;�B�#��$       B+�M	C��PT��A�	*

Training_lossbV�B���$       B+�M	h�bQT��A�	*

Training_loss\C�B�[	$       B+�M	t��QT��A�	*

Training_loss8S�B����$       B+�M	�{:RT��A�	*

Training_loss���B�K��*       ����	��#ST��A�	*

Validation_accuracy��I?8�ц&       sO� 	S�#ST��A�	*

Validation_loss�lhBS� �$       B+�M	�%�TT��A�	*

Training_lossH��Biܛ-$       B+�M	"QdUT��A�	*

Training_lossԿB�7A�$       B+�M	�
�UT��A�	*

Training_loss�M�B}Y��$       B+�M	hVT��A�	*

Training_loss�x�B^] $       B+�M	Y��VT��A�	*

Training_losspJ�B����$       B+�M	�bWT��A�	*

Training_loss�t�BU�K$       B+�M	�<�WT��A�	*

Training_loss�z�B\��$       B+�M	=XXT��A�	*

Training_loss;��B�b$       B+�M	f��XT��A�	*

Training_loss���B��z�$       B+�M	3TIYT��A�	*

Training_loss��B�8?�$       B+�M	���YT��A�	*

Training_loss|�B;~X`$       B+�M	h9ZT��A�	*

Training_loss�$�B��Ȧ$       B+�M	J�ZT��A�	*

Training_loss�k�B��׽$       B+�M	��-[T��A�	*

Training_loss�q�B��;$       B+�M	Pǜ[T��A�	*

Training_loss���B�4�$       B+�M	�f\T��A�	*

Training_loss�K�Bx���$       B+�M	�\�\T��A�	*

Training_lossIH�B���U$       B+�M	��]T��A�	*

Training_loss&�BU=�V$       B+�M	���]T��A�	*

Training_loss��wBH�)�$       B+�M	�� ^T��A�	*

Training_loss3��B�~�S$       B+�M	�^T��A�	*

Training_loss���BR�_�$       B+�M	�"_T��A�	*

Training_loss�B-���$       B+�M	$�_T��A�	*

Training_loss/q�B�$o$       B+�M	��`T��A�	*

Training_loss��B�Zb$       B+�M	V�`T��A�	*

Training_loss>�B0��#$       B+�M	:xaT��A�	*

Training_loss���B/��($       B+�M	�`}aT��A�	*

Training_loss���B�ek$       B+�M	C��aT��A�	*

Training_loss�t�BW�A�$       B+�M	�tbbT��A�	*

Training_loss���BSgS$       B+�M	0��bT��A�	*

Training_loss~��B�^��$       B+�M	��QcT��A�	*

Training_loss�d�B]���$       B+�M	Yi�cT��A�	*

Training_loss21�B�r�$       B+�M	�3dT��A�	*

Training_loss���Bo�M:$       B+�M	/��dT��A�	*

Training_loss���BcY�$       B+�M	#�#eT��A�	*

Training_loss�̜BS^��$       B+�M	r��eT��A�	*

Training_lossP`�BGBJ$       B+�M	p�fT��A�	*

Training_losscN�B�V�$       B+�M	�یfT��A�	*

Training_loss��B"L
W$       B+�M	2:�fT��A�	*

Training_loss��B��$       B+�M	�EogT��A�	*

Training_loss��B6��i$       B+�M	~�gT��A�	*

Training_loss�i�B(��$       B+�M	ZMhT��A�	*

Training_lossP��B�=��$       B+�M	G=�hT��A�	*

Training_loss*�B�$       B+�M	�)iT��A�	*

Training_loss ��B�d�$       B+�M	pB�iT��A�	*

Training_loss$��B�ʾ�$       B+�M	/NjT��A�	*

Training_loss�c�BS_C$       B+�M	 tujT��A�	*

Training_loss�W�B�C�r$       B+�M	���jT��A�	*

Training_lossȠ�B��$       B+�M	��NkT��A�	*

Training_loss�C�Bdح$       B+�M	ޒ�kT��A�	*

Training_lossX��B{�Ы*       ����	�%�lT��A�	*

Validation_accuracyONJ?�#�$&       sO� 	9(�lT��A�	*

Validation_loss��hB%�,$       B+�M	�,	nT��A�	*

Training_loss���B��$$       B+�M	v�pnT��A�	*

Training_loss��B�}�$       B+�M	�.�nT��A�	*

Training_loss�`�Bx�"$       B+�M	W�JoT��A�	*

Training_lossbI�B��*$       B+�M	KW�oT��A�	*

Training_lossx{�B���b$       B+�M	n�)pT��A�	*

Training_loss�%�B9��$       B+�M	�s�pT��A�	*

Training_loss���B���$       B+�M	ʥqT��A�	*

Training_loss�c�B����$       B+�M	��wqT��A�	*

Training_loss\ǦB��fV$       B+�M	��qT��A�	*

Training_lossv��B\��$       B+�M	 VrT��A�	*

Training_loss�B���$       B+�M	�rT��A�	*

Training_loss�B6~�$       B+�M	�v:sT��A�	*

Training_loss�%�Bem�$       B+�M	���sT��A�	*

Training_loss�c�B����$       B+�M	�-tT��A�	*

Training_loss�M�Bެ�$       B+�M	~��tT��A�	*

Training_loss^�B,@*�$       B+�M	�^uT��A�	*

Training_loss~;�B��s�$       B+�M	�@�uT��A�	*

Training_loss��B�-�$       B+�M	,��uT��A�	*

Training_loss�6�B;U��$       B+�M	��ivT��A�	*

Training_loss��B���$       B+�M	�)�vT��A�	*

Training_lossNG�B�6��$       B+�M	��JwT��A�	*

Training_loss�9�BU� )$       B+�M	�D�wT��A�	*

Training_loss��BрM-$       B+�M	��+xT��A�	*

Training_loss��B+�G$       B+�M	��xT��A�	*

Training_loss���B�z�$       B+�M	b�yT��A�	*

Training_lossDLC�~8$       B+�M	�vyT��A�	*

Training_loss���B"��$       B+�M	��yT��A�	*

Training_loss�܁B &�$       B+�M	7�SzT��A�	*

Training_loss)\{B63�_$       B+�M	���zT��A�
*

Training_loss��B!��$       B+�M	P�/{T��A�
*

Training_loss9�B���$       B+�M	���{T��A�
*

Training_loss�K�B�7L�$       B+�M	E|T��A�
*

Training_loss��B�Q�$       B+�M	��{|T��A�
*

Training_lossy�B�7x�$       B+�M	���|T��A�
*

Training_loss�0�B|�G�$       B+�M	qY}T��A�
*

Training_losst_zB`�<$       B+�M	R~�}T��A�
*

Training_loss�n�B���$       B+�M	��B~T��A�
*

Training_lossj�B�0k�$       B+�M	�_�~T��A�
*

Training_lossx�B8��$       B+�M	��8T��A�
*

Training_loss@u�B$���$       B+�M	�٪T��A�
*

Training_loss>��B��@�$       B+�M	N��T��A�
*

Training_lossR�B�wi$       B+�M	H��T��A�
*

Training_lossT��B���$       B+�M	=���T��A�
*

Training_loss��B˩
$       B+�M	��m�T��A�
*

Training_lossl
�B8i,c$       B+�M	�PځT��A�
*

Training_loss��BV�`�$       B+�M	E�F�T��A�
*

Training_lossX֘B>���$       B+�M	����T��A�
*

Training_lossk�B"�]>$       B+�M		�"�T��A�
*

Training_loss���B����$       B+�M	����T��A�
*

Training_loss���B����*       ����	>��T��A�
*

Validation_accuracy��I?Z!L &       sO� 	���T��A�
*

Validation_loss�PeB��'E$       B+�M	�@��T��A�
*

Training_loss�F�B��Z�$       B+�M	&rd�T��A�
*

Training_loss{#�B���p$       B+�M	C9ӆT��A�
*

Training_loss=�B��G}$       B+�M	!�U�T��A�
*

Training_loss��B�0��$       B+�M	lɇT��A�
*

Training_loss[�B>ɮ�$       B+�M		�>�T��A�
*

Training_loss�s�B��;,$       B+�M	�f��T��A�
*

Training_loss�5�B���R$       B+�M	���T��A�
*

Training_loss9G�B.�'�$       B+�M	���T��A�
*

Training_lossMR�B����$       B+�M	��T��A�
*

Training_loss�Y�B���$       B+�M	 �r�T��A�
*

Training_loss�]�B;$       B+�M	��T��A�
*

Training_loss�;�B��o�$       B+�M	G!P�T��A�
*

Training_loss�'�BeL�$       B+�M	����T��A�
*

Training_lossu՛Bn�e�$       B+�M	��,�T��A�
*

Training_loss���BUa�$       B+�M	 a��T��A�
*

Training_lossΨBS�˳$       B+�M	�6	�T��A�
*

Training_loss� �B�	��$       B+�M	��v�T��A�
*

Training_loss�B���$       B+�M	A��T��A�
*

Training_lossD��B�*�u$       B+�M	V�T��A�
*

Training_loss/s�B��$       B+�M	�"ĎT��A�
*

Training_loss�߲B!^��$       B+�M	��3�T��A�
*

Training_loss�O�B�J8�$       B+�M	˝��T��A�
*

Training_loss��B��$       B+�M	���T��A�
*

Training_lossUd{B�)�N$       B+�M	�n�T��A�
*

Training_loss
X|B>�|$       B+�M	�u�T��A�
*

Training_loss���Bizc$       B+�M	)B]�T��A�
*

Training_loss`'�B {s$       B+�M		�͑T��A�
*

Training_loss��BW�H$       B+�M	Ҍ;�T��A�
*

Training_loss��B�p�$       B+�M	¾��T��A�
*

Training_lossj �B&��$       B+�M	|��T��A�
*

Training_loss�ƼB?V>$       B+�M	;⑓T��A�
*

Training_loss��B�X�$       B+�M	�� �T��A�
*

Training_loss��B���$       B+�M	��t�T��A�
*

Training_loss*��B@�l$       B+�M	k��T��A�
*

Training_loss��B�Tt$       B+�M	�aR�T��A�
*

Training_loss��Bl�:�$       B+�M	#ÕT��A�
*

Training_loss���B����$       B+�M	��0�T��A�
*

Training_loss2��B�X�Y$       B+�M	���T��A�
*

Training_loss&ʤBZV$       B+�M	�5�T��A�
*

Training_loss#��BŔ� $       B+�M	�և�T��A�
*

Training_lossE��B>�1�$       B+�M	j���T��A�
*

Training_loss3��B�Ok�$       B+�M	��i�T��A�
*

Training_lossæB�o)M$       B+�M	��ۘT��A�
*

Training_loss �BQB��$       B+�M	1�L�T��A�
*

Training_lossO�Bז�r$       B+�M	c	��T��A�
*

Training_loss�7YB�k�$       B+�M	�9-�T��A�
*

Training_lossF��BF\T>$       B+�M	U2��T��A�
*

Training_loss2��Br�i$       B+�M	��T��A�
*

Training_loss�B��(�$       B+�M	�ڇ�T��A�
*

Training_losst�B�,@�*       ����	�9w�T��A�
*

Validation_accuracy��J?�T5W&       sO� 	�=w�T��A�
*

Validation_lossk�jB�Pؠ$       B+�M	Q��T��A�
*

Training_loss`��B��%@$       B+�M	�4f�T��A�
*

Training_loss4�YB����$       B+�M	.�ԞT��A�
*

Training_loss�ʨBaċE$       B+�M	�QE�T��A�
*

Training_loss�e�B��u$       B+�M	�m͟T��A�
*

Training_loss@u�B4P�$       B+�M	-�M�T��A�
*

Training_loss2i�B�^�]$       B+�M	�ÿ�T��A�
*

Training_loss�њB4�b�$       B+�M	�1�T��A�
*

Training_loss!�BԤ�$       B+�M	�Q��T��A�
*

Training_loss��B)�w�$       B+�M	#��T��A�
*

Training_lossy�B0� w$       B+�M	u��T��A�
*

Training_loss���B�oW$       B+�M	U��T��A�
*

Training_loss�Z�B����$       B+�M	�v�T��A�
*

Training_loss�~�B����$       B+�M	���T��A�
*

Training_lossqٸBf���$       B+�M	�"_�T��A�
*

Training_loss|�B��$       B+�M	��ͤT��A�
*

Training_loss�l�B�k@�$       B+�M	�vM�T��A�
*

Training_lossx��B��$       B+�M	N�ʥT��A�
*

Training_loss~)�B��/$       B+�M	��P�T��A�
*

Training_loss���Bsd�p$       B+�M	IĦT��A�
*

Training_loss�[B���)$       B+�M	�j=�T��A�
*

Training_loss�2�Bcܬ�$       B+�M	RѴ�T��A�
*

Training_loss�R�B�h�$       B+�M	n0�T��A�
*

Training_loss���B���e$       B+�M	ˠ��T��A�
*

Training_loss�[�B�:R$       B+�M	ٴ�T��A�
*

Training_loss��B$Zn$       B+�M	ʉ��T��A�
*

Training_loss��B��K$       B+�M	����T��A�
*

Training_lossU�B=ݰ�$       B+�M	s�T��A�
*

Training_loss�}�Bʥ.$       B+�M	t^�T��A�
*

Training_loss�ʨB�a{$       B+�M	��[�T��A�
*

Training_loss&k�B�Hȓ$       B+�M	�ЫT��A�
*

Training_loss��B��$       B+�M	��?�T��A�
*

Training_loss���B���$       B+�M	����T��A�
*

Training_lossb�BL��y$       B+�M	�0(�T��A�
*

Training_loss���B�M��$       B+�M	W{��T��A�
*

Training_loss�C�BC͠$       B+�M	�!�T��A�
*

Training_lossb�B����$       B+�M	`s��T��A�
*

Training_loss���B�x�$       B+�M	w��T��A�
*

Training_loss��B��[�$       B+�M	��T��A�
*

Training_loss���B���$       B+�M	�3�T��A�
*

Training_loss���BJ�N$       B+�M	�{��T��A�
*

Training_loss�_�B��J$       B+�M	���T��A�
*

Training_loss��BW�o�$       B+�M	��y�T��A�
*

Training_loss}�B}G=�$       B+�M	���T��A�
*

Training_loss�@tBg¹�$       B+�M	�&k�T��A�
*

Training_loss�
�B�ɶr$       B+�M	���T��A�
*

Training_loss6ݜB�$��$       B+�M	s-\�T��A�
*

Training_loss0�BO��$       B+�M	��׳T��A�
*

Training_loss���BjMD"$       B+�M	��V�T��A�
*

Training_loss���B-�W�$       B+�M	R�ʴT��A�
*

Training_loss.�Bh��*       ����	IgŵT��A�
*

Validation_accuracy��J?Zp
&       sO� 	jŵT��A�
*

Validation_loss��lB�T~\$       B+�M	�/��T��A�
*

Training_loss�N�B��=�$       B+�M	;s �T��A�
*

Training_loss���B���$       B+�M	hu��T��A�
*

Training_loss�։Bw�S�$       B+�M	wK��T��A�
*

Training_loss"G�B|nLd$       B+�M	y�s�T��A�
*

Training_loss�B���@$       B+�M	�j�T��A�
*

Training_loss��B����$       B+�M	;m�T��A�
*

Training_loss8ӎB��r�$       B+�M	���T��A�*

Training_loss8��Bq
,$       B+�M	��s�T��A�*

Training_loss�٣B
ք�$       B+�M	hX�T��A�*

Training_loss���B-!�!$       B+�M	>�l�T��A�*

Training_lossȜ�B'�$       B+�M	rM�T��A�*

Training_loss�ߧB /h�$       B+�M	^*e�T��A�*

Training_loss(ҟBS�Py$       B+�M	�SֽT��A�*

Training_loss���BOт�$       B+�M	�jT�T��A�*

Training_loss2)�BWZ�,$       B+�M	�=ѾT��A�*

Training_loss�l�B��?$       B+�M	IQ�T��A�*

Training_loss��B(�$       B+�M	X�пT��A�*

Training_lossYX�B�vu$       B+�M	��I�T��A�*

Training_loss���BV��5$       B+�M	n0��T��A�*

Training_lossg��B���v$       B+�M	�9�T��A�*

Training_loss��B��T�$       B+�M		߯�T��A�*

Training_loss�ɜB[e]$       B+�M	�'�T��A�*

Training_lossf˚B,dA<$       B+�M	x��T��A�*

Training_lossl�vB0�j$       B+�M	j��T��A�*

Training_loss�m�Bi�J�$       B+�M	Z���T��A�*

Training_loss�"�B^w�M$       B+�M	v��T��A�*

Training_loss}B�z��$       B+�M	+��T��A�*

Training_loss���B^�}�$       B+�M	UL �T��A�*

Training_loss�؏BhM<$       B+�M	7ox�T��A�*

Training_lossc�B����$       B+�M	�3��T��A�*

Training_loss�V�BUv�C$       B+�M	,�r�T��A�*

Training_lossa��B�_�s$       B+�M	����T��A�*

Training_loss|d�BE�7$       B+�M	4�b�T��A�*

Training_loss�8�B\�<u$       B+�M	Ks��T��A�*

Training_loss39�B���$       B+�M	d:T�T��A�*

Training_loss�XB�z�$       B+�M	���T��A�*

Training_loss	j�By�J$       B+�M	0hN�T��A�*

Training_loss�,�Bۂx$       B+�M	}$��T��A�*

Training_loss ϩB�\UT$       B+�M	�>�T��A�*

Training_loss^N�BtP��$       B+�M	S	��T��A�*

Training_loss<�B"C�$       B+�M	]2�T��A�*

Training_lossPX�B� �$       B+�M	-���T��A�*

Training_loss.'zB)��I$       B+�M	г!�T��A�*

Training_loss�ɁBXR$       B+�M	Aӝ�T��A�*

Training_loss�BC�ZO$       B+�M	B@�T��A�*

Training_loss��B���e$       B+�M	���T��A�*

Training_loss�֏B"�Z�$       B+�M	r�T��A�*

Training_loss`�BK��$       B+�M	����T��A�*

Training_lossX��B�W�$       B+�M	���T��A�*

Training_lossN(�B�s�*       ����	��
�T��A�*

Validation_accuracy%%K?���&       sO� 	�
�T��A�*

Validation_loss�/lB'�*5$       B+�M	���T��A�*

Training_loss�+�B�Y2�$       B+�M	ΩS�T��A�*

Training_loss-0�B�v��$       B+�M	�-��T��A�*

Training_loss�c�B.�C$       B+�M	$)C�T��A�*

Training_loss���B���j$       B+�M	?��T��A�*

Training_loss�d�Bw��.$       B+�M	�3:�T��A�*

Training_lossr��B��/$       B+�M	�Ǳ�T��A�*

Training_lossD��BH���$       B+�M	�+�T��A�*

Training_loss�}�B���$       B+�M	S˦�T��A�*

Training_loss���B3N@�$       B+�M	i�#�T��A�*

Training_loss(��B�({$       B+�M	}���T��A�*

Training_loss�B����$       B+�M	���T��A�*

Training_loss0a�BXDP�$       B+�M	�ќ�T��A�*

Training_loss�B����$       B+�M	��T��A�*

Training_loss���B�m�$       B+�M	}��T��A�*

Training_lossVb9B��^$       B+�M	�)
�T��A�*

Training_lossy��Bs��m$       B+�M	RE��T��A�*

Training_loss8�0B�$       B+�M	F���T��A�*

Training_loss�ƆB��[i$       B+�M	y]r�T��A�*

Training_loss�\�B,���$       B+�M	�I��T��A�*

Training_lossԑ�B�z?v$       B+�M	 �c�T��A�*

Training_loss*�B�'$       B+�M	R��T��A�*

Training_loss��B܃�
$       B+�M	-Z�T��A�*

Training_loss!�pB�lv$       B+�M	ݖ��T��A�*

Training_loss���BEZ2�$       B+�M	'gJ�T��A�*

Training_loss���B��3&$       B+�M	����T��A�*

Training_loss;�WB1iq�$       B+�M	��A�T��A�*

Training_loss炫B5���$       B+�M	�ø�T��A�*

Training_loss��BRx��$       B+�M	��/�T��A�*

Training_loss�T�Bڒ�$       B+�M	���T��A�*

Training_loss$�vB�Qeq$       B+�M	1)�T��A�*

Training_loss%�B>��$       B+�M	���T��A�*

Training_lossfg�B��O$       B+�M	�l�T��A�*

Training_loss��Bo �A$       B+�M	]��T��A�*

Training_loss��B���k$       B+�M	�4
�T��A�*

Training_loss�!�B��I$       B+�M	���T��A�*

Training_loss�H�BJ܉$       B+�M	���T��A�*

Training_loss�%bB]��U$       B+�M	�@t�T��A�*

Training_losstԾBf��$       B+�M	;T��T��A�*

Training_lossj2�B�y�:$       B+�M	�^�T��A�*

Training_lossۼ�B����$       B+�M	�E��T��A�*

Training_loss6_�B�$�$       B+�M	eoL�T��A�*

Training_lossIb�B���$       B+�M	KZ��T��A�*

Training_loss�2�B�rP�$       B+�M	1E9�T��A�*

Training_loss��B�s$       B+�M	1��T��A�*

Training_lossp��B�Y��$       B+�M	.T$�T��A�*

Training_loss9��B�.1$       B+�M	�Қ�T��A�*

Training_loss�K�BY��$       B+�M	�`�T��A�*

Training_lossn�^B`���$       B+�M	1D��T��A�*

Training_loss�I�B��ʺ$       B+�M	9� �T��A�*

Training_loss�F�B����*       ����	��T��A�*

Validation_accuracy��J?k�y&       sO� 	#�T��A�*

Validation_loss�e`B���1$       B+�M	!>��T��A�*

Training_lossW��B��$       B+�M	��%�T��A�*

Training_loss4�B�e�$       B+�M	����T��A�*

Training_loss�B����$       B+�M	N��T��A�*

Training_lossD��BF'|.$       B+�M	ڌ��T��A�*

Training_loss�BF�'!$       B+�M	|��T��A�*

Training_loss�g�B�z$       B+�M	���T��A�*

Training_loss�@�BA��$       B+�M	�Y��T��A�*

Training_lossH>�Bj2$       B+�M	��x�T��A�*

Training_loss���B��Q$       B+�M	����T��A�*

Training_loss�.�B'�n�$       B+�M	�h�T��A�*

Training_loss �B�X�$       B+�M	�a��T��A�*

Training_loss^�BW$       B+�M	ɏU�T��A�*

Training_lossȶ�B&:D$       B+�M	���T��A�*

Training_loss�hB6j�$       B+�M	��H�T��A�*

Training_loss��qB���<$       B+�M	k���T��A�*

Training_loss"H�B���$       B+�M	N
;�T��A�*

Training_lossd8�B
31�$       B+�M	@���T��A�*

Training_lossQ�B��1$       B+�M	�.�T��A�*

Training_lossn;�B\��7$       B+�M	�L��T��A�*

Training_loss�ϪB��$       B+�M	k�T��A�*

Training_loss��B�%X$       B+�M	��T��A�*

Training_loss�X�BH�$       B+�M	���T��A�*

Training_loss��B��E$       B+�M	�o~�T��A�*

Training_lossܿ�B��$       B+�M	���T��A�*

Training_loss*%vB� ƅ$       B+�M	ގs�T��A�*

Training_loss��Bp��)$       B+�M	���T��A�*

Training_losshB�BBT��$       B+�M	]�e�T��A�*

Training_loss$8�B���C$       B+�M	����T��A�*

Training_loss�t�BA�$       B+�M	D�X�T��A�*

Training_loss�ݵBmB�$       B+�M	3o��T��A�*

Training_loss�k�B�JH>$       B+�M	��E�T��A�*

Training_loss&��B�
�'$       B+�M	�j��T��A�*

Training_lossJ!�B��>�$       B+�M	^�:�T��A�*

Training_lossV��B���$       B+�M	<���T��A�*

Training_loss�V�B-���$       B+�M	�$�T��A�*

Training_loss�_�B�"�$       B+�M	\ɛ�T��A�*

Training_loss���B
�$       B+�M	��T��A�*

Training_lossQƐB�B$       B+�M	]���T��A�*

Training_loss���B�
�$       B+�M	w��T��A�*

Training_loss_�Bu�~d$       B+�M	)"�T��A�*

Training_loss��B�T�$       B+�M	0)��T��A�*

Training_loss�ЕB�p$       B+�M	g*t�T��A�*

Training_loss"8sB�4 ]$       B+�M	�,��T��A�*

Training_lossL�B_�;�$       B+�M	g*i U��A�*

Training_lossV�B ��$       B+�M	��� U��A�*

Training_loss�ӕBE�\$       B+�M	PZU��A�*

Training_loss�ʗB�e�7$       B+�M	;7�U��A�*

Training_lossֻ�B����$       B+�M	,fOU��A�*

Training_loss�_�B��$       B+�M	��U��A�*

Training_loss�#�B��@*       ����		��U��A�*

Validation_accuracy��L?�&       sO� 	Ҍ�U��A�*

Validation_loss��]BQ^$       B+�M	Kw�U��A�*

Training_loss�6\B��K�$       B+�M	jU��A�*

Training_lossK��Bsm	t$       B+�M	?��U��A�*

Training_loss��Bʹ{A$       B+�M	f�U��A�*

Training_loss�˜BT�a$       B+�M	��U��A�*

Training_loss���B�z�$       B+�M	��U��A�*

Training_lossmӁB��Z$       B+�M	
g�U��A�*

Training_loss��B�� �$       B+�M	f0	U��A�*

Training_loss���B�~,�$       B+�M	��|	U��A�*

Training_loss韁B���g$       B+�M	q��	U��A�*

Training_losscdxB��w$       B+�M	��o
U��A�*

Training_loss?�B3l��$       B+�M	��
U��A�*

Training_loss�οBh��$       B+�M	��fU��A�*

Training_lossdh�B�l$       B+�M	���U��A�*

Training_lossͣ�B~��$       B+�M	4LRU��A�*

Training_loss�3�B�K�H$       B+�M	���U��A�*

Training_loss�B�&l�$       B+�M	�0EU��A�*

Training_lossL�B�,�!$       B+�M	�r�U��A�*

Training_loss"�B
��$       B+�M	I�/U��A�*

Training_loss��B��9$       B+�M	5�U��A�*

Training_loss�5�B��0�$       B+�M	�� U��A�*

Training_loss�P�B����$       B+�M	�i�U��A�*

Training_loss-�B��q�$       B+�M	!U��A�*

Training_loss�O�Bl��U$       B+�M	�؆U��A�*

Training_loss�^�Bz�g$       B+�M	
K�U��A�*

Training_loss�ހBHC�$       B+�M	i�sU��A�*

Training_loss�7�B5@m�$       B+�M	2q�U��A�*

Training_loss
��B�3-n$       B+�M	��`U��A�*

Training_lossNd�Bt��V$       B+�M	��U��A�*

Training_loss��Bہ�$       B+�M	K�KU��A�*

Training_loss���B����$       B+�M	��U��A�*

Training_loss��B�r�$       B+�M	+�;U��A�*

Training_loss턁B�u�$       B+�M	鞺U��A�*

Training_loss��wBQ >$       B+�M	<U��A�*

Training_loss4��B��r?$       B+�M	 ǲU��A�*

Training_loss�szB��$       B+�M	�w)U��A�*

Training_lossjˑB5`M}$       B+�M	��U��A�*

Training_loss��nB��!$       B+�M	�U��A�*

Training_lossF��B擻�$       B+�M	|`�U��A�*

Training_loss&Y�BΑ�$       B+�M	J�U��A�*

Training_loss���B���$       B+�M	F��U��A�*

Training_loss�gyB�j�$       B+�M	��U��A�*

Training_loss���B>9W$       B+�M	zňU��A�*

Training_loss5��B��=$       B+�M	
,U��A�*

Training_loss�OBTy�$       B+�M	A�xU��A�*

Training_lossb��B�b2$       B+�M	_��U��A�*

Training_loss�e�Bڎiq$       B+�M	�hU��A�*

Training_loss1��B��3$       B+�M	p��U��A�*

Training_lossM~B�P��$       B+�M	�LWU��A�*

Training_lossl�B���{$       B+�M	�$�U��A�*

Training_lossd��B�d�*       ����	[��U��A�*

Validation_accuracy��K?��V�&       sO� 	Ֆ�U��A�*

Validation_loss8eYB�]V$       B+�M	�U��A�*

Training_loss\TWB]}��$       B+�M	a U��A�*

Training_lossoLB[��$       B+�M	�z U��A�*

Training_loss��B�>��$       B+�M	><� U��A�*

Training_loss�y�B#Kz]$       B+�M	�(i!U��A�*

Training_loss(�B%t�$       B+�M	J@�!U��A�*

Training_lossC��B��$       B+�M	�HZ"U��A�*

Training_loss��WB^G��$       B+�M	���"U��A�*

Training_lossV�rB�Ky$       B+�M	�jG#U��A�*

Training_loss:�BR��$       B+�M	+پ#U��A�*

Training_loss��B�6W&$       B+�M	�L9$U��A�*

Training_loss��B�C�j$       B+�M	�ɯ$U��A�*

Training_loss�S�B:��$       B+�M	7T%%U��A�*

Training_loss�c�BŲǘ$       B+�M	�ޝ%U��A�*

Training_lossR(�B��#$       B+�M	 �&U��A�*

Training_loss�VB�ɲ$       B+�M	�	�&U��A�*

Training_loss���B�Hj�$       B+�M	Y5'U��A�*

Training_loss<F�Bb�>$       B+�M	`Y�'U��A�*

Training_loss��B��`$       B+�M	m	(U��A�*

Training_loss(R�B����$       B+�M	�M�(U��A�*

Training_lossog�B4��d$       B+�M	X�)U��A�*

Training_losslbB�V$       B+�M	��})U��A�*

Training_loss��B��B$       B+�M	�v�)U��A�*

Training_lossHɊB�L�$       B+�M	<n*U��A�*

Training_loss}�oB�M$       B+�M	���*U��A�*

Training_loss�v�B+\��$       B+�M	��d+U��A�*

Training_lossZ�B�}�$       B+�M	`�+U��A�*

Training_loss͟B�Q�<$       B+�M	V,U��A�*

Training_lossO�Bn���$       B+�M	��,U��A�*

Training_loss�B�\�`$       B+�M	�K-U��A�*

Training_lossXU�B3�a$       B+�M	<��-U��A�*

Training_loss�g�B��"$       B+�M	n�+.U��A�*

Training_loss�H�B8|$       B+�M	��.U��A�*

Training_loss�g�B۸j$       B+�M	܀/U��A�*

Training_lossȵ�BO�Z�$       B+�M		8�/U��A�*

Training_lossn�iB�
$       B+�M	�0U��A�*

Training_loss��[B��$$       B+�M	d]�0U��A�*

Training_loss[�B���$       B+�M	Q�1U��A�*

Training_loss�2�B٭Y$       B+�M	Pƀ1U��A�*

Training_loss��jB�5jY$       B+�M	I��1U��A�*

Training_loss불B�ذ�$       B+�M	�Zm2U��A�*

Training_lossעuB��5&$       B+�M	�{�2U��A�*

Training_lossn��B���$       B+�M	�]3U��A�*

Training_loss��B 4��$       B+�M	���3U��A�*

Training_loss&�B�:]�$       B+�M	�UM4U��A�*

Training_lossJ4�B��+$       B+�M	��4U��A�*

Training_lossF��B���H$       B+�M	g95U��A�*

Training_loss?9�B�7:$       B+�M	Vױ5U��A�*

Training_loss�Z�B1T�$       B+�M	Z�+6U��A�*

Training_loss'��Bn�$�$       B+�M	" �6U��A�*

Training_lossII�Bd�*       ����	!��7U��A�*

Validation_accuracy��L?CI�&       sO� 	Ȗ�7U��A�*

Validation_loss��_B���$       B+�M	£�9U��A�*

Training_loss#C�B�m0�$       B+�M	��
:U��A�*

Training_loss�BAy�'$       B+�M	X��:U��A�*

Training_loss��B�%�$       B+�M	l;U��A�*

Training_loss�S�B��7$       B+�M	�^;U��A�*

Training_loss\�NB,��.$       B+�M	���;U��A�*

Training_losstMoBa�$       B+�M	`Vo<U��A�*

Training_loss��aB9[�$       B+�M	~��<U��A�*

Training_loss� �Bd�t$       B+�M	'M_=U��A�*

Training_loss���B��lS$       B+�M	^��=U��A�*

Training_loss���BB�.z$       B+�M	��Z>U��A�*

Training_loss��B6��$       B+�M	��>U��A�*

Training_loss��B�{��$       B+�M	[	b?U��A�*

Training_lossx�kB��+$       B+�M	<��?U��A�*

Training_loss��B�/�n$       B+�M	�jc@U��A�*

Training_loss��B�g��$       B+�M	�u�@U��A�*

Training_loss"��B�{LF$       B+�M	B�gAU��A�*

Training_loss��B�"=]$       B+�M	�$�AU��A�*

Training_loss7�eBk�-�$       B+�M	�`BU��A�*

Training_loss��B�W:$       B+�M	�^�BU��A�*

Training_loss�sB
kO�$       B+�M	��cCU��A�*

Training_loss��B¢��$       B+�M	?�CU��A�*

Training_loss�{B=�;�$       B+�M	+9DU��A�*

Training_loss���B<�$       B+�M	Sw�DU��A�*

Training_lossπPBLU,$       B+�M	'�EU��A�*

Training_loss���B�}��$       B+�M	#��EU��A�*

Training_loss�jB�
�j$       B+�M	!>FU��A�*

Training_lossдB���$       B+�M	�،FU��A�*

Training_loss�=�B�d�d$       B+�M	
gGU��A�*

Training_loss��B�	
�$       B+�M	��|GU��A�*

Training_losse|Ba[�$       B+�M	���GU��A�*

Training_loss/ӉB�b[g$       B+�M	}�THU��A�*

Training_lossX�B�S�x$       B+�M	��HU��A�*

Training_loss`;�B���$       B+�M	�'IU��A�*

Training_loss��B'Z��$       B+�M	��IU��A�*

Training_loss(�B��F$       B+�M	�X�IU��A�*

Training_loss^��Bq�W�$       B+�M	іjJU��A�*

Training_loss��B)I�$       B+�M	@L�JU��A�*

Training_loss6�B��Y!$       B+�M	��gKU��A�*

Training_loss0,JB	�$       B+�M	��KU��A�*

Training_loss��3B���F$       B+�M	WLU��A�*

Training_loss�c�B���3$       B+�M	��LU��A�*

Training_loss޷MB�;�$       B+�M	}�9MU��A�*

Training_loss|��Bј� $       B+�M	]�MU��A�*

Training_lossMzB>�T$       B+�M	�tTNU��A�*

Training_loss�a`B���3$       B+�M	�j�NU��A�*

Training_loss�4�B�u �$       B+�M	�{8OU��A�*

Training_loss\7�B��$       B+�M	B̪OU��A�*

Training_loss�@�B��c$       B+�M	?W2PU��A�*

Training_loss��B�ER$       B+�M	4��PU��A�*

Training_loss�mB\2DE*       ����	S��QU��A�*

Validation_accuracyxxL?���&       sO� 	���QU��A�*

Validation_loss4�WBcV"$       B+�M	�SU��A�*

Training_loss,��Bv�Dd$       B+�M	Ot�SU��A�*

Training_lossJ"dB�Vw�$       B+�M	��JTU��A�*

Training_loss㶿B��5.$       B+�M	��TU��A�*

Training_loss$pqBS�^$       B+�M	o� UU��A�*

Training_lossQ��Bn�$       B+�M	5ԔUU��A�*

Training_lossm�B���$       B+�M	y�UU��A�*

Training_loss�7�BVE}�$       B+�M	��vVU��A�*

Training_loss�ЎB{`)�$       B+�M	��VU��A�*

Training_loss�#�B����$       B+�M	��jWU��A�*

Training_lossZ�pB��a$       B+�M	QO�WU��A�*

Training_loss�j�B3ֈV$       B+�M	�~1XU��A�*

Training_loss�%�B�La$       B+�M	�ڕXU��A�*

Training_lossz�B�_\J$       B+�M	�T�XU��A�*

Training_loss>�B���$       B+�M	\v[YU��A�*

Training_loss�ܬBɘA�$       B+�M	~��YU��A�*

Training_loss���BtvП$       B+�M	�ZU��A�*

Training_loss5@�B�/��$       B+�M	h�xZU��A�*

Training_loss�lB��#�$       B+�M	�9�ZU��A�*

Training_loss똣B=���$       B+�M	��9[U��A�*

Training_loss�MB�Z�$       B+�M	5��[U��A�*

Training_loss�CB,�Y�$       B+�M	 \U��A�*

Training_loss��jB��bG$       B+�M	�e�\U��A�*

Training_loss�u�B��^�$       B+�M	+0�\U��A�*

Training_loss��B�n�i$       B+�M	3�k]U��A�*

Training_lossV uBY�$       B+�M	5�]U��A�*

Training_loss�ŔB��A�$       B+�M	z�Q^U��A�*

Training_loss|�B6 �$       B+�M	<��^U��A�*

Training_loss��B�[0�$       B+�M	�+6_U��A�*

Training_lossV�B~�x�$       B+�M	V��_U��A�*

Training_loss�$dB�Ͷ�$       B+�M	�(`U��A�*

Training_loss��{B����$       B+�M	��}`U��A�*

Training_loss&`�B]4$       B+�M	T�`U��A�*

Training_lossQ�B����$       B+�M	�v9aU��A�*

Training_loss S�B����$       B+�M	�*�aU��A�*

Training_loss^�B����$       B+�M	v�aU��A�*

Training_loss4ҹB�ɾ�$       B+�M	S�cbU��A�*

Training_loss;�mB��}$       B+�M	^��bU��A�*

Training_loss��wB���$       B+�M	~W5cU��A�*

Training_loss��B״>�$       B+�M	aƒcU��A�*

Training_loss��[B�p��$       B+�M	Z��cU��A�*

Training_loss�'pBd��`$       B+�M	ĕJdU��A�*

Training_loss�,�BdMբ$       B+�M	E٦dU��A�*

Training_loss��B�դ�$       B+�M	�eU��A�*

Training_lossi�B��$       B+�M	פ^eU��A�*

Training_loss&�OB��I�$       B+�M	YºeU��A�*

Training_loss�ИBP�$       B+�M	ȖfU��A�*

Training_loss=@OB
��$       B+�M	^csfU��A�*

Training_loss�[9BGz$       B+�M	3��fU��A�*

Training_loss9
�Bu��y$       B+�M	d4gU��A�*

Training_loss��aB�U��*       ����	��gU��A�*

Validation_accuracyONM?�Q�&       sO� 	��gU��A�*

Validation_lossC�XB�A
�$       B+�M	��qiU��A�*

Training_lossb�B�@3$       B+�M	���iU��A�*

Training_loss�6�B�.��$       B+�M	i�.jU��A�*

Training_loss��BL��O$       B+�M	v�jU��A�*

Training_loss B�Αk$       B+�M	a��jU��A�*

Training_loss���B.t�a$       B+�M	��BkU��A�*

Training_loss���B(�a�$       B+�M	�kU��A�*

Training_loss�n�Bz8��$       B+�M	���kU��A�*

Training_loss��~Bf�9�$       B+�M	�YlU��A�*

Training_loss̑B#U�y$       B+�M	V��lU��A�*

Training_loss��B�_UF$       B+�M	��mU��A�*

Training_loss�Bl�:$       B+�M	�4nmU��A�*

Training_loss�ʂBփj�$       B+�M	t��mU��A�*

Training_lossBUt�A$       B+�M	��%nU��A�*

Training_loss��rBj4i$       B+�M	�ЂnU��A�*

Training_loss	�BZ"_$       B+�M	fi�nU��A�*

Training_loss���B_�ߝ$       B+�M	�t:oU��A�*

Training_lossUB~B�� $       B+�M	זoU��A�*

Training_lossb��B-3i�$       B+�M	��oU��A�*

Training_lossMtB�r��$       B+�M	M�NpU��A�*

Training_loss:�ZB�� �$       B+�M	4��pU��A�*

Training_lossZeB��$       B+�M	�FqU��A�*

Training_loss,CcB��#.$       B+�M	�bqU��A�*

Training_loss~StBJI;$       B+�M	q�qU��A�*

Training_loss��uB_)�$       B+�M	�rU��A�*

Training_loss:oB���$       B+�M	�urU��A�*

Training_loss8�EB��S$       B+�M	�J�rU��A�*

Training_loss��UB/��q$       B+�M	�0sU��A�*

Training_loss�eB;ˇ�$       B+�M	�g�sU��A�*

Training_loss��B��T�$       B+�M	�Z�sU��A�*

Training_loss/�B���f$       B+�M	�]FtU��A�*

Training_loss:J�B���$       B+�M	�R�tU��A�*

Training_loss~ܛBݳ��$       B+�M	J�uU��A�*

Training_lossֹoB�JϹ$       B+�M	�bcuU��A�*

Training_loss�9�BXGl+$       B+�M	{��uU��A�*

Training_loss��B�La�$       B+�M	n�vU��A�*

Training_loss�-�B�E�$       B+�M	�*yvU��A�*

Training_loss2k�B� $       B+�M	�=�vU��A�*

Training_loss�bBi�$       B+�M	�T1wU��A�*

Training_loss8��BR��$       B+�M	ɍwU��A�*

Training_loss�̌B�Y�$       B+�M	��wU��A�*

Training_loss�O�B��͟$       B+�M	�!FxU��A�*

Training_loss�m�B���*$       B+�M	S��xU��A�*

Training_loss�ĞB�NCz$       B+�M	�l�xU��A�*

Training_loss]b�B ���$       B+�M	��ZyU��A�*

Training_loss8}B�1��$       B+�M	��yU��A�*

Training_loss~ԖB=�mc$       B+�M	��zU��A�*

Training_loss�ׄB��r�$       B+�M	{uzU��A�*

Training_loss���B�΢'$       B+�M	�M�zU��A�*

Training_loss*<�B"�$       B+�M	�z.{U��A�*

Training_loss MdB��E�*       ����	d?�{U��A�*

Validation_accuracy��L?�7�&       sO� 	B�{U��A�*

Validation_lossO�YB�;�$       B+�M	�Lx}U��A�*

Training_loss�jeBl%B�$       B+�M	L��}U��A�*

Training_loss�]B�DK7$       B+�M	��0~U��A�*

Training_loss�d�B1�}$       B+�M	s�~U��A�*

Training_loss
��B�b�$       B+�M	E.�~U��A�*

Training_loss�=�B�Ý$       B+�M	�FU��A�*

Training_loss��yBo���$       B+�M	���U��A�*

Training_lossdmB���-$       B+�M	���U��A�*

Training_loss�ݣB�/�$       B+�M	"[�U��A�*

Training_loss�XB��h�$       B+�M	�l��U��A�*

Training_loss�-�B-��7$       B+�M	+��U��A�*

Training_loss�EBo/&@$       B+�M	{.p�U��A�*

Training_lossG��Bwz`$       B+�M	(�ˁU��A�*

Training_loss�PxB�X�e$       B+�M	�K'�U��A�*

Training_lossw}iB���$       B+�M	l��U��A�*

Training_loss��B]V��$       B+�M	Z�߂U��A�*

Training_loss�S|B�2'g$       B+�M	"<�U��A�*

Training_loss��8Bc�d$       B+�M	"��U��A�*

Training_lossrH�BI���$       B+�M	�U��A�*

Training_loss��RB�ŉ�$       B+�M	m�P�U��A�*

Training_loss��vB�tr$       B+�M	.��U��A�*

Training_loss��B�k��$       B+�M	.V	�U��A�*

Training_losst�eB�d�$       B+�M	~�h�U��A�*

Training_lossݳSB��v�$       B+�M	�cŅU��A�*

Training_lossz�uB!W��$       B+�M	�!�U��A�*

Training_loss���BŽx$       B+�M	��}�U��A�*

Training_lossT�wB���$       B+�M	�rنU��A�*

Training_loss�nBe�lW$       B+�M	�6�U��A�*

Training_loss���Br�R�$       B+�M	'g��U��A�*

Training_loss#�B�Y�$       B+�M	�9�U��A�*

Training_losst�sB��$       B+�M	^eM�U��A�*

Training_lossv��Bru $       B+�M	~��U��A�*

Training_loss5�B�k�2$       B+�M	Ŭ�U��A�*

Training_lossp�rB�/�L$       B+�M	,�a�U��A�*

Training_loss�Bɕ�$       B+�M	<���U��A�*

Training_loss[2tB�)��$       B+�M	q��U��A�*

Training_lossN��B�k�p$       B+�M	{�v�U��A�*

Training_loss�CrB2B�$       B+�M	�OҊU��A�*

Training_loss��GB�$       B+�M	�b.�U��A�*

Training_lossfсB�$       B+�M	����U��A�*

Training_losss�bB����$       B+�M	���U��A�*

Training_loss�ݙB@|�$       B+�M	>�A�U��A�*

Training_loss��bB��G$       B+�M	����U��A�*

Training_losshAB���3$       B+�M	���U��A�*

Training_loss��NB�o��$       B+�M	��U�U��A�*

Training_loss苛B%y�$       B+�M	���U��A�*

Training_loss��kBH���$       B+�M	>�U��A�*

Training_lossnpB�k�$       B+�M	j�U��A�*

Training_loss��B�-b�$       B+�M	�WƎU��A�*

Training_loss��xBd'�R$       B+�M	��"�U��A�*

Training_loss�LhBF!�*       ����	R��U��A�*

Validation_accuracy��L?"�9�&       sO� 	���U��A�*

Validation_lossTWSB�;��$       B+�M	�j�U��A�*

Training_lossطZB�W�y$       B+�M	Q�ǑU��A�*

Training_loss��B6�$       B+�M	)�#�U��A�*

Training_loss��[Bf&:$       B+�M	GX�U��A�*

Training_loss:��Bc��
$       B+�M	�[ےU��A�*

Training_loss�՜Bo֯$       B+�M	%C�U��A�*

Training_loss?�B�"�$       B+�M	x��U��A�*

Training_lossP	�B]�%$       B+�M	���U��A�*

Training_loss9�B��!�$       B+�M	?SW�U��A�*

Training_loss�yB|�2�$       B+�M	P���U��A�*

Training_loss�@B�Ft_$       B+�M	���U��A�*

Training_loss6MrB��#$       B+�M	��k�U��A�*

Training_lossv;B�jN�$       B+�M	�ǕU��A�*

Training_loss�ˀB, R$       B+�M	'�#�U��A�*

Training_loss��B&�ʛ$       B+�M	���U��A�*

Training_loss"MBG���$       B+�M	��ۖU��A�*

Training_loss��B�[�$       B+�M	�F8�U��A�*

Training_lossL�tB�[$       B+�M	D��U��A�*

Training_loss�O]B�K��$       B+�M	��U��A�*

Training_loss���BK:��$       B+�M	��K�U��A�*

Training_loss���B�br\$       B+�M	����U��A�*

Training_lossU[XB�I�$       B+�M	`t�U��A�*

Training_loss��TB��$       B+�M	v`�U��A�*

Training_loss�)rBO`�$       B+�M	fK��U��A�*

Training_loss�RB4$       B+�M	�a�U��A�*

Training_lossI#sB���_$       B+�M	y�s�U��A�*

Training_loss�ؖB�7�$       B+�M	j�ϚU��A�*

Training_loss3�B�{��$       B+�M	7�+�U��A�*

Training_lossjx�Bvp��$       B+�M	�͇�U��A�*

Training_loss�YXB���"$       B+�M	��U��A�*

Training_loss��B|eom$       B+�M	�@�U��A�*

Training_loss@BB�Vz$       B+�M	}��U��A�*

Training_loss0�Ba
� $       B+�M	:���U��A�*

Training_loss���B�y�$       B+�M	'T�U��A�*

Training_lossh�UB�R�1$       B+�M	ձ��U��A�*

Training_loss�hB����$       B+�M	��U��A�*

Training_loss�ȦB���W$       B+�M	�g�U��A�*

Training_lossV0�B~�� $       B+�M	*VÞU��A�*

Training_loss�~BD�_$       B+�M	� �U��A�*

Training_loss��Bϵ9$       B+�M	�|�U��A�*

Training_loss\�kBUa}o$       B+�M	&�؟U��A�*

Training_lossnE�BYv��$       B+�M	��5�U��A�*

Training_loss�	,B��)a$       B+�M	JB��U��A�*

Training_loss��ZB�fD�$       B+�M	�l��U��A�*

Training_loss0L�B`�L�$       B+�M	u�I�U��A�*

Training_loss�K�Bm��j$       B+�M	F��U��A�*

Training_lossjNpB���Z$       B+�M	���U��A�*

Training_loss?B��&�$       B+�M	 %^�U��A�*

Training_loss^TB��$       B+�M	a���U��A�*

Training_loss�2B���$       B+�M	���U��A�*

Training_loss��SBBR��*       ����	n�ڣU��A�*

Validation_accuracy$$M?�j&       sO� 	��ڣU��A�*

Validation_loss�eUBq0$       B+�M	 Sd�U��A�*

Training_lossf�By�#=$       B+�M	=��U��A�*

Training_loss��{B�s�$       B+�M	��U��A�*

Training_loss�bB��$       B+�M	�x�U��A�*

Training_loss9XBf�OO$       B+�M	0-զU��A�*

Training_lossY_BP{`$       B+�M	m1�U��A�*

Training_loss:GB.͈R$       B+�M	-^��U��A�*

Training_lossA7fB}� $       B+�M	L��U��A�*

Training_loss�q�B�I�$       B+�M	��F�U��A�*

Training_loss���B5e�$       B+�M	<���U��A�*

Training_loss��B%؎�$       B+�M	����U��A�*

Training_loss25^B����$       B+�M	Q�[�U��A�*

Training_loss�zB�{1�$       B+�M	�\��U��A�*

Training_loss�+sB��c$       B+�M	��!�U��A�*

Training_loss�[BH��$       B+�M	x���U��A�*

Training_losslB�!$?$       B+�M	7��U��A�*

Training_loss� �B�ӡ�$       B+�M	@�<�U��A�*

Training_lossbajB��aa$       B+�M	O��U��A�*

Training_loss��3B�Є$       B+�M	���U��A�*

Training_lossF�IB�L̟$       B+�M	d�R�U��A�*

Training_loss\JnB}���$       B+�M	us��U��A�*

Training_loss���B�\I�$       B+�M	��U��A�*

Training_loss��rB}Ǟ$       B+�M	�h�U��A�*

Training_lossD��B�+�O$       B+�M	uWíU��A�*

Training_loss��sB�I=E$       B+�M	mY!�U��A�*

Training_loss��UB�ڀ$       B+�M	h}�U��A�*

Training_loss�]�B�1$       B+�M	�,ٮU��A�*

Training_loss߁�B�σ$       B+�M	�5�U��A�*

Training_loss
 _B��t$       B+�M	J���U��A�*

Training_loss �TB����$       B+�M	����U��A�*

Training_loss��jBV��$       B+�M	&6J�U��A�*

Training_loss�f�B]la�$       B+�M	�=��U��A�*

Training_loss\52BT�e:$       B+�M	P��U��A�*

Training_lossd��B����$       B+�M	h�i�U��A�*

Training_loss�J�Bǰ��$       B+�M	ܹűU��A�*

Training_loss�RlBյ$       B+�M	'�!�U��A�*

Training_loss
�BH`ό$       B+�M	�}�U��A�*

Training_loss1ۏBJ��E$       B+�M	��ٲU��A�*

Training_loss�9�B	d��$       B+�M	��5�U��A�*

Training_lossh\�Bd�$       B+�M	,G��U��A�*

Training_loss
��B	E4�$       B+�M	 b�U��A�*

Training_loss���B�ód$       B+�M	MH�U��A�*

Training_loss�FB����$       B+�M	c^��U��A�*

Training_loss�yB)�D�$       B+�M	]��U��A�*

Training_loss�B�B�E8�$       B+�M	�*]�U��A�*

Training_loss��JB��$       B+�M	I��U��A�*

Training_lossRr�B�Td5$       B+�M	؀�U��A�*

Training_loss�rBC(3$       B+�M		s�U��A�*

Training_loss��2Bo9�$       B+�M	]϶U��A�*

Training_loss�4XBd �9$       B+�M	��*�U��A�*

Training_lossT5/B����*       ����	6�U��A�*

Validation_accuracyyyM?$�&X&       sO� 	d�U��A�*

Validation_loss��VB���$       B+�M	~��U��A�*

Training_loss$'�B6U�G$       B+�M	�۹U��A�*

Training_loss�ԂBY�\$       B+�M	'J7�U��A�*

Training_lossVz�B�V�$       B+�M	��U��A�*

Training_lossb�aB3��$       B+�M	=�U��A�*

Training_loss~3B*'SQ$       B+�M	��L�U��A�*

Training_loss��B�2$       B+�M	����U��A�*

Training_loss�~B��y�$       B+�M	36�U��A�*

Training_loss�_�Bj#��$       B+�M	ma�U��A�*

Training_loss�ɎB�r�m$       B+�M	�G��U��A�*

Training_lossD��B�G:$       B+�M	���U��A�*

Training_loss
�1Bݿ	($       B+�M	F$v�U��A�*

Training_loss3u�B	��9$       B+�M	��ѽU��A�*

Training_lossb��BA���$       B+�M	�-�U��A�*

Training_loss��sB�+�$       B+�M	|(��U��A�*

Training_lossMn4BYG�R$       B+�M	)=�U��A�*

Training_lossi��B�0�$       B+�M	}xB�U��A�*

Training_loss(�BO��$       B+�M	���U��A�*

Training_loss�0BMV�J$       B+�M		��U��A�*

Training_losst�JB̫ۦ$       B+�M	��V�U��A�*

Training_lossBh}B��0�$       B+�M	R��U��A�*

Training_loss��?B֭�$       B+�M	1%�U��A�*

Training_loss��oB%�!!$       B+�M	�(j�U��A�*

Training_loss2�BA6:$       B+�M	y]��U��A�*

Training_loss� �B�?�7$       B+�M	�L"�U��A�*

Training_loss~^aB��4�$       B+�M	�i~�U��A�*

Training_loss@�MB�]��$       B+�M	E���U��A�*

Training_losspE�BG�$       B+�M	��6�U��A�*

Training_loss�dB|y�$       B+�M	_���U��A�*

Training_loss �~B���#$       B+�M	����U��A�*

Training_loss8�pB��	$       B+�M	�O�U��A�*

Training_lossX�QB�7��$       B+�M	����U��A�*

Training_loss�XCB�o��$       B+�M	2��U��A�*

Training_loss���B���$       B+�M	��b�U��A�*

Training_loss|�oBު/$       B+�M	�ڿ�U��A�*

Training_loss��B.���$       B+�M	�m�U��A�*

Training_loss��\B����$       B+�M	C�y�U��A�*

Training_lossL�B��t$       B+�M	����U��A�*

Training_loss��oB�:��$       B+�M	��0�U��A�*

Training_lossܰ�B>-�$       B+�M	{���U��A�*

Training_loss���B�F�$       B+�M	k���U��A�*

Training_loss�G5B}(5$       B+�M	��D�U��A�*

Training_loss���Bt
x�$       B+�M	�p��U��A�*

Training_lossj�]B@p@$       B+�M	b���U��A�*

Training_loss�(uB/�$       B+�M	sj�U��A�*

Training_loss�QXB��$       B+�M	X��U��A�*

Training_loss�gB<��
$       B+�M	�*"�U��A�*

Training_loss(BM���$       B+�M	)"~�U��A�*

Training_lossIjB��T�$       B+�M	G���U��A�*

Training_loss�OBf{6$       B+�M	�6�U��A�*

Training_loss��MB�l�Y*       ����	���U��A�*

Validation_accuracy{zM?º�&       sO� 	r���U��A�*

Validation_loss@YBٸ+�$       B+�M	O���U��A�*

Training_lossG�4B�l2y$       B+�M	����U��A�*

Training_lossWC�Bh;�$       B+�M	U�K�U��A�*

Training_loss��B��w�$       B+�M	l"��U��A�*

Training_loss$�SB} :$       B+�M	(��U��A�*

Training_loss��hB���$       B+�M	)�j�U��A�*

Training_loss8SXBً��$       B+�M	=}��U��A�*

Training_loss�B�Ic$       B+�M	��#�U��A�*

Training_loss�urBH��$       B+�M	�X��U��A�*

Training_loss��NB����$       B+�M	m���U��A�*

Training_loss,9�B�߽B$       B+�M	?s7�U��A�*

Training_loss�9�Bt�m�$       B+�M	����U��A�*

Training_loss�)zBJ4�$       B+�M	�
��U��A�*

Training_loss�)yB�}>$       B+�M	L�U��A�*

Training_loss�ȈBHx��$       B+�M	y̧�U��A�*

Training_loss�BΉ�M$       B+�M	���U��A�*

Training_lossB�ZB�V��$       B+�M	F@`�U��A�*

Training_loss93QBC��$       B+�M	���U��A�*

Training_loss>�eB�I�k$       B+�M	m�U��A�*

Training_loss Z�B���[$       B+�M	F\t�U��A�*

Training_loss�yBSx�$       B+�M	 S��U��A�*

Training_loss|�B��)�$       B+�M	��+�U��A�*

Training_loss�	�Bs�$       B+�M	8��U��A�*

Training_losso��B5��$       B+�M	���U��A�*

Training_lossxCB��'$       B+�M	��?�U��A�*

Training_loss摠B��$       B+�M	j���U��A�*

Training_lossR��B��$       B+�M	��U��A�*

Training_lossL��BES��$       B+�M	��S�U��A�*

Training_loss���B�&'$       B+�M	vQ��U��A�*

Training_loss�MB�V6j$       B+�M	a��U��A�*

Training_loss�x+B�=�}$       B+�M	�Rh�U��A�*

Training_loss���B!��$       B+�M	���U��A�*

Training_loss�F�B�4\$       B+�M	F� �U��A�*

Training_loss�fuBo�$       B+�M	|�U��A�*

Training_loss��PB�	��$       B+�M	����U��A�*

Training_lossx�B��6$       B+�M	�3�U��A�*

Training_loss�dB��$       B+�M	�
��U��A�*

Training_loss�s�B5�^�$       B+�M	����U��A�*

Training_loss��FB���$       B+�M	�cF�U��A�*

Training_lossK�B�r�E$       B+�M	L��U��A�*

Training_loss±bBw���$       B+�M	����U��A�*

Training_lossElBr��$       B+�M	�@Z�U��A�*

Training_lossd.�Be�Ĵ$       B+�M	׶�U��A�*

Training_lossd�`BW�4z$       B+�M	;��U��A�*

Training_loss�GB�<�$       B+�M	�n�U��A�*

Training_loss��^B�(�c$       B+�M	�_��U��A�*

Training_lossTiB)��L$       B+�M	¡&�U��A�*

Training_lossZk�B��$       B+�M	����U��A�*

Training_loss w\BcI*$       B+�M	����U��A�*

Training_loss�>BVŐ$       B+�M	�:�U��A�*

Training_lossP�]B��+?*       ����	�W��U��A�*

Validation_accuracy��K?���&       sO� 	-Z��U��A�*

Validation_loss@�_B�q$       B+�M	���U��A�*

Training_loss�3BB�U�$       B+�M	����U��A�*

Training_lossE�B~+]$       B+�M	ǞT�U��A�*

Training_loss�#vB���$       B+�M	>!��U��A�*

Training_lossrBjQ�$       B+�M	/��U��A�*

Training_loss1q�B7$5�$       B+�M	�Nh�U��A�*

Training_loss�hZBd�p�$       B+�M	s���U��A�*

Training_loss;�hB��x$       B+�M	-�!�U��A�*

Training_loss�SeB֓�b$       B+�M	s�~�U��A�*

Training_loss���B���$       B+�M	F��U��A�*

Training_loss�!~BjE�R$       B+�M	ux6�U��A�*

Training_loss:[B�O�y$       B+�M	�7��U��A�*

Training_loss� _B.H9	$       B+�M	���U��A�*

Training_loss��WB7���$       B+�M	�\J�U��A�*

Training_loss,�]B��R$       B+�M	JA��U��A�*

Training_loss^�B�hǾ$       B+�M	l|�U��A�*

Training_loss=\BW�$       B+�M	��^�U��A�*

Training_loss=H[B'=�($       B+�M	6X��U��A�*

Training_loss6�tBs���$       B+�M	 -�U��A�*

Training_loss9�MB�5p$       B+�M	O��U��A�*

Training_lossG�BL2��$       B+�M	� �U��A�*

Training_loss��VBr�)�$       B+�M	�\��U��A�*

Training_loss�܆BtW�$       B+�M	�^�U��A�*

Training_loss���B���q$       B+�M	)\l�U��A�*

Training_loss�OJB|B��$       B+�M	6���U��A�*

Training_loss�!aB�ມ$       B+�M	�A�U��A�*

Training_loss��VB�}W$       B+�M	�V��U��A�*

Training_loss�UB�s�$       B+�M	�G�U��A�*

Training_loss�HuBS-�$       B+�M	q���U��A�*

Training_loss��vBsW�$       B+�M	b���U��A�*

Training_loss�kB�j]=$       B+�M	�?[�U��A�*

Training_lossl�{B��$       B+�M	1x��U��A�*

Training_loss ��Bs���$       B+�M	qVD�U��A�*

Training_loss�rhB�%o�$       B+�M	WЮ�U��A�*

Training_lossX�B�5��$       B+�M	H��U��A�*

Training_lossڹ�B��Y9$       B+�M	�U��A�*

Training_loss�yaB�Y|�$       B+�M	.���U��A�*

Training_loss6�B0��$       B+�M	d$W�U��A�*

Training_loss �mB�{�$       B+�M	���U��A�*

Training_loss�hB�m
 $       B+�M	���U��A�*

Training_loss�{B3N�$       B+�M	���U��A�*

Training_loss��KB���$       B+�M	w��U��A�*

Training_lossQ�^BƩ�$       B+�M	�d�U��A�*

Training_loss�Y�BL�R�$       B+�M	�6��U��A�*

Training_loss<B�+-$       B+�M	V)�U��A�*

Training_loss��_BA+W0$       B+�M	O̊�U��A�*

Training_loss�yB��$       B+�M	�]��U��A�*

Training_loss�dBńae$       B+�M	)�C�U��A�*

Training_loss��BR�;�$       B+�M	em��U��A�*

Training_lossFB4�s�$       B+�M	N�U��A�*

Training_lossH.�BD�ϙ*       ����	]��U��A�*

Validation_accuracy��N?ȹ4&       sO� 	3��U��A�*

Validation_lossTcQB��U�$       B+�M	����U��A�*

Training_loss<��B0�M$       B+�M	>�D�U��A�*

Training_loss�B�,�i$       B+�M	F#��U��A�*

Training_lossS$jB�/�$       B+�M	�
�U��A�*

Training_loss�DBB�o$       B+�M	k�o�U��A�*

Training_loss=�AB�~�$       B+�M	����U��A�*

Training_loss#��Bv��q$       B+�M	�0�U��A�*

Training_lossR�B�+g�$       B+�M	���U��A�*

Training_loss�oB���$       B+�M	Cr�U��A�*

Training_loss�wB!(��$       B+�M	�Ҍ�U��A�*

Training_loss'aB�ˍ$       B+�M	Ý��U��A�*

Training_lossӷpB�fA�$       B+�M	��u�U��A�*

Training_loss��wB��3$       B+�M	q��U��A�*

Training_lossr�wBC��?$       B+�M	��h�U��A�*

Training_loss%CB'D�$       B+�M	�W��U��A�*

Training_loss` ;B)���$       B+�M	;e�U��A�*

Training_loss�?-B����$       B+�M	�7��U��A�*

Training_loss�xUBO`?�$       B+�M	sh_�U��A�*

Training_loss��\B��6$       B+�M	����U��A�*

Training_loss� uBA�R7$       B+�M	�rX V��A�*

Training_loss��FBy�v@$       B+�M	�� V��A�*

Training_loss��xB�n*�$       B+�M	 �kV��A�*

Training_loss�UB����$       B+�M	&T�V��A�*

Training_loss�ofB4^��$       B+�M	K?�V��A�*

Training_loss�֊B�_�$       B+�M	�$V��A�*

Training_lossd1gByP�0$       B+�M	�&�V��A�*

Training_loss��B�3��$       B+�M	AV��A�*

Training_loss2bABG+��$       B+�M	zq�V��A�*

Training_loss�OB�6f2$       B+�M	:�V��A�*

Training_loss�!�B�{U?$       B+�M	g*�V��A�*

Training_loss��:BD�X�$       B+�M	$�V��A�*

Training_loss �BL ��$       B+�M	�)�V��A�*

Training_loss6�\B����$       B+�M	�xV��A�*

Training_loss��QBy�Pv$       B+�M	�q{V��A�*

Training_loss~\GB�$       B+�M	��V��A�*

Training_loss�yB�J�R$       B+�M	�aV��A�*

Training_lossg�ZB&���$       B+�M	L��V��A�*

Training_loss4ZBH6�|$       B+�M	�o+	V��A�*

Training_lossg�Be?b$       B+�M	=�	V��A�*

Training_loss�I6B��h0$       B+�M	�l�	V��A�*

Training_loss��3B��V�$       B+�M	rMh
V��A�*

Training_lossͤoBg'�$       B+�M	zl�
V��A�*

Training_lossWNiBvŉI$       B+�M	ک=V��A�*

Training_loss^wrB�6Yu$       B+�M	�V��A�*

Training_loss��B]�9"$       B+�M	#V��A�*

Training_lossN�qB�0�$       B+�M	3�dV��A�*

Training_loss~h�BPʒ�$       B+�M	���V��A�*

Training_losso|xB.�
,$       B+�M	d�%V��A�*

Training_loss��nB���$       B+�M	��V��A�*

Training_loss�OB���&$       B+�M	�R�V��A�*

Training_loss��|B�Z5g*       ����	�4�V��A�*

Validation_accuracyxxM?�M�T&       sO� 	7�V��A�*

Validation_loss��NB��P�$       B+�M	 ԋV��A�*

Training_loss	Bl� $       B+�M	���V��A�*

Training_lossJ�*BN��$       B+�M	Y�TV��A�*

Training_loss�aB�à$       B+�M	Y�V��A�*

Training_loss;<�B���c$       B+�M	/4V��A�*

Training_lossЕqB�a7�$       B+�M	bj�V��A�*

Training_loss
�JB�&�$       B+�M	N_�V��A�*

Training_lossH�"Bz��$       B+�M	��PV��A�*

Training_loss`CuB�	��$       B+�M	�V��A�*

Training_lossŖ=B��SG$       B+�M	NV��A�*

Training_loss�IABY�F($       B+�M	;�nV��A�*

Training_loss��DB��F$       B+�M	x��V��A�*

Training_loss�$bB5u��$       B+�M	�wEV��A�*

Training_loss�O�B�G�#$       B+�M	.ȢV��A�*

Training_lossX<Bf�m$       B+�M	�V��A�*

Training_loss��HB8��e$       B+�M	��sV��A�*

Training_loss�#kBqwҸ$       B+�M	�"�V��A�*

Training_lossvEGB�'�I$       B+�M	rP?V��A�*

Training_lossP?YBޤ�$       B+�M	�"�V��A�*

Training_lossL��B�8�T$       B+�M	ۉV��A�*

Training_loss�_EB�l�$       B+�M	=�fV��A�*

Training_loss�9BӾm�$       B+�M	���V��A�*

Training_lossn��B��A�$       B+�M	6Z)V��A�*

Training_loss槄B����$       B+�M	t��V��A�*

Training_loss��B쪮$       B+�M	�e�V��A�*

Training_loss��B�%�x$       B+�M	�)XV��A�*

Training_lossdPYB��$       B+�M	Ul�V��A�*

Training_lossnSB�D $       B+�M	|�V��A�*

Training_loss\�hB���$       B+�M	�W}V��A�*

Training_lossfh`B3��$       B+�M	�[�V��A�*

Training_lossJOSB���	$       B+�M	�EV��A�*

Training_losssJaB#&Xi$       B+�M	���V��A�*

Training_loss���B��`$       B+�M	��V��A�*

Training_lossʻ>B��v$       B+�M	fM�V��A�*

Training_loss�sBCF$       B+�M	��V��A�*

Training_loss޲�B~��y$       B+�M	�JV��A�*

Training_lossV-
B?+�$       B+�M	(�V��A�*

Training_loss��:Bۯ�$       B+�M	'�V��A�*

Training_loss0�mBB��$       B+�M	襏V��A�*

Training_loss
�B�|�:$       B+�M	R V��A�*

Training_loss�)�B�3��$       B+�M	l
� V��A�*

Training_loss��cB ߦ;$       B+�M	�6!V��A�*

Training_loss�%B�8�$       B+�M	>p!V��A�*

Training_lossH�WB�1��$       B+�M	->�!V��A�*

Training_loss�XB����$       B+�M	r�I"V��A�*

Training_loss�nB�f$       B+�M	���"V��A�*

Training_losshz�B�΋)$       B+�M	,�<#V��A�*

Training_loss6HB��vu$       B+�M	���#V��A�*

Training_lossb��B��S$       B+�M	
e	$V��A�*

Training_loss�fB�?F1$       B+�M	��$V��A�*

Training_loss��;B�w6*       ����	m�|%V��A�*

Validation_accuracyyyN?섽�&       sO� 	y�|%V��A�*

Validation_loss[6PB�	��$       B+�M	Ke'V��A�*

Training_loss�u�B����$       B+�M	$_�'V��A�*

Training_loss�_�B[Āa$       B+�M	��'(V��A�*

Training_loss��aB�]U$       B+�M	I��(V��A�*

Training_loss�YUB��:�$       B+�M	��(V��A�*

Training_loss�<GB���$       B+�M	vnH)V��A�*

Training_loss<�<B�<��$       B+�M	Ů�)V��A�*

Training_loss��B�$k�$       B+�M	��*V��A�*

Training_loss��_B��A�$       B+�M	�	_*V��A�*

Training_loss@Z�BH�+$       B+�M	��*V��A�*

Training_loss��PB����$       B+�M	��)+V��A�*

Training_lossq,cB���#$       B+�M	�d�+V��A�*

Training_loss�7EB=c�$       B+�M	��,V��A�*

Training_loss( �Ba7R!$       B+�M	��w,V��A�*

Training_loss��SB�u��$       B+�M	���,V��A�*

Training_loss/�MBХ�$       B+�M	�tI-V��A�*

Training_lossg�JBZ��g$       B+�M	KX�-V��A�*

Training_loss�hDB�B[$       B+�M	�?.V��A�*

Training_loss�]Bq$       B+�M	��w.V��A�*

Training_lossb�B����$       B+�M	8��.V��A�*

Training_loss�(AB[DW$       B+�M	'MA/V��A�*

Training_loss`�'BN��$       B+�M	���/V��A�*

Training_loss�WJB���l$       B+�M	��0V��A�*

Training_loss�NB��$       B+�M	�ދ0V��A�*

Training_loss�$B���$       B+�M	+51V��A�*

Training_loss��iB�qW$       B+�M	:�1V��A�*

Training_loss��JB�]ڜ$       B+�M	L��1V��A�*

Training_loss7`B�N�$       B+�M	��`2V��A�*

Training_loss�7Bh@�$       B+�M	�¿2V��A�*

Training_loss�{B��A�$       B+�M	�b!3V��A�*

Training_loss~XB<�0&$       B+�M	�3�3V��A�*

Training_loss8m=B	Q��$       B+�M	y��3V��A�*

Training_loss�/EB
:��$       B+�M	�pF4V��A�*

Training_loss�|�B�a'$       B+�M	���4V��A�*

Training_loss�{[BRE�6$       B+�M	��5V��A�*

Training_loss��GB�<�]$       B+�M	z�f5V��A�*

Training_loss�RuB���$       B+�M	i9�5V��A�*

Training_lossԿ�B&j!�$       B+�M	n$6V��A�*

Training_loss��FB�3�$       B+�M	xς6V��A�*

Training_loss�4#B��$       B+�M	;�6V��A�*

Training_loss1pB���$       B+�M	GA7V��A�*

Training_loss��}B��+$       B+�M	�7V��A�*

Training_loss
:Bс�$       B+�M	�8V��A�*

Training_lossG�BFUkA$       B+�M	B?e8V��A�*

Training_lossV�&B� R$       B+�M	y��8V��A�*

Training_lossnhKB/�g`$       B+�M	k!9V��A�*

Training_loss8��B
�k�$       B+�M	���9V��A�*

Training_loss�vB�=$       B+�M	˻�9V��A�*

Training_loss�ՋB'�$�$       B+�M	1�D:V��A�*

Training_losst;zB1��$       B+�M	hu�:V��A�*

Training_loss^eB~�A#*       ����	>A|;V��A�*

Validation_accuracy��M?_��&       sO� 	tC|;V��A�*

Validation_loss��IB-���$       B+�M	��Z=V��A�*

Training_loss�kqB�j�$       B+�M	A׸=V��A�*

Training_loss	BB�]�$       B+�M	��>V��A�*

Training_loss�2B�`��$       B+�M	�x>V��A�*

Training_lossv�zBtd�V$       B+�M	���>V��A�*

Training_loss�wBk\$       B+�M	c�6?V��A�*

Training_loss�L.Bݒs�$       B+�M	=|�?V��A�*

Training_loss�|'BW<$       B+�M	Yl@V��A�*

Training_loss'�4B󰩋$       B+�M	��o@V��A�*

Training_loss�s�Br�ũ$       B+�M	���@V��A�*

Training_loss�lBo�}$       B+�M	��@AV��A�*

Training_loss�JB�h0O$       B+�M	�f�AV��A�*

Training_loss&M~B��V$       B+�M	4�BV��A�*

Training_loss�DB�r <$       B+�M	"�dBV��A�*

Training_loss��Blr��$       B+�M	E-�BV��A�*

Training_lossT~B����$       B+�M	��%CV��A�*

Training_loss��eBbm��$       B+�M	�ĖCV��A�*

Training_loss� JBj��$       B+�M	���CV��A�*

Training_loss��NBc��c$       B+�M	:@ZDV��A�*

Training_lossupwB���|$       B+�M	&�DV��A�*

Training_lossMB��M�$       B+�M	�EV��A�*

Training_lossPB���$       B+�M	:zEV��A�*

Training_loss�+B��v�$       B+�M	E��EV��A�*

Training_loss�'WB����$       B+�M	��?FV��A�*

Training_loss։�B̰P�$       B+�M	�ѤFV��A�*

Training_loss.�dB��$       B+�M	��GV��A�*

Training_loss�/B�=�j$       B+�M	���GV��A�*

Training_loss�EB�h�U$       B+�M	?��GV��A�*

Training_loss>�?B<�r�$       B+�M	��jHV��A�*

Training_loss��7B�=$       B+�M	���HV��A�*

Training_loss�	9B�$       B+�M	c)+IV��A�*

Training_lossztMB�ew�$       B+�M	�ËIV��A�*

Training_loss NB#���$       B+�M	�m�IV��A�*

Training_lossBfIB`$       B+�M	�XJV��A�*

Training_loss!�sBݎ��$       B+�M	4-�JV��A�*

Training_loss��nBs��+$       B+�M	Ww KV��A�*

Training_loss��=B���g$       B+�M	��}KV��A�*

Training_lossN�B�c$�$       B+�M	�|�KV��A�*

Training_loss[x�B����$       B+�M	�:LV��A�*

Training_lossd�B��$       B+�M	�l�LV��A�*

Training_loss���B���J$       B+�M	2�MV��A�*

Training_loss+�rB;��$       B+�M	�vMV��A�*

Training_lossR_�BQ��$       B+�M	�)�MV��A�*

Training_lossUL'BG�iD$       B+�M	Z�oNV��A�*

Training_loss;>B[M0�$       B+�M	` OV��A�*

Training_loss��B��(+$       B+�M	`��OV��A�*

Training_loss�tB���$       B+�M	_�PV��A�*

Training_loss�~BHo�t$       B+�M	�nPV��A�*

Training_loss�k7B�hG�$       B+�M	9b�PV��A�*

Training_loss �]B8G�h$       B+�M	.�5QV��A�*

Training_lossj6�B����*       ����	��RV��A�*

Validation_accuracy��M?���&       sO� 	��RV��A�*

Validation_lossE�JB��Hm$       B+�M	S<TV��A�*

Training_loss$�VBlӆ�$       B+�M	2wTV��A�*

Training_loss�XB��\$       B+�M	��TV��A�*

Training_loss�~B���i$       B+�M	,�?UV��A�*

Training_loss�YB|�-$       B+�M	�
�UV��A�*

Training_loss��6B�za�$       B+�M	��VV��A�*

Training_loss��4Bn~�U$       B+�M	��VV��A�*

Training_loss.jNB%���$       B+�M	$&WV��A�*

Training_loss� ,BI�$       B+�M	��jWV��A�*

Training_loss��WB5"�$       B+�M	
�WV��A�*

Training_loss��AB��~F$       B+�M	�_EXV��A�*

Training_loss:�~B���q$       B+�M	J{�XV��A�*

Training_lossM�VB�.�9$       B+�M	�>YV��A�*

Training_loss� BB3z3$       B+�M	=F�YV��A�*

Training_loss�vBۜ��$       B+�M	9�5ZV��A�*

Training_loss	MZB�#�$       B+�M	��ZV��A�*

Training_losso�EBdvB$       B+�M	��[V��A�*

Training_loss�: BXM�o$       B+�M	��g[V��A�*

Training_loss�FRBq<��$       B+�M	�e�[V��A�*

Training_loss��
BH^;$       B+�M	�};\V��A�*

Training_loss	
B���$       B+�M	�o�\V��A�*

Training_loss��LB~g�$       B+�M	��8]V��A�*

Training_lossV�EB��_*$       B+�M	 ��]V��A�*

Training_loss
 BҠR$       B+�M	��8^V��A�*

Training_loss$�,B��p6$       B+�M	�^V��A�*

Training_loss4}nBH���$       B+�M	��:_V��A�*

Training_loss��OB�(I$       B+�M	�آ_V��A�*

Training_loss	MNB�C�$       B+�M	��`V��A�*

Training_loss@�<B�܂I$       B+�M	u`V��A�*

Training_loss��B&���$       B+�M	�y�`V��A�*

Training_loss���Bj�6$       B+�M	B�AaV��A�*

Training_loss̊B�l֬$       B+�M	���aV��A�*

Training_loss
�BZieH$       B+�M	H�aV��A�*

Training_loss�%�BF��6$       B+�M	,e\bV��A�*

Training_loss��?B�M�$       B+�M	�bV��A�*

Training_loss��B�v�Q$       B+�M	y<cV��A�*

Training_loss�TB��BN$       B+�M	GwycV��A�*

Training_loss�3�B�'{�$       B+�M	���cV��A�*

Training_lossZ�B{�ޜ$       B+�M	Ϥ;dV��A�*

Training_lossGB����$       B+�M	7��dV��A�*

Training_loss~ȊB܁�$       B+�M	��dV��A�*

Training_lossxA]B)��$       B+�M	7�^eV��A�*

Training_lossQAgB<�i�$       B+�M	,ؼeV��A�*

Training_losscgB�t�Q$       B+�M	
� fV��A�*

Training_lossbtB��x�$       B+�M	�̀fV��A�*

Training_loss�"cB*1�7$       B+�M	�@�fV��A�*

Training_lossn�DB���$       B+�M	�AgV��A�*

Training_loss��<B_B�-$       B+�M	t�gV��A�*

Training_loss.<aBu���$       B+�M	�*�gV��A�*

Training_lossÆNBz�9�$       B+�M	{�_hV��A�*

Training_loss<(B�Ý#*       ����	*(iV��A�*

Validation_accuracy#"N?���&       sO� 	�(iV��A�*

Validation_loss��HB�c�$       B+�M	�^kV��A�*

Training_loss�ffBߴ�$       B+�M	�ehkV��A�*

Training_loss�BB�'K	$       B+�M	��kV��A�*

Training_lossWcB�$��$       B+�M	��'lV��A�*

Training_loss��HBG���$       B+�M	���lV��A�*

Training_loss��"B�F�$       B+�M	Jb�lV��A�*

Training_loss��LB�k�z$       B+�M	o�JmV��A�*

Training_losso�"B�N�$       B+�M	8��mV��A�*

Training_losslpQB�nO$       B+�M	�CnV��A�*

Training_loss���B8���$       B+�M	�onnV��A�*

Training_loss��LB�hX$       B+�M	4��nV��A�*

Training_loss(�NB@�F$       B+�M	�J)oV��A�*

Training_loss�.nB6T�$       B+�M	���oV��A�*

Training_loss4,B�Y��$       B+�M	� �oV��A�*

Training_loss�|�BK�$       B+�M	��npV��A�*

Training_lossΤ-B����$       B+�M	��pV��A�*

Training_loss#�)B���$       B+�M	��SqV��A�*

Training_loss_:GB��$       B+�M	�<�qV��A�*

Training_loss�L1B���$       B+�M	�h6rV��A�*

Training_loss��;B���$       B+�M	�ӢrV��A�*

Training_loss� [B ӥ$       B+�M	lsV��A�*

Training_loss6V0B�{��$       B+�M	�b{sV��A�*

Training_lossU�^B^��$       B+�M		��sV��A�*

Training_loss4J1B����$       B+�M	�^tV��A�*

Training_loss|B,��!$       B+�M	l��tV��A�*

Training_loss@�{B����$       B+�M	SBGuV��A�*

Training_loss��OB
� �$       B+�M	�p�uV��A�*

Training_loss
�zB@�,�$       B+�M	�/vV��A�*

Training_losspe]B�˾$       B+�M	�-�vV��A�*

Training_lossPjB�Ļ$       B+�M	��wV��A�*

Training_loss}}BdE�&$       B+�M	��wV��A�*

Training_loss�[bB�4y�$       B+�M	��xV��A�*

Training_loss�UB�KO�$       B+�M	ڨ~xV��A�*

Training_loss�c<B)���$       B+�M	���xV��A�*

Training_loss�(B�Ey$       B+�M	NBAyV��A�*

Training_loss�iB�H�($       B+�M	h�yV��A�*

Training_loss�SB�v�4$       B+�M	�jzV��A�*

Training_loss��SB.��$       B+�M	�J�zV��A�*

Training_loss�,QB�r$       B+�M	%>
{V��A�*

Training_loss��<BZ�e$       B+�M	Gw|{V��A�*

Training_lossҊB�vnp$       B+�M	K��{V��A�*

Training_loss�c�B���$       B+�M	H�e|V��A�*

Training_loss��bB# `z$       B+�M	{��|V��A�*

Training_loss���B��$       B+�M	_�K}V��A�*

Training_loss�PB��$       B+�M	f/�}V��A�*

Training_loss8�B ߎU$       B+�M	�7~V��A�*

Training_loss3�|B��Z�$       B+�M	7Ǧ~V��A�*

Training_lossCbxBI[�$       B+�M	ςV��A�*

Training_loss�tBr�>$       B+�M	�K�V��A�*

Training_loss�[7B�	e$       B+�M	���V��A�*

Training_loss�&=BT�T�*       ����	"��V��A�*

Validation_accuracy��M?ލ�&       sO� 	��V��A�*

Validation_loss�kIB�$H$       B+�M	~�4�V��A�*

Training_loss6f2B���!$       B+�M	
-��V��A�*

Training_loss��B�!�$       B+�M	��&�V��A�*

Training_loss��/B����$       B+�M	9���V��A�*

Training_loss�ZB��L$       B+�M	y)�V��A�*

Training_loss�%B֏�$       B+�M	����V��A�*

Training_loss�CQB�-��$       B+�M	���V��A�*

Training_lossaA@BBt�'$       B+�M	��J�V��A�*

Training_lossz�DBW^�b$       B+�M	�誆V��A�*

Training_lossc��B��$       B+�M	
��V��A�*

Training_lossb�^B��x$       B+�M	��p�V��A�*

Training_lossL�=B¶�j$       B+�M	�n҇V��A�*

Training_loss�,bB�[��$       B+�M	U�0�V��A�*

Training_loss�=B��K$       B+�M	�X��V��A�*

Training_lossРTBW��$       B+�M	���V��A�*

Training_loss�~GBLk�$       B+�M	��N�V��A�*

Training_loss�eqB1�R�$       B+�M	o���V��A�*

Training_lossP�Bs�}$       B+�M	-��V��A�*

Training_loss��NB�҃$       B+�M	׉y�V��A�*

Training_loss��B�4*$       B+�M	s���V��A�*

Training_loss(�AC v�$       B+�M	ڭq�V��A�*

Training_lossD�B�L))$       B+�M	o��V��A�*

Training_loss�9B9��$       B+�M	YRa�V��A�*

Training_loss�T=Be���$       B+�M	'M܌V��A�*

Training_lossT�9B��$       B+�M	3�Q�V��A�*

Training_loss�CEB�u��$       B+�M	J�ȍV��A�*

Training_loss��.B�&�k$       B+�M	1�<�V��A�*

Training_loss
�uB�h��$       B+�M	jɎV��A�*

Training_loss�;wB-[d�$       B+�M	ǛQ�V��A�*

Training_lossv�[B)G\$       B+�M	�x׏V��A�*

Training_lossY�-Br��$       B+�M	��T�V��A�*

Training_lossm�LB/���$       B+�M	5�ʐV��A�*

Training_lossUB[U
�$       B+�M	{M=�V��A�*

Training_loss��_B
-Ɉ$       B+�M	�2��V��A�*

Training_loss�I�B5��$       B+�M	b��V��A�*

Training_losscB���$       B+�M	�{��V��A�*

Training_loss<e�Bh��$       B+�M	er(�V��A�*

Training_lossIuB+�$       B+�M	aR��V��A�*

Training_loss��B_$C�$       B+�M	%�V��A�*

Training_loss��0Bw��$       B+�M	<�D�V��A�*

Training_loss[B��$       B+�M	t��V��A�*

Training_loss��!B��[$       B+�M	t��V��A�*

Training_lossUBU�C>$       B+�M	<lq�V��A�*

Training_lossӕB�7MO$       B+�M	ՒޕV��A�*

Training_lossj'Bj�E$       B+�M	��<�V��A�*

Training_lossW�B�Q$       B+�M	K��V��A�*

Training_loss(�TBB���$       B+�M	`��V��A�*

Training_loss[�B�D�$       B+�M	#�T�V��A�*

Training_loss"p-B��O$       B+�M	#���V��A�*

Training_loss�܄B��$       B+�M	�k�V��A�*

Training_loss4�HB��)�*       ����	�ޘV��A�*

Validation_accuracyxwM?=���&       sO� 	�ޘV��A�*

Validation_loss�QHB��m�$       B+�M	|F��V��A�*

Training_loss0FjB�dY$       B+�M	9~$�V��A�*

Training_loss.�.B�)�-$       B+�M	����V��A�*

Training_loss�BBs6ER$       B+�M	���V��A�*

Training_lossZ�7B����$       B+�M	����V��A�*

Training_loss��#B�0
�$       B+�M	H��V��A�*

Training_loss��XB ��$       B+�M	�8\�V��A�*

Training_losslMWB�)�$       B+�M	*���V��A�*

Training_loss�BP�K�$       B+�M	�*�V��A�*

Training_loss�hHBh(�$       B+�M	����V��A�*

Training_loss�7B۸��$       B+�M	G��V��A�*

Training_loss�QDB��5�$       B+�M	~�I�V��A�*

Training_lossGB���$       B+�M	���V��A�*

Training_lossfvB6���$       B+�M	*�V��A�*

Training_loss�?kBv$       B+�M	|k�V��A�*

Training_loss:qB���$       B+�M	��ˠV��A�*

Training_loss@�hB!��$       B+�M	�3I�V��A�*

Training_loss6�/B4d��$       B+�M	[$��V��A�*

Training_loss�B`��d$       B+�M	���V��A�*

Training_lossڤkB�tS$       B+�M	pa��V��A�*

Training_lossg�lB���$       B+�M	I��V��A�*

Training_lossH/!B*op$       B+�M	�uF�V��A�*

Training_loss�r?BkI��$       B+�M	L5��V��A�*

Training_lossF�#B�n��$       B+�M	6��V��A�*

Training_loss��hB���L$       B+�M	w0��V��A�*

Training_loss�v6B]��1$       B+�M	��V��A�*

Training_loss�A^BB���$       B+�M	㩰�V��A�*

Training_loss�a�B����$       B+�M	F&@�V��A�*

Training_lossW'B��$       B+�M	g��V��A�*

Training_loss�,B`��$       B+�M	�B�V��A�*

Training_loss��QB^ I�$       B+�M	$�v�V��A�*

Training_loss��dBJL�E$       B+�M	H��V��A�*

Training_loss�oBe��$       B+�M	?�M�V��A�*

Training_loss؅�B.��&$       B+�M	sڭ�V��A�*

Training_loss��A)�׃$       B+�M	=��V��A�*

Training_loss{, B�&�$       B+�M	�lj�V��A�*

Training_loss��LB���^$       B+�M	�˩V��A�*

Training_loss��TB�Wc8$       B+�M	BA*�V��A�*

Training_loss��0B���$       B+�M	W���V��A�*

Training_loss��oBkQuC$       B+�M	��V��A�*

Training_loss�E_BIXU�$       B+�M	p|F�V��A�*

Training_loss��?B�rz$       B+�M	@���V��A�*

Training_loss��2B.��8$       B+�M	�B�V��A�*

Training_loss$[�A��6�$       B+�M	��a�V��A�*

Training_loss�{pB�Z
$       B+�M	����V��A�*

Training_loss�OB[�]$       B+�M	��V��A�*

Training_lossz�)B��q�$       B+�M	��y�V��A�*

Training_lossvc>B��y"$       B+�M	h�֭V��A�*

Training_lossHIrBf�&i$       B+�M	�\4�V��A�*

Training_loss�sB,�$�$       B+�M	�;��V��A�*

Training_loss��eB7�?*       ����	�_d�V��A�*

Validation_accuracy$$N?W/&       sO� 	|bd�V��A�*

Validation_loss�LB��:�$       B+�M	���V��A�*

Training_loss�+B�$��$       B+�M	1���V��A�*

Training_loss-��BR�s $       B+�M	�jW�V��A�*

Training_loss�<<B���$       B+�M	4��V��A�*

Training_loss��NB�pi4$       B+�M	��V��A�*

Training_losszSB͢'$       B+�M	7�{�V��A�*

Training_lossv�NB���Q$       B+�M	��ܳV��A�*

Training_loss�B�V�f$       B+�M	�~Q�V��A�*

Training_loss3wXBK�L$       B+�M	����V��A�*

Training_lossb�NB�QR�$       B+�M	���V��A�*

Training_loss�?B���$       B+�M	9�v�V��A�*

Training_lossz)BꇒZ$       B+�M	=ֵV��A�*

Training_loss�p7BT�S$       B+�M	��5�V��A�*

Training_lossH�&B`���$       B+�M	�2��V��A�*

Training_loss��TB�9d$       B+�M	��V��A�*

Training_lossY~RB�ح�$       B+�M	|�O�V��A�*

Training_loss>�B9�$       B+�M	YĿ�V��A�*

Training_loss�"ZBg{�!$       B+�M	�v8�V��A�*

Training_lossC#BB�澵$       B+�M	\��V��A�*

Training_loss�kTB}�$       B+�M	�_��V��A�*

Training_loss\�B�T$       B+�M	nh[�V��A�*

Training_loss�)BD�l�$       B+�M	�ʻ�V��A�*

Training_lossg]�A;up$       B+�M	�V��A�*

Training_lossjDB �>$       B+�M	��y�V��A�*

Training_loss�v_B�s�s$       B+�M	�H׺V��A�*

Training_loss�|OB�WW$       B+�M	�4�V��A�*

Training_lossjBYN�$       B+�M	� ��V��A�*

Training_loss`h4B��f�$       B+�M	l���V��A�*

Training_loss[&B��$       B+�M	�zZ�V��A�*

Training_lossp�WB�5�X$       B+�M	�"��V��A�*

Training_loss��JB=5٘$       B+�M	���V��A�*

Training_loss��1B�9�S$       B+�M	8�w�V��A�*

Training_loss��yB6��$       B+�M	�ܽV��A�*

Training_loss��}B�7=J$       B+�M	��:�V��A�*

Training_lossx�!B\@�;$       B+�M	,-��V��A�*

Training_loss~?Bpzt$       B+�M	�K��V��A�*

Training_lossG$B4���$       B+�M	��W�V��A�*

Training_lossp�B����$       B+�M	�u��V��A�*

Training_losss3B~j�$       B+�M	�v�V��A�*

Training_loss��NB��i�$       B+�M	J�y�V��A�*

Training_loss�BW��+$       B+�M	V���V��A�*

Training_lossMESBZ0v_$       B+�M	�z:�V��A�*

Training_loss6�QB�f��$       B+�M	����V��A�*

Training_loss0QVB���$       B+�M	=���V��A�*

Training_loss\a_B���$       B+�M	6�a�V��A�*

Training_loss��	Bϸq$       B+�M	s���V��A�*

Training_loss<N�B��s$       B+�M	�2�V��A�*

Training_loss���Bf�^$       B+�M	����V��A�*

Training_lossV�2B��$       B+�M	���V��A�*

Training_lossr�EB{���$       B+�M	io�V��A�*

Training_lossBRB���'*       ����	�`6�V��A�*

Validation_accuracy��M?���R&       sO� 	^d6�V��A�*

Validation_loss��HB�A�q$       B+�M	�
?�V��A�*

Training_lossL?B�jY$       B+�M	�,��V��A�*

Training_loss|CEB��Ϫ$       B+�M	�h�V��A�*

Training_loss�NMB<�y>$       B+�M	�Da�V��A�*

Training_loss��#B��$       B+�M	d���V��A�*

Training_lossƆ+BDa/�$       B+�M	q!�V��A�*

Training_lossBtl)~$       B+�M	��z�V��A�*

Training_loss��.B[4{�$       B+�M	
���V��A�*

Training_loss�-B�OU$       B+�M	J�2�V��A�*

Training_lossa�YB4���$       B+�M	J��V��A�*

Training_loss|�BB��w$       B+�M	����V��A�*

Training_loss$�[B9vM|$       B+�M	�sV�V��A�*

Training_loss��%B)kN�$       B+�M	<���V��A�*

Training_loss;�B>��$       B+�M	���V��A�*

Training_loss:�1Br��($       B+�M	�Gz�V��A�*

Training_loss��5BS�#�$       B+�M	̸��V��A�*

Training_loss0W�B�H7�$       B+�M	W?�V��A�*

Training_lossb�QB����$       B+�M	���V��A�*

Training_loss@�TB��֖$       B+�M	+���V��A�*

Training_loss^�$B�H��$       B+�M	�r_�V��A�*

Training_loss�wKB�pު$       B+�M	E���V��A�*

Training_loss�g<B(Y��$       B+�M	�#�V��A�*

Training_loss��-B^߬a$       B+�M	lэ�V��A�*

Training_loss��?Ba�$       B+�M	�1�V��A�*

Training_lossr7:B=��$       B+�M	�)��V��A�*

Training_loss�3B��n�$       B+�M	�,��V��A�*

Training_loss��!B�*��$       B+�M	��m�V��A�*

Training_loss�WXB|bo$       B+�M	���V��A�*

Training_loss��XB���$       B+�M	:�\�V��A�*

Training_loss�*8B���I$       B+�M	{1��V��A�*

Training_loss��2BS�y$       B+�M	]�C�V��A�*

Training_lossq�7B���$       B+�M	���V��A�*

Training_loss�!B��&�$       B+�M	z�8�V��A�*

Training_loss�$B���$       B+�M	U��V��A�*

Training_loss��TBυL$       B+�M	c�7�V��A�*

Training_loss��.B��t�$       B+�M	?��V��A�*

Training_loss�&CB��Ѓ$       B+�M	h]�V��A�*

Training_loss�rBfP��$       B+�M	:#d�V��A�*

Training_loss_wxB}�9$       B+�M	����V��A�*

Training_loss�7/B !$       B+�M	�$�V��A�*

Training_loss68B �@�$       B+�M	?��V��A�*

Training_loss+[B�?^�$       B+�M	F��V��A�*

Training_loss�VB`rC$       B+�M	��K�V��A�*

Training_lossASB���$       B+�M	O��V��A�*

Training_loss�k�Ao^�}$       B+�M	К�V��A�*

Training_loss� SB'��$       B+�M	u�o�V��A�*

Training_loss��8B핐$       B+�M	���V��A�*

Training_loss�p(BBV,�$       B+�M	��C�V��A�*

Training_loss �(BoTi�$       B+�M	Z��V��A�*

Training_loss���A7Q�$       B+�M	8
�V��A�*

Training_loss�RB2j�*       ����	C��V��A�*

Validation_accuracy��M?|�� &       sO� 	AF��V��A�*

Validation_loss��KB�?m�$       B+�M	^���V��A�*

Training_loss;B(:2�$       B+�M	��A�V��A�*

Training_loss�eYBqov$       B+�M	]���V��A�*

Training_lossz�MBCV�3$       B+�M	���V��A�*

Training_loss��TBć�$       B+�M	ϟd�V��A�*

Training_lossi�SBC)\�$       B+�M	fO��V��A�*

Training_loss|r=B��!$       B+�M	1%%�V��A�*

Training_loss�<B;��$       B+�M	9��V��A�*

Training_loss��B9�V�$       B+�M	u��V��A�*

Training_loss�s�AX}��$       B+�M	�G�V��A�*

Training_loss��B���$       B+�M	o���V��A�*

Training_loss��!B؜�4$       B+�M	n�+�V��A�*

Training_loss`OB���$       B+�M	#e��V��A�*

Training_loss<�[BE#��$       B+�M	�z��V��A�*

Training_lossa�-B�h$       B+�M	@�I�V��A�*

Training_lossn|0B�� �$       B+�M	H���V��A�*

Training_lossZ�yB͹�$       B+�M	#2�V��A�*

Training_loss�B0B3��C$       B+�M	I�j�V��A�*

Training_lossnO>B�s;�$       B+�M	����V��A�*

Training_loss��!B�K��$       B+�M	5{$�V��A�*

Training_loss��HBV>^$       B+�M	�̀�V��A�*

Training_loss��JB�(��$       B+�M	(���V��A�*

Training_loss�A'B��U$       B+�M	��:�V��A�*

Training_loss�)B���$       B+�M	!��V��A�*

Training_loss�R+B�;}$       B+�M	0��V��A�*

Training_loss�GSB�G�X$       B+�M	�(��V��A�*

Training_loss�HBj%�P$       B+�M	���V��A�*

Training_lossԝ$BK]�$       B+�M	,�u�V��A�*

Training_loss	�iBwZ�$       B+�M	�K��V��A�*

Training_loss��!Bi$       B+�M	^�I�V��A�*

Training_loss�B��.$       B+�M	�-��V��A�*

Training_loss�DBW��$       B+�M	�h#�V��A�*

Training_loss~�eB��h�$       B+�M	:;��V��A�*

Training_lossbvhB ��w$       B+�M	�U��V��A�*

Training_lossX�BM�?�$       B+�M	^.K�V��A�*

Training_lossp�XBu.��$       B+�M	AH��V��A�*

Training_loss�GB��$       B+�M	���V��A�*

Training_loss�T?B.���$       B+�M	�Dy�V��A�*

Training_loss`\gBf$$$       B+�M	�3��V��A�*

Training_lossth�B�T �$       B+�M	%�:�V��A�*

Training_loss�_3B=$       B+�M	8���V��A�*

Training_lossw�B�[>$       B+�M	�A��V��A�*

Training_loss�?B��)n$       B+�M	>�U�V��A�*

Training_loss�B���$       B+�M	�y��V��A�*

Training_loss�\B�DqL$       B+�M	�H�V��A�*

Training_loss�B�f~�$       B+�M	}Zp�V��A�*

Training_loss�)FB_*�$       B+�M	����V��A�*

Training_lossO�*B0�uZ$       B+�M	T�.�V��A�*

Training_loss�AB��6s$       B+�M	�Ҏ�V��A�*

Training_loss��oBE3�B$       B+�M	����V��A�*

Training_loss�.B����*       ����	e��V��A�*

Validation_accuracy��L?5q}&       sO� 	���V��A�*

Validation_lossk�MB^��]$       B+�M	EK��V��A�*

Training_loss�B�k�$       B+�M	�L�V��A�*

Training_loss�P;B����$       B+�M	Hi�V��A�*

Training_loss��`B�E$       B+�M	����V��A�*

Training_lossy�0B^&��$       B+�M	-[#�V��A�*

Training_lossh�IB��%_$       B+�M	/6��V��A�*

Training_losst�[B��\$       B+�M	����V��A�*

Training_loss�EvB��G�$       B+�M	iQ:�V��A�*

Training_lossT�4B)y�$       B+�M	F��V��A�*

Training_lossHH=B&7�$       B+�M	{���V��A�*

Training_lossP�CB,��$       B+�M	NP�V��A�*

Training_lossO�>B#ك$       B+�M	'P��V��A�*

Training_loss���B~(��$       B+�M	�>
�V��A�*

Training_loss&�-B�@8'$       B+�M	:?g�V��A�*

Training_loss�.B���$       B+�M	����V��A�*

Training_loss�hZB��t$       B+�M	�!�V��A�*

Training_lossU�1B���5$       B+�M	�/~�V��A�*

Training_loss�:6B�Ì�$       B+�M	�[��V��A�*

Training_loss��1B�$       B+�M	6D�V��A�*

Training_loss.�B'X��$       B+�M	�:��V��A�*

Training_lossbB�DU$       B+�M	���V��A�*

Training_loss�&B��	$       B+�M	0�_�V��A�*

Training_loss��5B��<b$       B+�M	���V��A�*

Training_loss,1JBT�($       B+�M	��V��A�*

Training_losslp)B��'�$       B+�M	��V��A�*

Training_loss�x,BT(�$       B+�M	Ѳ��V��A�*

Training_loss~�B�/�$       B+�M	��>�V��A�*

Training_loss5�;BK&��$       B+�M	����V��A�*

Training_loss�*0B��LG$       B+�M	H���V��A�*

Training_loss<�"B��,�$       B+�M	_^W�V��A�*

Training_lossd�fB��Y�$       B+�M	���V��A�*

Training_loss�
�B����$       B+�M	�N�V��A�*

Training_loss>�HBg�n�$       B+�M	~�o�V��A�*

Training_lossJe{B�Mӱ$       B+�M	�k��V��A�*

Training_loss<�`B�k��$       B+�M	��, W��A�*

Training_loss��$B3��$       B+�M	��� W��A�*

Training_loss�<@B.�־$       B+�M	��� W��A�*

Training_loss�5B��$       B+�M	�HW��A�*

Training_loss��B,.�$       B+�M	���W��A�*

Training_loss�{	B+���$       B+�M	f�W��A�*

Training_loss_(FBX���$       B+�M	��eW��A�*

Training_loss��BW��$       B+�M	�[�W��A�*

Training_loss�5�BB�p$       B+�M	`�&W��A�*

Training_lossZ�B�n�$       B+�M	���W��A�*

Training_loss`B�K��$       B+�M	_��W��A�*

Training_loss��B����$       B+�M	�5FW��A�*

Training_loss��FBf�cU$       B+�M	$�W��A�*

Training_lossw�B/Ls$       B+�M	��W��A�*

Training_loss��5B�yW~$       B+�M	i�dW��A�*

Training_loss��=B��q#$       B+�M	���W��A�*

Training_loss~��A,��7*       ����	�-�W��A�*

Validation_accuracy#"O?���&       sO� 	0�W��A�*

Validation_loss��DBU��&$       B+�M	���W��A�*

Training_loss��6BWw��$       B+�M	���W��A�*

Training_loss.�2B�/`$       B+�M	��W	W��A�*

Training_loss�"B$p�$       B+�M	�ɵ	W��A�*

Training_loss�2�B����$       B+�M	�O
W��A�*

Training_loss�2]B$x�$       B+�M	�x
W��A�*

Training_loss0NGB	 0�$       B+�M	e�
W��A�*

Training_loss�:B�p�$       B+�M	��iW��A�*

Training_loss�omBu��<$       B+�M	��W��A�*

Training_lossxBwj�$       B+�M	�T]W��A�*

Training_lossI)0B�C�$       B+�M	�w�W��A�*

Training_loss�j-B�_@L$       B+�M	��lW��A�*

Training_lossb�<B]���$       B+�M	F�W��A�*

Training_loss���A(��L$       B+�M	2�uW��A�*

Training_loss� B�K�$       B+�M	�Z�W��A�*

Training_loss�B��z�$       B+�M	YmdW��A�*

Training_loss�hB6��$       B+�M	�g�W��A�*

Training_loss�U4B�6$       B+�M	)?RW��A�*

Training_loss��OB�H'�$       B+�M	�t�W��A�*

Training_loss��:B�Ɩ�$       B+�M	�e>W��A�*

Training_loss�	BĒ	b$       B+�M	��W��A�*

Training_loss*YVB�8�$       B+�M	��;W��A�*

Training_loss=�	B��/}$       B+�M	SX�W��A�*

Training_lossU!+B)��$       B+�M	2�)W��A�*

Training_loss�A)B����$       B+�M	�[�W��A�*

Training_loss��JB�NU�$       B+�M	��W��A�*

Training_loss�~CB�Y؛$       B+�M	\��W��A�*

Training_loss�\)BZ�&R$       B+�M	���W��A�*

Training_loss9LbB���$       B+�M	��mW��A�*

Training_loss1�)B̕k�$       B+�M	g��W��A�*

Training_loss�HB�n)P$       B+�M	�M[W��A�*

Training_loss�iNBs���$       B+�M	
��W��A�*

Training_loss{�tBsQ�)$       B+�M	B�?W��A�*

Training_lossڥTB?6�$       B+�M	��W��A�*

Training_lossڽ5B7�־$       B+�M	�)W��A�*

Training_loss�=B�~��$       B+�M	�J�W��A�*

Training_loss
�^B��B$       B+�M	mW��A�*

Training_loss,�Bk��a$       B+�M	���W��A�*

Training_loss�3BA��1$       B+�M	�A�W��A�*

Training_loss'�0B��G$       B+�M	ΦlW��A�*

Training_loss�k9B�L��$       B+�M	q �W��A�*

Training_loss�YQB��$       B+�M	�BQW��A�*

Training_loss{PBzU�$       B+�M	�0�W��A�*

Training_loss6?>B'1é$       B+�M	�8W��A�*

Training_loss�jGB�NZ$       B+�M	��W��A�*

Training_loss7+Bz�u$       B+�M	W%"W��A�*

Training_loss�ZB���>$       B+�M	E�W��A�*

Training_loss@�vB#��k$       B+�M	z�W��A�*

Training_loss)IB����$       B+�M	;�{W��A�*

Training_loss�k/Br�=$       B+�M	ӿ�W��A�*

Training_loss�>SB�4'*       ����	|,�W��A�*

Validation_accuracy��N?��y|&       sO� 	Q/�W��A�*

Validation_loss�;IBb�$       B+�M	�0E"W��A�*

Training_loss���A�l4$       B+�M	@߸"W��A�*

Training_loss�.�B
�M�$       B+�M	G+#W��A�*

Training_lossCHhB��au$       B+�M	IH�#W��A�*

Training_loss�>B��/$       B+�M	_)$W��A�*

Training_loss�@5B�$       B+�M	�փ$W��A�*

Training_loss��[B�W�$       B+�M	��$W��A�*

Training_loss��B�n>�$       B+�M	5j%W��A�*

Training_loss]]=B-T�$       B+�M	���%W��A�*

Training_loss�lB]��u$       B+�M	vQ&W��A�*

Training_loss�	B%��$       B+�M	���&W��A�*

Training_loss��B�U&^$       B+�M	��:'W��A�*

Training_loss
��AT@�`$       B+�M	��'W��A�*

Training_lossR/B9���$       B+�M	�6#(W��A�*

Training_loss�KfB}*/ $       B+�M	7��(W��A�*

Training_lossT�(BXIq�$       B+�M	�{
)W��A�*

Training_loss��B���$       B+�M	�~)W��A�*

Training_lossƥ$B����$       B+�M	Kv�)W��A�*

Training_loss��6B0�n�$       B+�M	�!g*W��A�*

Training_loss�-B닜$       B+�M	{��*W��A�*

Training_lossȳKB�;7�$       B+�M	WO+W��A�*

Training_lossf�BU�rB$       B+�M	�*�+W��A�*

Training_loss���A��>6$       B+�M	�R7,W��A�*

Training_loss��A�.$       B+�M	��,W��A�*

Training_loss4�)B:=�D$       B+�M	N�-W��A�*

Training_lossLLB�㽝$       B+�M	PǑ-W��A�*

Training_loss�B�5$       B+�M	Wz.W��A�*

Training_loss�ZB={�u$       B+�M	ڐy.W��A�*

Training_loss��dBC�׬$       B+�M	�o�.W��A�*

Training_loss]�OB�|n�$       B+�M	��_/W��A�*

Training_lossmB|,g$       B+�M	���/W��A�*

Training_loss��pB�N�$       B+�M	�SI0W��A�*

Training_loss���A�,ً$       B+�M	iż0W��A�*

Training_lossf�,B�rܧ$       B+�M	�/1W��A�*

Training_loss�oB�i�$       B+�M	eU�1W��A�*

Training_lossD_Bc
�$       B+�M	m�2W��A�*

Training_loss��2B��}%$       B+�M	�.�2W��A�*

Training_loss�]Bt� �$       B+�M	�� 3W��A�*

Training_lossK&QB;�$       B+�M	/s3W��A�*

Training_lossZ>OBO6�$       B+�M	���3W��A�*

Training_loss���A�j��$       B+�M	.m4W��A�*

Training_loss��FB�>�$       B+�M	���4W��A�*

Training_loss:<iBM���$       B+�M	�sR5W��A�*

Training_loss��BK�RP$       B+�M	:�5W��A�*

Training_loss<�DB�]M�$       B+�M	�]M6W��A�*

Training_lossP2TB�rX�$       B+�M	j2�6W��A�*

Training_lossRW2B���$       B+�M	��<7W��A�*

Training_loss|B����$       B+�M	ݻ7W��A�*

Training_lossn'yB���$       B+�M	��28W��A�*

Training_loss�&B-:��$       B+�M	��8W��A�*

Training_loss��B*��?*       ����	��9W��A�*

Validation_accuracy��N? &       sO� 	��9W��A�*

Validation_loss=HB��#4$       B+�M	�)<W��A�*

Training_loss�*B���$       B+�M	'3�<W��A�*

Training_loss�HBXZŬ$       B+�M	� =W��A�*

Training_lossPD�Ac��y$       B+�M	z�=W��A�*

Training_loss�U�Ag�$       B+�M	���=W��A�*

Training_lossz��A��Y$       B+�M	t>W��A�*

Training_loss�>#BÃJ�$       B+�M	�&�>W��A�*

Training_loss�t:B�'O�$       B+�M	u^?W��A�*

Training_loss��?B��u�$       B+�M	'��?W��A�*

Training_loss4:3B�Oj$       B+�M		�I@W��A�*

Training_lossW�\B��z$       B+�M	��@W��A�*

Training_loss��:B��}�$       B+�M	��?AW��A�*

Training_loss�;pB��"$       B+�M	kD�AW��A�*

Training_lossx�QBK	�$       B+�M	�R0BW��A�*

Training_loss��$B�)Ln$       B+�M	b��BW��A�*

Training_loss(A-BL�C$       B+�M	]�CW��A�*

Training_loss�2B�VK+$       B+�M	�ɍCW��A�*

Training_lossn�B �	�$       B+�M	�DW��A�*

Training_loss���A�P�o$       B+�M	p�~DW��A�*

Training_loss2	&BjO)�$       B+�M	=��DW��A�*

Training_lossj/B���$       B+�M	I�gEW��A�*

Training_loss��B�%]�$       B+�M	���EW��A�*

Training_loss��TB�U5$       B+�M	�1OFW��A�*

Training_loss�B��cg$       B+�M	�P�FW��A�*

Training_loss�3B�O��$       B+�M	��RGW��A�*

Training_loss^5BI	�$       B+�M	���GW��A�*

Training_lossf�KB7���$       B+�M	i�OHW��A�*

Training_loss�>B����$       B+�M	mu�HW��A�*

Training_lossl7UB�1�~$       B+�M	�A#IW��A�*

Training_loss�/;B��U�$       B+�M	��IW��A�*

Training_loss��B��?$       B+�M	\Z�IW��A�*

Training_lossb83Bd��$       B+�M	 �QJW��A�*

Training_loss}�B���$       B+�M	���JW��A�*

Training_loss�;B���$       B+�M	*qKW��A�*

Training_loss��B Mc^$       B+�M	ɭ�KW��A�*

Training_loss�g3B�Y�Q$       B+�M	�2�KW��A�*

Training_lossڞB��'G$       B+�M	�FFLW��A�*

Training_loss
9B�/U$       B+�M	V}�LW��A�*

Training_loss�d1B�y@n$       B+�M	6�	MW��A�*

Training_loss��NB���$       B+�M	q!kMW��A�*

Training_loss9�B{�j$       B+�M	{��MW��A�*

Training_lossʲB�?�m$       B+�M	O[1NW��A�*

Training_loss0B�at$       B+�M	�V�NW��A�*

Training_lossi�#B��$       B+�M	���NW��A�*

Training_lossCxB�)M$       B+�M	oeWOW��A�*

Training_loss{
Bp���$       B+�M	ǝ�OW��A�*

Training_loss�b�A�D�$       B+�M	�kPW��A�*

Training_loss�MBo�;�$       B+�M	v�PW��A�*

Training_loss,�NB
��$       B+�M	��PW��A�*

Training_loss�!�A�c0�$       B+�M	B]CQW��A�*

Training_loss�b/B5lټ*       ����		OGRW��A�*

Validation_accuracy��N?���&       sO� 	DQGRW��A�*

Validation_loss�vCB���e$       B+�M	���TW��A�*

Training_loss�\:B���)$       B+�M	B\�TW��A�*

Training_loss�DB��H�$       B+�M	kEUUW��A�*

Training_lossh{B���K$       B+�M	w�UW��A�*

Training_lossG�/B7hz�$       B+�M	y+VW��A�*

Training_lossQB����$       B+�M	F��VW��A�*

Training_loss�B��x$       B+�M	=D,WW��A�*

Training_loss��(B�f�$       B+�M	Ț�WW��A�*

Training_lossr=B���$       B+�M	�TXW��A�*

Training_loss� wBlI��$       B+�M	 kXW��A�*

Training_loss�:B�~�q$       B+�M	Dn�XW��A�*

Training_lossFxB��w^$       B+�M	S�+YW��A�*

Training_loss�_2B$rd�$       B+�M	���YW��A�*

Training_loss�8B��l$       B+�M	�ZW��A�*

Training_loss��BO�� $       B+�M	�zoZW��A�*

Training_loss�B�E`I$       B+�M	�~�ZW��A�*

Training_loss��B=$       B+�M	�F1[W��A�*

Training_lossr��B���$       B+�M	��[W��A�*

Training_lossj'<B�p��$       B+�M	�<�[W��A�*

Training_loss�cB�$       B+�M	��Y\W��A�*

Training_loss�($B�b*�$       B+�M	K�\W��A�*

Training_lossrB��x�$       B+�M	y#]W��A�*

Training_lossd�?Bb:�$       B+�M	�y]W��A�*

Training_lossa��AC�B�$       B+�M	���]W��A�*

Training_loss���AJ���$       B+�M	�39^W��A�*

Training_lossOdB���$       B+�M	\ȗ^W��A�*

Training_loss�#B�蝊$       B+�M	P��^W��A�*

Training_lossbt�A�4Z$       B+�M	�W_W��A�*

Training_loss�&B"XZ�$       B+�M	I��_W��A�*

Training_lossҐ+B�0,�$       B+�M	 �`W��A�*

Training_loss2��Ad$       B+�M	�Pz`W��A�*

Training_loss֘7BT�_�$       B+�M	c~�`W��A�*

Training_loss|JBҶ�$       B+�M	�J6aW��A�*

Training_loss5Z(B��&$       B+�M	��aW��A�*

Training_loss��3B|���$       B+�M	%�aW��A�*

Training_loss�GB��z�$       B+�M	;�YbW��A�*

Training_loss� �A��kK$       B+�M	F��bW��A�*

Training_lossU�
Bzw;$       B+�M	χcW��A�*

Training_lossШ<B[WDz$       B+�M	�}scW��A�*

Training_loss��Be�$       B+�M	�C�cW��A�*

Training_loss�A�S��$       B+�M	�1dW��A�*

Training_loss��;B�z�8$       B+�M	�dW��A�*

Training_lossVMB�a��$       B+�M	7��dW��A�*

Training_lossf�ZBھw_$       B+�M	v�OeW��A�*

Training_loss�.B��'�$       B+�M	���eW��A�*

Training_loss��;B�jo�$       B+�M	�ufW��A�*

Training_lossN�,B���k$       B+�M	�pfW��A�*

Training_lossXKB��Z$       B+�M	��fW��A�*

Training_loss@�/B�8_�$       B+�M	6�LgW��A�*

Training_lossT0PB؉�q$       B+�M	O�gW��A�*

Training_lossJ"9B��3�*       ����	/3vhW��A�*

Validation_accuracyMMN?��&       sO� 	?5vhW��A�*

Validation_loss��CBg��G$       B+�M	��jW��A�*

Training_loss�-B�ec�$       B+�M	�e^kW��A�*

Training_loss:�"B�ZQw$       B+�M	���kW��A�*

Training_loss��-B��4$       B+�M	�XlW��A�*

Training_lossCldB*��$       B+�M	��lW��A�*

Training_loss�B�2`�$       B+�M	g
LmW��A�*

Training_loss��Bϔ;$       B+�M	n��mW��A�*

Training_loss���AQen($       B+�M	�LHnW��A�*

Training_loss$�BL+k�$       B+�M	��nW��A�*

Training_loss��1Bl�b�$       B+�M	�6oW��A�*

Training_loss�X=B�6Q'$       B+�M	�M�oW��A�*

Training_lossͱBx�	F$       B+�M	s4pW��A�*

Training_loss�-0B�Mx�$       B+�M	/��pW��A�*

Training_loss�JB�_D$       B+�M	f�%qW��A�*

Training_lossR&B���$       B+�M	�@�qW��A�*

Training_losszzB����$       B+�M	"�rW��A�*

Training_loss��.BC}8^$       B+�M	���rW��A�*

Training_lossrU6Bt��$       B+�M	=��rW��A�*

Training_lossj�>B�g�$       B+�M	�FtsW��A�*

Training_loss�nB#2�$       B+�M	�N�sW��A�*

Training_lossZ�B�\X$       B+�M	�J]tW��A�*

Training_lossLB}�z$       B+�M	�%�tW��A�*

Training_loss482B�9�<$       B+�M	Q�EuW��A�*

Training_loss�Q/B��Y$       B+�M	�l�uW��A�*

Training_loss<�CB�O9i$       B+�M	G5vW��A�*

Training_lossr��Aߔ�a$       B+�M	��vW��A�*

Training_loss��B3$       B+�M	��wW��A�*

Training_loss(�,BGS��$       B+�M	V�wW��A�*

Training_lossU�=B�4.�$       B+�M	z�xW��A�*

Training_loss�LB\n-$       B+�M	�4wxW��A�*

Training_loss-��A��Ҡ$       B+�M	�4�xW��A�*

Training_loss�^(B��	$       B+�M	��^yW��A�*

Training_loss�xB��6$$       B+�M	���yW��A�*

Training_lossJB7B��I$       B+�M	�^zW��A�*

Training_loss�)B��ք$       B+�M	�8�zW��A�*

Training_loss�"B�ܨ�$       B+�M	e�D{W��A�*

Training_loss��`Bg�ô$       B+�M	��{W��A�*

Training_loss�;B��Ia$       B+�M	nC|W��A�*

Training_loss&�BL|�$       B+�M	J��|W��A�*

Training_loss#�%BBU<�$       B+�M	��}W��A�*

Training_lossZ]DBe $       B+�M	��s}W��A�*

Training_loss�+�A�D�^$       B+�M	�Q�}W��A�*

Training_lossܢ4Bi��M$       B+�M	��2~W��A�*

Training_lossF�A���$       B+�M	��~W��A�*

Training_lossV�qB�$|$       B+�M	�*�~W��A�*

Training_loss�,�A�!�$       B+�M	��ZW��A�*

Training_loss�B���	$       B+�M	P��W��A�*

Training_losspV!B0)$       B+�M	�J"�W��A�*

Training_loss�P;Bi\�:$       B+�M	_~�W��A�*

Training_loss��.B˄r�$       B+�M	KwڀW��A�*

Training_lossWJBHo[*       ����	��ځW��A�*

Validation_accuracyMMO?^��&       sO� 	��ځW��A�*

Validation_loss��CB[�$       B+�M	�tk�W��A�*

Training_loss0lAB{�w$       B+�M	R�̈́W��A�*

Training_loss��4B���*$       B+�M	L/�W��A�*

Training_loss�m?B��$       B+�M	p썅W��A�*

Training_lossR>Bnn�T$       B+�M	t��W��A�*

Training_loss�W&BX{��$       B+�M	�I�W��A�*

Training_loss\G_BZ8 $       B+�M	}���W��A�*

Training_loss%�)B{�6$       B+�M	��W��A�*

Training_loss,(B��̏$       B+�M	�k�W��A�*

Training_loss�M;B%��$       B+�M	��ˇW��A�*

Training_lossd+(BJ�K�$       B+�M	XW+�W��A�*

Training_loss88B��$       B+�M	�䈈W��A�*

Training_lossaAB��$       B+�M	,��W��A�*

Training_loss�BH胶$       B+�M	h=C�W��A�*

Training_lossd*B���$       B+�M	>z��W��A�*

Training_lossm�7BWj�$       B+�M	�a��W��A�*

Training_loss<�aB@y�g$       B+�M	�Z�W��A�*

Training_loss$cB�`o$       B+�M	����W��A�*

Training_loss�1<B3y��$       B+�M	��W��A�*

Training_loss�B��Ck$       B+�M	�<q�W��A�*

Training_lossF�>B��X$       B+�M	�@΋W��A�*

Training_loss>!+B5`H$       B+�M	 �-�W��A�*

Training_loss�v%B�MZg$       B+�M	. ��W��A�*

Training_loss�6B���$       B+�M	���W��A�*

Training_loss5$B���$       B+�M	�F�W��A�*

Training_lossdeuBsL: $       B+�M	�j��W��A�*

Training_loss��B�C/�$       B+�M	�j�W��A�*

Training_loss��B-ui�$       B+�M	2a�W��A�*

Training_loss�LBL��t$       B+�M	�(��W��A�*

Training_loss��Bq��c$       B+�M	�&!�W��A�*

Training_loss�I B~��$       B+�M	gc��W��A�*

Training_loss��DB�e�$       B+�M	*��W��A�*

Training_loss�()BO�$       B+�M	�$D�W��A�*

Training_losse�BN�#�$       B+�M	�
��W��A�*

Training_loss�Bw��6$       B+�M	W� �W��A�*

Training_loss��BHG*$       B+�M	��a�W��A�*

Training_loss��8BI�r$       B+�M	I��W��A�*

Training_loss@PQBEc��$       B+�M	�!�W��A�*

Training_loss��-B�(�($       B+�M	���W��A�*

Training_loss� BnbG$       B+�M	Nb��W��A�*

Training_loss>�*B�<�$       B+�M	Q�=�W��A�*

Training_loss�uSB��$       B+�M	N��W��A�*

Training_lossN�JB�A��$       B+�M	D��W��A�*

Training_losss�;Bۻ�:$       B+�M	ꁔW��A�*

Training_loss2�B��i�$       B+�M	�?��W��A�*

Training_loss�+9B�<+$       B+�M	�`j�W��A�*

Training_lossV lB�.�D$       B+�M	�z��W��A�*

Training_loss��BCk�$       B+�M	QU�W��A�*

Training_lossx�Bʽ�`$       B+�M	�ŖW��A�*

Training_lossxzhBcX��$       B+�M	��9�W��A�*

Training_lossO�-B_�x^*       ����	�R3�W��A�*

Validation_accuracy��N?�RcV&       sO� 	�U3�W��A�*

Validation_loss�YGB]�{�$       B+�M	�n�W��A�*

Training_loss�d[B%A�a$       B+�M	��ԛW��A�*

Training_lossaBBO�K�$       B+�M	�6�W��A�*

Training_lossh�BO��j$       B+�M	`x��W��A�*

Training_loss��!BQ�p�$       B+�M	j���W��A�*

Training_loss�YB���$       B+�M	�NR�W��A�*

Training_loss�a4B�n�$       B+�M	K��W��A�*

Training_loss�B+��$       B+�M	���W��A�*

Training_lossw!/B=m��$       B+�M	Vr�W��A�*

Training_loss��8Bǃ$       B+�M	SBўW��A�*

Training_loss�lB���T$       B+�M	\�4�W��A�*

Training_lossd#FB��6�$       B+�M	�ԗ�W��A�*

Training_loss�Y/B2�B$       B+�M	����W��A�*

Training_lossx&BG�ϰ$       B+�M	�dW�W��A�*

Training_loss�fIB X")$       B+�M	9���W��A�*

Training_lossDB�i��$       B+�M	���W��A�*

Training_lossSG#B�4�$       B+�M	�Uz�W��A�*

Training_loss�`�Aհ�$       B+�M	�ߡW��A�*

Training_loss��/B�u�Z$       B+�M	�3<�W��A�*

Training_loss,�?B` X�$       B+�M	`��W��A�*

Training_loss�(/B��(�$       B+�M	q��W��A�*

Training_loss UGB�J�$       B+�M	�@Y�W��A�*

Training_lossc}�AVH7$       B+�M	[Ӷ�W��A�*

Training_loss��0B��DP$       B+�M	��W��A�*

Training_loss�(�AM�$       B+�M	ȷp�W��A�*

Training_loss�[EB�m+�$       B+�M	s�ͤW��A�*

Training_loss��B��z$       B+�M	�*�W��A�*

Training_loss]{6B�׾f$       B+�M	�f��W��A�*

Training_loss۷Bt�f�$       B+�M	�� �W��A�*

Training_lossr53B��\$       B+�M	J{�W��A�*

Training_lossfQ�A@6�$       B+�M	�u�W��A�*

Training_loss�� B���$       B+�M	�yd�W��A�*

Training_loss�'B���n$       B+�M	�D֧W��A�*

Training_loss� B��$       B+�M	qXK�W��A�*

Training_loss�BߣF�$       B+�M	�j��W��A�*

Training_loss��
B˕�[$       B+�M	��9�W��A�*

Training_loss�1$B��n$       B+�M	����W��A�*

Training_loss,NB�v�{$       B+�M	���W��A�*

Training_lossފB��$       B+�M	��o�W��A�*

Training_lossB�\$       B+�M	J�ЪW��A�*

Training_loss� B�r6$       B+�M	�86�W��A�*

Training_loss�fBf�Og$       B+�M	�=��W��A�*

Training_loss��ABꋓ_$       B+�M	Q��W��A�*

Training_lossdGB:J?�$       B+�M	�i�W��A�*

Training_loss^ �Aצ�$       B+�M	�ͬW��A�*

Training_lossuAB�;�g$       B+�M	\ 0�W��A�*

Training_lossn�.B��-.$       B+�M	�#��W��A�*

Training_lossTK%B [	S$       B+�M	���W��A�*

Training_loss�IB�4�$       B+�M	�lH�W��A�*

Training_loss�BB���$       B+�M	!襮W��A�*

Training_loss��QB�.�*       ����	�l�W��A�*

Validation_accuracy��O?�IY&       sO� 	M�l�W��A�*

Validation_lossS�BB(#i�$       B+�M	��W��A�*

Training_loss�B�<�$$       B+�M	Ȕ�W��A�*

Training_lossh.B�c�$       B+�M	A�_�W��A�*

Training_loss,oRB&�\k$       B+�M	�GȲW��A�*

Training_lossN )B,�$       B+�M	d�*�W��A�*

Training_loss"�mB�0#�$       B+�M	y���W��A�*

Training_loss�B�	��$       B+�M	v��W��A�*

Training_loss.�	B�I($       B+�M	_zY�W��A�*

Training_lossf�B�8�r$       B+�M	�.��W��A�*

Training_loss��B�c�-$       B+�M	��W��A�*

Training_lossB�12�$       B+�M	�}u�W��A�*

Training_loss�0+BO(�Q$       B+�M	*�ܵW��A�*

Training_loss���A��d�$       B+�M	sD�W��A�*

Training_loss�LB����$       B+�M	���W��A�*

Training_loss�'RBO�7�$       B+�M	$(�W��A�*

Training_loss�1Bwԙ$       B+�M	{�h�W��A�*

Training_lossVB�$       B+�M	�;ŷW��A�*

Training_loss2�NB	���$       B+�M	�"�W��A�*

Training_loss؄�AKU�$       B+�M	�I�W��A�*

Training_lossD�B�qug$       B+�M	��W��A�*

Training_loss��B"-�r$       B+�M	��m�W��A�*

Training_loss,w;B�*��$       B+�M	���W��A�*

Training_loss=1!Ba��$       B+�M	�<[�W��A�*

Training_lossGgPB&���$       B+�M	�%ӺW��A�*

Training_loss�i@B�w�$       B+�M		�M�W��A�*

Training_loss^'B1h$       B+�M	�ĻW��A�*

Training_loss B9y$       B+�M	lA=�W��A�*

Training_loss'�<Byi�K$       B+�M	���W��A�*

Training_loss�B ͉�$       B+�M	�@0�W��A�*

Training_loss �B�3�$       B+�M	h̪�W��A�*

Training_loss��=BB3�$       B+�M	B �W��A�*

Training_lossWIBV� �$       B+�M	T���W��A�*

Training_loss��A��{�$       B+�M	f��W��A�*

Training_loss���A��T$       B+�M	�x�W��A�*

Training_loss(.B�~�$       B+�M	5|ֿW��A�*

Training_loss�_B�.��$       B+�M	�^6�W��A�*

Training_loss�%B��r$       B+�M	����W��A�*

Training_loss�;"B�H�$       B+�M	%���W��A�*

Training_loss��B�l R$       B+�M	Y�P�W��A�*

Training_lossaB�e.�$       B+�M	g���W��A�*

Training_loss*�#B�'$       B+�M	y��W��A�*

Training_loss���A��$       B+�M	UPi�W��A�*

Training_loss�uB'���$       B+�M	���W��A�*

Training_loss��FB�!$       B+�M	w-$�W��A�*

Training_loss�6@B�'�U$       B+�M	���W��A�*

Training_loss�w%Bt�7Z$       B+�M	fj��W��A�*

Training_loss��CB!�9�$       B+�M	eUD�W��A�*

Training_loss\�	B�:Y/$       B+�M	^���W��A�*

Training_loss��.B�&�$       B+�M	�]�W��A�*

Training_loss��BS׉$       B+�M	Z�b�W��A�*

Training_loss�>B�ΗX*       ����	�*�W��A�*

Validation_accuracy��O?�J�&       sO� 	*�W��A�*

Validation_loss�CB��ze$       B+�M	��d�W��A�*

Training_loss��B�Ö$       B+�M	i7��W��A�*

Training_loss�HB��m$       B+�M	�%$�W��A�*

Training_loss"�%B!�O�$       B+�M	2"��W��A�*

Training_loss��B>��$       B+�M	����W��A�*

Training_loss=�.B���$       B+�M	�~�W��A�*

Training_loss�:Bd�]D$       B+�M	�"��W��A�*

Training_loss-[B�$       B+�M	P�\�W��A�*

Training_loss�G
B�aa�$       B+�M	����W��A�*

Training_lossbhB��L$       B+�M	�t�W��A�*

Training_lossU~B�x�$       B+�M	�}�W��A�*

Training_loss�� BX�`$       B+�M	����W��A�*

Training_loss�KBj��u$       B+�M	c^8�W��A�*

Training_loss�w�A:�,�$       B+�M	{���W��A�*

Training_lossI� B��;�$       B+�M	��W��A�*

Training_loss&zB�@x�$       B+�M	)v��W��A�*

Training_loss�*B���*$       B+�M	�)��W��A�*

Training_loss߱B�)y$       B+�M	i�^�W��A�*

Training_loss�^1B�g��$       B+�M	���W��A�*

Training_loss�BŖU$       B+�M	A+0�W��A�*

Training_loss�A�9$       B+�M	�5��W��A�*

Training_lossƔ1BG�4�$       B+�M		7�W��A�*

Training_loss�� B�a�"$       B+�M	�n�W��A�*

Training_lossp!BAL��$       B+�M	q��W��A�*

Training_loss̡�APٷ�$       B+�M	}Q�W��A�*

Training_loss��#B��"$       B+�M	�!��W��A�*

Training_loss/�Byg�$       B+�M	40�W��A�*

Training_lossHB3G&$       B+�M	0s�W��A�*

Training_lossNK3BY��g$       B+�M	����W��A�*

Training_loss�+HBt��C$       B+�M	&;�W��A�*

Training_loss4�
B��$       B+�M	I���W��A�*

Training_loss�SB�-s�$       B+�M	,���W��A�*

Training_loss"�eBQ�Q�$       B+�M	S!Z�W��A�*

Training_lossĹ3B`#�$       B+�M	Ǹ�W��A�*

Training_loss^T�A>�&$       B+�M	NA�W��A�*

Training_lossڹAE*V$       B+�M	qtx�W��A�*

Training_lossQJB�_`9$       B+�M	0L��W��A�*

Training_loss3VAB3�F9$       B+�M	ʨ9�W��A�*

Training_loss�B���$       B+�M	py��W��A�*

Training_loss���A��u�$       B+�M	\9��W��A�*

Training_loss��-B���$       B+�M	��^�W��A�*

Training_loss^�B����$       B+�M	���W��A�*

Training_lossf�,Bg��$       B+�M	�&�W��A�*

Training_loss�"B7���$       B+�M	g��W��A�*

Training_loss�(dB��{�$       B+�M	 q��W��A�*

Training_loss4�(B�7�-$       B+�M	C�W��A�*

Training_lossdҷA	 ��$       B+�M	���W��A�*

Training_loss�`�A�8ܰ$       B+�M	7� �W��A�*

Training_lossٜB��8�$       B+�M	��`�W��A�*

Training_lossz�0B*i�F$       B+�M	(c��W��A�*

Training_lossP�B	8�*       ����	�P��W��A�*

Validation_accuracy��O?�[�&       sO� 	�S��W��A�*

Validation_loss�|BB�Y�$       B+�M	����W��A�*

Training_lossڿB�a�$       B+�M	�%C�W��A�*

Training_loss�1B��$       B+�M	����W��A�*

Training_lossaB����$       B+�M	���W��A�*

Training_loss�p<B����$       B+�M	?�Y�W��A�*

Training_loss\��A4Ƣ�$       B+�M	!���W��A�*

Training_lossH.iB��$       B+�M	l��W��A�*

Training_loss\/B�pf$       B+�M	�lq�W��A�*

Training_loss���AcS� $       B+�M	$���W��A�*

Training_loss\kBBx�$       B+�M	S?.�W��A�*

Training_loss��7Bz�P$       B+�M	����W��A�*

Training_loss��>B�B�}$       B+�M	����W��A�*

Training_loss���A�cX$       B+�M	��E�W��A�*

Training_loss�Bt�$       B+�M	�i��W��A�*

Training_loss��Ap!z,$       B+�M	�i �W��A�*

Training_loss5BB22�$       B+�M	M�\�W��A�*

Training_loss.�(B�XN$       B+�M	�V��W��A�*

Training_loss�Y�A���A$       B+�M	#0�W��A�*

Training_lossJ��A��gc$       B+�M	����W��A�*

Training_loss�~0B�(?$       B+�M	�x��W��A�*

Training_loss1+B����$       B+�M	lr�W��A�*

Training_lossf<�A�\�4$       B+�M	���W��A�*

Training_loss��	BNL�$       B+�M	n�G�W��A�*

Training_lossM0B61{$       B+�M	3���W��A�*

Training_loss���A��*�$       B+�M	��W��A�*

Training_loss��B��$       B+�M	IGe�W��A�*

Training_lossSXB����$       B+�M	G��W��A�*

Training_loss�]�A��{$       B+�M	&�W��A�*

Training_losst�,B��p�$       B+�M	�:��W��A�*

Training_loss�5B�ss\$       B+�M	����W��A�*

Training_loss��;B����$       B+�M	�B�W��A�*

Training_loss��B�L}%$       B+�M	"ޡ�W��A�*

Training_loss+BXDO'$       B+�M	)��W��A�*

Training_loss�8�A�|C�$       B+�M	��`�W��A�*

Training_lossY��Acy�a$       B+�M	����W��A�*

Training_lossx�B��m�$       B+�M	�%�W��A�*

Training_lossb�Bcy��$       B+�M	wڈ�W��A�*

Training_loss�o8B��S+$       B+�M	U���W��A�*

Training_lossz�Bch��$       B+�M	b�H�W��A�*

Training_loss4dBU��e$       B+�M	F���W��A�*

Training_lossf�]Bp@�h$       B+�M	�4�W��A�*

Training_loss�B��$       B+�M	K�l�W��A�*

Training_lossO�B�y&�$       B+�M	����W��A�*

Training_loss � B�4$       B+�M	9_(�W��A�*

Training_loss�{ B��S$       B+�M	����W��A�*

Training_loss�B'�$       B+�M	�:��W��A�*

Training_lossNu(B"�$       B+�M	��G�W��A�*

Training_lossC|Bg+�3$       B+�M	rk��W��A�*

Training_lossL�IBt��$       B+�M	b�W��A�*

Training_lossFB7Ø�$       B+�M	bje�W��A�*

Training_loss�2B�Y�*       ����	r�9�W��A�*

Validation_accuracy##Q?���&       sO� 	D�9�W��A�*

Validation_lossK�BB9^�$       B+�M	H���W��A�*

Training_loss˙0B�9J@$       B+�M	�{��W��A�*

Training_loss$
B�>��$       B+�M	eoJ�W��A�*

Training_loss�* B���$       B+�M	Ʀ��W��A�*

Training_loss�CBg�$       B+�M	%z�W��A�*

Training_loss�\BbY��$       B+�M	��a�W��A�*

Training_loss�,BH�c<$       B+�M	;7��W��A�*

Training_loss*G�A:�$       B+�M	�9�W��A�*

Training_lossE� B�p�2$       B+�M	S{{�W��A�*

Training_lossS�1BC�!$       B+�M	����W��A�*

Training_loss�B�~�$       B+�M	�85�W��A�*

Training_loss�߾A-Z�k$       B+�M	���W��A�*

Training_lossM6B��ځ$       B+�M	J(��W��A�*

Training_loss0B����$       B+�M	T;L�W��A�*

Training_lossax B>j��$       B+�M	�m��W��A�*

Training_loss��(B�B�B$       B+�M	IG�W��A�*

Training_loss�|"B��'4$       B+�M	�e�W��A�*

Training_loss\p[B~K�$       B+�M	;���W��A�*

Training_loss��QBS�$       B+�M	y!�W��A�*

Training_loss0><B$G��$       B+�M	@�}�W��A�*

Training_lossT�!B/�Ĩ$       B+�M	����W��A�*

Training_loss�� BH���$       B+�M	�u;�W��A�*

Training_lossGB�\;�$       B+�M	_���W��A�*

Training_lossp�B�b$       B+�M	�v��W��A�*

Training_loss�B��_�$       B+�M	�Z�W��A�*

Training_loss�Z�A�ܺE$       B+�M	r���W��A�*

Training_lossX BjN`$       B+�M	��W��A�*

Training_loss��B;�Z}$       B+�M	�:x�W��A�*

Training_lossvr
BH�/�$       B+�M	���W��A�*

Training_loss�B�j��$       B+�M	��4�W��A�*

Training_loss��B�eը$       B+�M	�Ԓ�W��A�*

Training_loss�;B<��[$       B+�M	����W��A�*

Training_loss��Bm��E$       B+�M	��[ X��A�*

Training_loss�NB��ֲ$       B+�M	��� X��A�*

Training_loss!�5Bk��E$       B+�M	�X��A�*

Training_lossB�1�w$       B+�M	؜vX��A�*

Training_lossЌ BFh�g$       B+�M	�.�X��A�*

Training_loss>�@B����$       B+�M	w�EX��A�*

Training_loss�'Bn��$       B+�M	\�X��A�*

Training_loss/$B�c��$       B+�M	m�X��A�*

Training_loss���AT��,$       B+�M	��_X��A�*

Training_loss0i�AB&Hp$       B+�M	��X��A�*

Training_loss�$B�;�$       B+�M	;�X��A�*

Training_loss=?B�;g8$       B+�M	aRyX��A�*

Training_loss�oB�dnF$       B+�M	���X��A�*

Training_loss���A		��$       B+�M	>>7X��A�*

Training_loss9IBߡ��$       B+�M	�X��A�*

Training_loss`B��$       B+�M	��X��A�*

Training_loss�B�У.$       B+�M	�iOX��A�*

Training_loss��'B��$       B+�M	܀�X��A�*

Training_loss9B�	�*       ����	��sX��A�*

Validation_accuracy��R?����&       sO� 	��sX��A�*

Validation_loss��;B��$       B+�M	���	X��A�*

Training_loss~�
B<���$       B+�M	À%
X��A�*

Training_loss�B%ZqL$       B+�M	�{�
X��A�*

Training_loss�KB���$       B+�M	��
X��A�*

Training_loss:�BY���$       B+�M	Z�SX��A�*

Training_loss�$B��b8$       B+�M	4ղX��A�*

Training_loss�G'B����$       B+�M	��X��A�*

Training_loss3x�A$���$       B+�M	�AqX��A�*

Training_loss��B$�$       B+�M	?q�X��A�*

Training_loss_�&B���$       B+�M	2X��A�*

Training_loss��BX��T$       B+�M	��X��A�*

Training_loss]] B�\^$       B+�M	���X��A�*

Training_loss%V�AR0�$       B+�M	KYLX��A�*

Training_loss���A@	�-$       B+�M	��X��A�*

Training_loss��B8zg�$       B+�M	_
X��A�*

Training_loss1�BTcd�$       B+�M	��kX��A�*

Training_lossL�AG�*�$       B+�M	+��X��A�*

Training_lossj�B�83$       B+�M	��(X��A�*

Training_loss<��A�Y�3$       B+�M	A�X��A�*

Training_loss�4�A�>g�$       B+�M	3�X��A�*

Training_loss�=BLa�f$       B+�M	x�@X��A�*

Training_loss�'/BFsg�$       B+�M	Ǆ�X��A�*

Training_loss}�"B��?$       B+�M	�w�X��A�*

Training_loss�[�A/Q�$       B+�M	1	XX��A�*

Training_lossXaKB�e�O$       B+�M	w�X��A�*

Training_loss��Bʘs�$       B+�M	ܼ@X��A�*

Training_loss1fB.gp$       B+�M	NB�X��A�*

Training_lossjqBk�3�$       B+�M	�#X��A�*

Training_loss�"B�E�u$       B+�M	ϼ|X��A�*

Training_loss>bBڶ�h$       B+�M	���X��A�*

Training_loss.B,WC�$       B+�M	x(CX��A�*

Training_lossv�+B���$       B+�M	s٥X��A�*

Training_loss��=B���$       B+�M	32	X��A�*

Training_lossf|'B�?�$       B+�M	/kX��A�*

Training_loss�I&BX���$       B+�M	�[�X��A�*

Training_loss���A��s&$       B+�M	E-X��A�*

Training_loss�WB�@$$       B+�M	2�X��A�*

Training_loss`��Aci�$       B+�M	�ZX��A�*

Training_loss���A���$       B+�M	z�zX��A�*

Training_loss�T�A���`$       B+�M	�;�X��A�*

Training_lossx�A�K�$       B+�M	Ϟ9X��A�*

Training_loss�_�A=�x�$       B+�M	�іX��A�*

Training_lossL[+BI�98$       B+�M	S%�X��A�*

Training_loss��B6-N$       B+�M	��SX��A�*

Training_loss��B�8�o$       B+�M	��X��A�*

Training_lossP�B���W$       B+�M	�X��A�*

Training_lossf9Bl��$       B+�M	;�yX��A�*

Training_lossd_B���$       B+�M	�N�X��A�*

Training_lossޑcB���$       B+�M	��@X��A�*

Training_lossv�/B��M$       B+�M	W&�X��A�*

Training_lossԵ B�?��*       ����	��oX��A�*

Validation_accuracy��Q?����&       sO� 	�oX��A�*

Validation_loss82=B�!$       B+�M	��X��A�*

Training_loss\�BW��$       B+�M	inM X��A�*

Training_loss 1B���$       B+�M	�� X��A�*

Training_loss��BbƧ$       B+�M	PnD!X��A�*

Training_loss6G
B�O2$       B+�M	k�!X��A�*

Training_loss���A.ו3$       B+�M	�."X��A�*

Training_loss$g�A�*�$       B+�M	�ɫ"X��A�*

Training_lossX�B#�+�$       B+�M	ۇ##X��A�*

Training_loss@�B���$       B+�M	p��#X��A�*

Training_loss03B#ս�$       B+�M	�*$X��A�*

Training_loss��B��$       B+�M	$~$X��A�*

Training_loss�QBdz�$       B+�M	n��$X��A�*

Training_losskUB�e�$       B+�M	�C%X��A�*

Training_loss.�B|���$       B+�M	W&�%X��A�*

Training_loss�;+B����$       B+�M	�&X��A�*

Training_loss>}!B3���$       B+�M	ʥg&X��A�*

Training_loss8�A�fKs$       B+�M	/3�&X��A�*

Training_lossst+B�c�$       B+�M	�<$'X��A�*

Training_loss�dB��2u$       B+�M	U��'X��A�*

Training_losst��A��V$       B+�M	[{�'X��A�*

Training_loss�B�!�$       B+�M	>G(X��A�*

Training_loss��A>��$       B+�M	{��(X��A�*

Training_loss7FB)2i$       B+�M	��)X��A�*

Training_loss���A$׋�$       B+�M	!g)X��A�*

Training_lossb�B��!�$       B+�M	G�)X��A�*

Training_lossS�A�`��$       B+�M	�'*X��A�*

Training_loss b#B�*ع$       B+�M	���*X��A�*

Training_loss�
B��$       B+�M	a8�*X��A�*

Training_lossk�@Bmr($       B+�M	��I+X��A�*

Training_lossTP'B��I$       B+�M	!̦+X��A�*

Training_loss�1BA	t
$       B+�M	eo,X��A�*

Training_loss���A��B$       B+�M	�`,X��A�*

Training_loss�{B3cx$       B+�M	���,X��A�*

Training_lossß�A;HA�$       B+�M	��-X��A�*

Training_lossK�B�t�=$       B+�M	�jw-X��A�*

Training_loss��A�zh$       B+�M	���-X��A�*

Training_loss��6B=q]$       B+�M	�2.X��A�*

Training_lossB�B+~@�$       B+�M	��.X��A�*

Training_lossM�BN<&�$       B+�M	���.X��A�*

Training_loss6��A/��$       B+�M	l!I/X��A�*

Training_loss5B8Q0�$       B+�M	��/X��A�*

Training_loss�U�Ac���$       B+�M	=0X��A�*

Training_loss)��AS_�$       B+�M	�6t0X��A�*

Training_loss��%B#aď$       B+�M	$�0X��A�*

Training_lossp�2B0K�$       B+�M	4�p1X��A�*

Training_loss�3B��f$       B+�M	���1X��A�*

Training_lossk�IB�6%�$       B+�M	��\2X��A�*

Training_lossd(
B��ɱ$       B+�M	&��2X��A�*

Training_losst�Bk�Q$       B+�M	!�T3X��A�*

Training_loss�M,B��S�$       B+�M	w0�3X��A�*

Training_loss�B7���*       ����	#��4X��A�*

Validation_accuracyMMR?��0I&       sO� 	���4X��A�*

Validation_loss�=Bc8��$       B+�M	��8X��A�*

Training_lossn�A�@��$       B+�M	,�b8X��A�*

Training_loss��)Be��$       B+�M	�*�8X��A�*

Training_loss�A��e$       B+�M	�W'9X��A�*

Training_lossH�B
��$       B+�M	B��9X��A�*

Training_loss63B�!$       B+�M	���9X��A�*

Training_lossl2B[)�$       B+�M	d=G:X��A�*

Training_loss�;�A��o$       B+�M	��:X��A�*

Training_loss�"�A$       B+�M	�� ;X��A�*

Training_lossb	�A�v�$       B+�M	��^;X��A�*

Training_loss�xBr�h$       B+�M	F��;X��A�*

Training_loss���A��f�$       B+�M	�_<X��A�*

Training_loss�:B<��$       B+�M	�y<X��A�*

Training_loss� �A��`�$       B+�M	2��<X��A�*

Training_loss By���$       B+�M	�I6=X��A�*

Training_loss��B3Y(�$       B+�M	�Y�=X��A�*

Training_loss�׹A�a�$       B+�M	xC�=X��A�*

Training_loss���A�u$       B+�M	yM>X��A�*

Training_lossBy5�$       B+�M	��>X��A�*

Training_loss�B9��$       B+�M	ݖ/?X��A�*

Training_loss�LByɦ�$       B+�M	��?X��A�*

Training_loss��Ab�y�$       B+�M	��#@X��A�*

Training_loss$�B�[��$       B+�M	�3�@X��A�*

Training_lossx
�A(�;�$       B+�M	Q�AX��A�*

Training_lossdJBB��0$       B+�M	B��AX��A�*

Training_loss3[�A01W$       B+�M	A�BX��A�*

Training_loss�4$B�.�Y$       B+�M	ϋBX��A�*

Training_loss8�B�Ï$       B+�M	�s CX��A�*

Training_lossK(B���+$       B+�M	�MtCX��A�*

Training_loss^�	B��ߠ$       B+�M	�%�CX��A�*

Training_loss�8Bx�$       B+�M	!�]DX��A�*

Training_loss6�Ar�d�$       B+�M	���DX��A�*

Training_lossBո��$       B+�M	[�DEX��A�*

Training_loss#B���$       B+�M	�H�EX��A�*

Training_loss�uBk���$       B+�M	��*FX��A�*

Training_loss��B��h�$       B+�M	�{�FX��A�*

Training_loss?�&Bz_1�$       B+�M	��GX��A�*

Training_loss~u5Bb��s$       B+�M	2�GX��A�*

Training_lossMB�#��$       B+�M	c�GX��A�*

Training_loss�
BU�%]$       B+�M	�-nHX��A�*

Training_loss�s	B����$       B+�M	�|�HX��A�*

Training_loss�<)B�C�$       B+�M	TaIX��A�*

Training_loss�AB��3`$       B+�M	^��IX��A�*

Training_loss � B7])7$       B+�M	t(HJX��A�*

Training_loss9)B�z�q$       B+�M	�d�JX��A�*

Training_loss��B�e�=$       B+�M	�{1KX��A�*

Training_loss��Au��$       B+�M	1��KX��A�*

Training_lossB&�A�%�$       B+�M	r�LX��A�*

Training_loss�4BMJ� $       B+�M	�P�LX��A�*

Training_loss4B���$       B+�M	�%MX��A�*

Training_loss�7B�P�x*       ����	�ONX��A�*

Validation_accuracy��Q?�[��&       sO� 	�RNX��A�*

Validation_loss��@B,�5|$       B+�M	���PX��A�*

Training_lossl$BW@�[$       B+�M	KQX��A�*

Training_loss��)B�PZ�$       B+�M	6�QX��A�*

Training_loss�^�AQY�$       B+�M	�]RX��A�*

Training_loss�~BDYx;$       B+�M	��yRX��A�*

Training_loss];'B�#Ģ$       B+�M	J{�RX��A�*

Training_lossn
B�8p�$       B+�M	�McSX��A�*

Training_lossJe"B]$       B+�M	1	�SX��A�*

Training_loss���Aq��$       B+�M	��HTX��A�*

Training_loss��B�i��$       B+�M	an�TX��A�*

Training_loss $B!���$       B+�M	5`0UX��A�*

Training_loss@��A.�$       B+�M	*S�UX��A�*

Training_loss~�	B�T��$       B+�M	��VX��A�*

Training_loss��B����$       B+�M	���VX��A�*

Training_loss�,B�i�$       B+�M	YR WX��A�*

Training_loss���AI�x�$       B+�M	u>tWX��A�*

Training_loss�	BN�VX$       B+�M	D��WX��A�*

Training_loss*	B����$       B+�M	c�[XX��A�*

Training_lossHm�A��Z�$       B+�M	���XX��A�*

Training_loss�A���$       B+�M	[CDYX��A�*

Training_loss�	B2	$       B+�M	���YX��A�*

Training_loss#!,B��
�$       B+�M	V1ZX��A�*

Training_lossrB�,��$       B+�M	$�ZX��A�*

Training_lossu4�AB��$       B+�M	�[X��A�*

Training_loss�J�A,�6$       B+�M	�u�[X��A�*

Training_losslD�A���$       B+�M	5��[X��A�*

Training_lossU@1B�~$       B+�M	U�s\X��A�*

Training_loss��Bv�f�$       B+�M	��\X��A�*

Training_loss��B���$       B+�M	{�[]X��A�*

Training_lossb� BMy�$       B+�M	���]X��A�*

Training_loss�B�WA�$       B+�M	�D^X��A�*

Training_loss���AM$       B+�M	��^X��A�*

Training_lossz�;B��8�$       B+�M	)�,_X��A�*

Training_loss���A�e�4$       B+�M	��_X��A�*

Training_lossT�B2�$       B+�M	��)`X��A�*

Training_lossĺB��$       B+�M	��`X��A�*

Training_loss6��A�$,�$       B+�M	7�aX��A�*

Training_lossN4 B%��$       B+�M	��aX��A�*

Training_loss�'B3���$       B+�M	ΈbX��A�*

Training_loss�[�Ayi�_$       B+�M	b�bX��A�*

Training_loss��Bf���$       B+�M	�cX��A�*

Training_lossvxBp$       B+�M	�}cX��A�*

Training_loss�JB�Nhd$       B+�M	���cX��A�*

Training_loss��/B�N'�$       B+�M	@/ddX��A�*

Training_loss�$B(��$       B+�M	��dX��A�*

Training_loss�B�A!�|$       B+�M	x�LeX��A�*

Training_loss�@
B%��Q$       B+�M	�c�eX��A�*

Training_loss��B�C��$       B+�M		�2fX��A�*

Training_lossJ�B^�%Z$       B+�M	;��fX��A�*

Training_loss��Ap�$       B+�M	�ngX��A�*

Training_loss��B\s��*       ����	h�hX��A�*

Validation_accuracyMMR?<�3+&       sO� 	��hX��A�*

Validation_losso<B۰F�$       B+�M	��jX��A�*

Training_loss�8�A���R$       B+�M	��kX��A�*

Training_lossb6�Aʫ$       B+�M	�n�kX��A�*

Training_loss���AF_�$       B+�M	�6lX��A�*

Training_lossl��A�Jl�$       B+�M	�xlX��A�*

Training_lossY�	BA���$       B+�M	l��lX��A�*

Training_loss�)B���$       B+�M	�}^mX��A�*

Training_loss��7BO��,$       B+�M	���mX��A�*

Training_loss'�2B+�y�$       B+�M	%�CnX��A�*

Training_lossz�=B�Q9+$       B+�M	�U�nX��A�*

Training_loss^޵A��\�$       B+�M	��*oX��A�*

Training_loss��B����$       B+�M	iT�oX��A�*

Training_loss&�B7�,�$       B+�M	�<pX��A�*

Training_loss<�A@]��$       B+�M	�ЅpX��A�*

Training_loss�PB��$       B+�M	kf�pX��A�*

Training_loss��B�և$       B+�M	��nqX��A�*

Training_loss�B�tGa$       B+�M	]P�qX��A�*

Training_losss�EB��p$       B+�M	�XrX��A�*

Training_loss�	B˔�$       B+�M	���rX��A�*

Training_loss��BG��$       B+�M	�Q@sX��A�*

Training_loss�j�A���$       B+�M	�[�sX��A�*

Training_lossV��A��$�$       B+�M	��'tX��A�*

Training_lossv~
B�_�$       B+�M	��tX��A�*

Training_loss �B�%#�$       B+�M	$%uX��A�*

Training_lossf�5B��
$       B+�M	S��uX��A�*

Training_loss"%B���$       B+�M	�^�uX��A�*

Training_lossB��N�$       B+�M	]�gvX��A�*

Training_loss}��A��a?$       B+�M	/��vX��A�*

Training_loss(��A@�T�$       B+�M	vMwX��A�*

Training_lossLeHB���$       B+�M	?�wX��A�*

Training_loss>!B�2M%$       B+�M	M�9xX��A�*

Training_loss��9B�]zN$       B+�M	���xX��A�*

Training_loss�'B�o
$       B+�M	��#yX��A�*

Training_loss�v B��Ԇ$       B+�M	��yX��A�*

Training_loss8B����$       B+�M	.�zX��A�*

Training_loss�=B����$       B+�M	��~zX��A�*

Training_lossq}�A��$�$       B+�M	��zX��A�*

Training_loss{�A!hv$       B+�M	�'{{X��A�*

Training_loss�_B	�p�$       B+�M	���{X��A�*

Training_lossCq�AYʸ@$       B+�M	�!d|X��A�*

Training_loss�wLB���$       B+�M	fM�|X��A�*

Training_loss+�Aǯh�$       B+�M	�K}X��A�*

Training_loss"�B�-Fb$       B+�M	���}X��A�*

Training_loss.C�A�n��$       B+�M	�34~X��A�*

Training_loss"�8B`��$       B+�M	>�~X��A�*

Training_loss͞B4Q�$       B+�M	�!X��A�*

Training_loss.b�Aeap$       B+�M	�X��A�*

Training_loss6�5BI��$       B+�M	�L�X��A�*

Training_loss�B�j36$       B+�M	�j��X��A�*

Training_loss:�5B?ݚ�$       B+�M	�L��X��A�*

Training_lossu�Aq6E�*       ����	���X��A�*

Validation_accuracy��R?���I&       sO� 	���X��A�*

Validation_lossl�9B���$       B+�M	��B�X��A�*

Training_lossJ�2B�Ϻ�$       B+�M	��X��A�*

Training_loss��Bфī$       B+�M	H�4�X��A�*

Training_loss:K�A��g�$       B+�M	���X��A�*

Training_lossBfw��$       B+�M	�E�X��A�*

Training_loss�� B��$       B+�M	��X��A�*

Training_lossB;I;�$       B+�M	� �X��A�*

Training_loss���A9]$       B+�M	���X��A�*

Training_loss6PB��J$       B+�M	Z��X��A�*

Training_loss�b�A���$       B+�M	�t�X��A�*

Training_lossaK,BUʍ�$       B+�M	wj�X��A�*

Training_loss�2�A���$       B+�M	��b�X��A�*

Training_loss�3	Bw��l$       B+�M	N^܊X��A�*

Training_loss��	B ��`$       B+�M	�~S�X��A�*

Training_lossX!IB��C$       B+�M	�"̋X��A�*

Training_loss`�B�>($       B+�M	�D�X��A�*

Training_loss'�AB����$       B+�M	m���X��A�*

Training_loss� B���$       B+�M	�1�X��A�*

Training_loss��A�N�3$       B+�M	o�X��A�*

Training_lossf�A�h�:$       B+�M	U%�X��A�*

Training_loss��B�wE$       B+�M	3���X��A�*

Training_loss�k�A�% $       B+�M	��%�X��A�*

Training_loss���AlI{�$       B+�M	S���X��A�*

Training_loss®B�2�$       B+�M	��X��A�*

Training_loss 1B3���$       B+�M	n�F�X��A�*

Training_lossn&0B�0]>$       B+�M	�˥�X��A�*

Training_loss�a�A��$       B+�M	/�X��A�*

Training_lossWB����$       B+�M	�a�X��A�*

Training_loss�B'eVx$       B+�M	�Q��X��A�*

Training_loss�A��X�$       B+�M	D��X��A�*

Training_loss���A�
v$       B+�M	~U{�X��A�*

Training_lossӟ5BÚ�$       B+�M	��ڒX��A�*

Training_loss0�A1M��$       B+�M	�8�X��A�*

Training_loss�BU4�$       B+�M	ٳ��X��A�*

Training_loss4WB!L��$       B+�M	����X��A�*

Training_loss�BN��~$       B+�M	[�X��A�*

Training_loss���A���$       B+�M	l���X��A�*

Training_lossn�B^�J$       B+�M	ς�X��A�*

Training_loss>��A�$       B+�M	�w�X��A�*

Training_loss��&B7��$       B+�M	#f�X��A�*

Training_loss��;B~*�$       B+�M	��C�X��A�*

Training_loss,B�v��$       B+�M	81��X��A�*

Training_loss���A��$       B+�M	`;��X��A�*

Training_loss���A��=3$       B+�M	�\�X��A�*

Training_loss���Ae��$       B+�M	:y��X��A�*

Training_losst�4B �X$       B+�M	u9)�X��A�*

Training_lossZҰA�?�v$       B+�M	$���X��A�*

Training_lossn�B��	@$       B+�M	{0�X��A�*

Training_loss4�B>|��$       B+�M	-V�X��A�*

Training_lossS��A��H�$       B+�M	,��X��A�*

Training_loss/B����*       ����	�]x�X��A�*

Validation_accuracyyyQ?�g�&       sO� 	5`x�X��A�*

Validation_lossi�@B��L$       B+�M	���X��A�*

Training_loss��4B���$       B+�M	y�P�X��A�*

Training_losspk�AKHj�$       B+�M	�m��X��A�*

Training_loss��A~���$       B+�M	��	�X��A�*

Training_lossB�
B��O�$       B+�M	;g�X��A�*

Training_loss�A��
_$       B+�M	��ÞX��A�*

Training_loss§,B��F$       B+�M	�F �X��A�*

Training_lossp��Av�$       B+�M	�{�X��A�*

Training_lossMP�A�|��$       B+�M	��ןX��A�*

Training_loss�LBF&\$       B+�M	-3�X��A�*

Training_loss�$B���$       B+�M	9ю�X��A�*

Training_loss�|B,kd|$       B+�M	�X��A�*

Training_loss0��AhR�$       B+�M	1�O�X��A�*

Training_loss>YBu��$       B+�M	F'ӡX��A�*

Training_loss���A��I$       B+�M	t`F�X��A�*

Training_loss��B{�a$       B+�M	l��X��A�*

Training_loss�y*B[��C$       B+�M	�i4�X��A�*

Training_loss���A�>k$       B+�M	3���X��A�*

Training_loss��B���$       B+�M	�'�X��A�*

Training_loss5r�A6��$       B+�M	���X��A�*

Training_loss< B�k�$       B+�M	���X��A�*

Training_lossFW�A�?��$       B+�M	�6��X��A�*

Training_loss9ETBio*$       B+�M	:���X��A�*

Training_loss1��Aa���$       B+�M	֌l�X��A�*

Training_loss���A�,[@$       B+�M	���X��A�*

Training_loss��AE�6�$       B+�M	��_�X��A�*

Training_loss�	�A�xw`$       B+�M	\�ڧX��A�*

Training_loss���A�s��$       B+�M	/1U�X��A�*

Training_loss�'B�!��$       B+�M	�h̨X��A�*

Training_losszFBܹm�$       B+�M	
KJ�X��A�*

Training_loss�TB�i��$       B+�M	0���X��A�*

Training_loss�O.B[dX_$       B+�M	B�2�X��A�*

Training_loss�?B��F$       B+�M	,զ�X��A�*

Training_loss~{�A��}$       B+�M	TV�X��A�*

Training_loss;%�A�c��$       B+�M	�p��X��A�*

Training_loss�B��$       B+�M	\�X��A�*

Training_loss|pBX��N$       B+�M	�hz�X��A�*

Training_loss�V�A�K	$       B+�M	���X��A�*

Training_loss�*BUE=$       B+�M	��m�X��A�*

Training_lossd��Aώ߹$       B+�M	O�X��A�*

Training_loss�E%B�`��$       B+�M	��f�X��A�*

Training_loss<�B�f��$       B+�M	��ޮX��A�*

Training_loss��AS@&Z$       B+�M	�e^�X��A�*

Training_loss)�5B����$       B+�M	��ׯX��A�*

Training_loss:G�A"���$       B+�M	v�P�X��A�*

Training_loss9BW1?n$       B+�M	��ǰX��A�*

Training_loss1�5B5���$       B+�M	�<;�X��A�*

Training_loss!��A��c!$       B+�M	���X��A�*

Training_lossV�B	LQ�$       B+�M	��)�X��A�*

Training_loss�/Bk�R�$       B+�M	l���X��A�*

Training_loss@��A;��*       ����	`vx�X��A�*

Validation_accuracy��Q?�+a&       sO� 	�xx�X��A�*

Validation_lossD5;B��� $       B+�M	����X��A�*

Training_loss\@�AqC$R$       B+�M	��X�X��A�*

Training_loss{�B.$       B+�M	���X��A�*

Training_loss��YB�	K$       B+�M	C��X��A�*

Training_lossj��A�o�$       B+�M	/Qw�X��A�*

Training_loss��A��<$       B+�M	�طX��A�*

Training_loss7�B�OH$       B+�M	�R8�X��A�*

Training_lossۧ�A�O�$       B+�M	?���X��A�*

Training_loss��B���8$       B+�M	�%��X��A�*

Training_lossrEB�I�c$       B+�M	M�[�X��A�*

Training_loss
$B��z$       B+�M	=��X��A�*

Training_loss\q3B���$       B+�M	q�X��A�*

Training_lossZ�A����$       B+�M	x'v�X��A�*

Training_losseB�ժ�$       B+�M	�ӺX��A�*

Training_loss<��A��)F$       B+�M	�(1�X��A�*

Training_loss~K�A�I��$       B+�M	�=��X��A�*

Training_loss��B��[=$       B+�M	5���X��A�*

Training_loss���AAU�$       B+�M	0�K�X��A�*

Training_lossQ�AS���$       B+�M	�Э�X��A�*

Training_losslTBN'�$       B+�M	Tr�X��A�*

Training_loss,�$B�SȻ$       B+�M	�"o�X��A�*

Training_loss]vBh2$       B+�M	�t˽X��A�*

Training_loss)�B�a�$       B+�M	�?,�X��A�*

Training_loss���A�1�t$       B+�M	H��X��A�*

Training_loss*�B��$       B+�M	o.�X��A�*

Training_loss��B���$       B+�M	�L�X��A�*

Training_loss��A���$       B+�M	u��X��A�*

Training_lossv�B��$       B+�M	bh�X��A�*

Training_loss���ABR��$       B+�M	�t�X��A�*

Training_loss�3Bp0��$       B+�M	qW��X��A�*

Training_loss�B�+H5$       B+�M	$A�X��A�*

Training_loss��B�A��$       B+�M	6w��X��A�*

Training_loss�DBQ��$       B+�M	���X��A�*

Training_loss�W�A����$       B+�M	L�f�X��A�*

Training_loss���A�'�<$       B+�M	����X��A�*

Training_loss|� BR�#$       B+�M	b�"�X��A�*

Training_loss�z�AW׊�$       B+�M	�]�X��A�*

Training_loss��B��>$       B+�M	M���X��A�*

Training_lossh;�AD8�$       B+�M	��d�X��A�*

Training_loss8�B�M��$       B+�M	b��X��A�*

Training_loss���A;X$       B+�M	@�T�X��A�*

Training_lossq8B��q4$       B+�M	J��X��A�*

Training_lossp�B�z��$       B+�M	�%@�X��A�*

Training_lossi~DB'���$       B+�M	i��X��A�*

Training_loss��A��i$       B+�M	Qj-�X��A�*

Training_lossI�GB�j��$       B+�M	1?��X��A�*

Training_loss]I�A�T��$       B+�M	���X��A�*

Training_loss�$B5c_X$       B+�M	㤓�X��A�*

Training_loss��B�b��$       B+�M	#,�X��A�*

Training_lossNN�AA���$       B+�M	�@�X��A�*

Training_losspN�A���C*       ����	؁P�X��A�*

Validation_accuracy��S?�ecV&       sO� 	˅P�X��A�*

Validation_loss��8BS�[�$       B+�M	~���X��A�*

Training_losszBc��$       B+�M	�S�X��A�*

Training_loss��Ak%Y�$       B+�M	�ϲ�X��A�*

Training_loss��A���$       B+�M	�D�X��A�*

Training_loss���A�V�H$       B+�M	a�w�X��A�*

Training_loss5�B���U$       B+�M	`���X��A�*

Training_loss,�B�!W$       B+�M	�5�X��A�*

Training_loss�e�A/���$       B+�M	#۔�X��A�*

Training_lossO�B��{�$       B+�M	~t��X��A�*

Training_loss��0B�1,�$       B+�M	�ZV�X��A�*

Training_loss���A�Sh�$       B+�M	V��X��A�*

Training_loss�A�*$       B+�M	�-�X��A�*

Training_loss7�B��4$       B+�M	�bs�X��A�*

Training_lossQr�A��P�$       B+�M	����X��A�*

Training_loss�>Bc���$       B+�M	��X�X��A�*

Training_loss���A}�$       B+�M	����X��A�*

Training_loss�%B��K$       B+�M	��J�X��A�*

Training_loss�A���M$       B+�M	�=��X��A�*

Training_lossA}�A�Ǿ$       B+�M	�E�X��A�*

Training_lossx�A�p&$       B+�M	�º�X��A�*

Training_lossN�@B�\�$       B+�M	��-�X��A�*

Training_lossS�A�*5�$       B+�M	����X��A�*

Training_loss ��A�J��$       B+�M	*s�X��A�*

Training_loss\c&B��.�$       B+�M	3��X��A�*

Training_loss��BgoW$       B+�M	�; �X��A�*

Training_loss��B*"nZ$       B+�M	M�r�X��A�*

Training_loss�]�A#'�$       B+�M	���X��A�*

Training_loss���A�+Y$       B+�M	Y\�X��A�*

Training_loss���A��m�$       B+�M	����X��A�*

Training_loss�k�A�m.�$       B+�M	�G�X��A�*

Training_loss6��A����$       B+�M	�^��X��A�*

Training_loss���Ay�<x$       B+�M	�/�X��A�*

Training_lossܻ�A��a�$       B+�M	�Ф�X��A�*

Training_lossd�Bk9U$       B+�M	=�X��A�*

Training_lossl#Bi�y�$       B+�M	킐�X��A�*

Training_lossH �A+���$       B+�M	j�
�X��A�*

Training_lossU�A����$       B+�M	�u��X��A�*

Training_loss��B�d��$       B+�M	Ƨ��X��A�*

Training_loss��
B�Ў�$       B+�M	��u�X��A�*

Training_loss qBt��$       B+�M	x���X��A�*

Training_loss���A���$       B+�M	m�c�X��A�*

Training_loss��A����$       B+�M	
��X��A�*

Training_lossV
Bʐ��$       B+�M	,�N�X��A�*

Training_lossmuBQ���$       B+�M	?���X��A�*

Training_lossȌB)�b�$       B+�M	.�F�X��A�*

Training_lossR��A� $       B+�M	g׽�X��A�*

Training_loss��B�&�@$       B+�M	�m3�X��A�*

Training_loss<3B/1�$       B+�M	U��X��A�*

Training_lossܸA��nY$       B+�M	�)%�X��A�*

Training_lossD�	Bv�S$       B+�M	����X��A�*

Training_lossl�BW�E*       ����	T]�X��A�*

Validation_accuracy��Q?ȧ&       sO� 	G ]�X��A�*

Validation_loss�R>B_��$       B+�M	R8�X��A�*

Training_loss���A���u$       B+�M	����X��A�*

Training_loss�@�AN`��$       B+�M	N�!�X��A�*

Training_loss�B�AF�37$       B+�M	l@��X��A�*

Training_lossqu�A����$       B+�M	��
�X��A�*

Training_loss{5�A#,�$       B+�M	Ͽ}�X��A�*

Training_loss�o�A�P�P$       B+�M	����X��A�*

Training_loss�A~B@$       B+�M	�Wk�X��A�*

Training_loss�'B�2��$       B+�M	���X��A�*

Training_loss�B��$       B+�M	�de�X��A�*

Training_lossOlB�/TE$       B+�M	If��X��A�*

Training_loss�:�A�b6�$       B+�M	+5�X��A�*

Training_loss��"B��7$       B+�M	ٖ�X��A�*

Training_lossyqB�zL $       B+�M	�L��X��A�*

Training_loss���AW�l�$       B+�M	q[�X��A�*

Training_lossZ�B��$       B+�M	3���X��A�*

Training_loss��B$�i�$       B+�M	�X��A�*

Training_lossRd�A�S�$       B+�M	�/}�X��A�*

Training_loss0pB�4�$       B+�M	By��X��A�*

Training_loss��A�j��$       B+�M	�]@�X��A�*

Training_loss�A�	a$       B+�M	�P��X��A�*

Training_loss=�A����$       B+�M	��X��A�*

Training_loss?�AK%�$       B+�M	��n�X��A�*

Training_loss�v�A"|v$       B+�M	�-��X��A�*

Training_loss�w�AbS��$       B+�M	&�4�X��A�*

Training_loss��A�?5$       B+�M	b���X��A�*

Training_loss�^B���$       B+�M	�h��X��A�*

Training_loss8B�	�t$       B+�M	M�R�X��A�*

Training_loss���A~v�$       B+�M	���X��A�*

Training_loss���A]]�$       B+�M	֬�X��A�*

Training_loss�I�AaS��$       B+�M	��k�X��A�*

Training_loss���AXT�$       B+�M	�1��X��A�*

Training_loss:�A�`{�$       B+�M	�J+�X��A�*

Training_loss��Ba{�j$       B+�M	i��X��A�*

Training_loss9�ACm}$       B+�M		�"�X��A�*

Training_loss���AY�9F$       B+�M	`ɡ�X��A�*

Training_loss\BB�I�$       B+�M	�~"�X��A�*

Training_loss:�Az;H�$       B+�M	B���X��A�*

Training_loss^�Bl7i$       B+�M	���X��A�*

Training_lossD�Bת�p$       B+�M	x���X��A�*

Training_loss���A���R$       B+�M	���X��A�*

Training_loss8K�A���$       B+�M	_�{�X��A�*

Training_loss��Ag@��$       B+�M	����X��A�*

Training_lossh��A���7$       B+�M	5Am�X��A�*

Training_lossz��At��!$       B+�M	�C��X��A�*

Training_loss+��A�@��$       B+�M	GTV�X��A�*

Training_loss��B��V'$       B+�M	?���X��A�*

Training_loss���A
���$       B+�M	�J�X��A�*

Training_lossƄ�A���$       B+�M	����X��A�*

Training_loss}X�A�Ӏ$       B+�M	�d�X��A�*

Training_loss���A�"}�*       ����	 ���X��A�*

Validation_accuracy��Q?�m)1&       sO� 	����X��A�*

Validation_loss��:BUy�$       B+�M	-��X��A�*

Training_lossr'B�#�l$       B+�M	O% Y��A�*

Training_lossR!�Aw���$       B+�M	VE� Y��A�*

Training_loss<hB��9$       B+�M	D�Y��A�*

Training_loss���Ag���$       B+�M	Ɗ�Y��A�*

Training_loss�k�A���]$       B+�M	K��Y��A�*

Training_lossΒBϛ<�$       B+�M	� mY��A�*

Training_lossID�A��$       B+�M	O��Y��A�*

Training_loss.B$       B+�M	ڌkY��A�*

Training_lossnx%B�PP}$       B+�M	_��Y��A�*

Training_loss�>%BT�{�$       B+�M	�TY��A�*

Training_loss���A�ġ�$       B+�M	L��Y��A�*

Training_loss���A�^'�$       B+�M	`GY��A�*

Training_loss��B����$       B+�M	�B�Y��A�*

Training_loss���A��P$       B+�M	��3Y��A�*

Training_loss��B��C$       B+�M	���Y��A�*

Training_lossp�Bk��$       B+�M	�	-Y��A�*

Training_losse��A�0r$       B+�M	F%�Y��A�*

Training_loss� Bw|nY$       B+�M	2Y��A�*

Training_loss��B��9�$       B+�M	���Y��A�*

Training_loss�>�A��]$       B+�M	A�"	Y��A�*

Training_loss]��A(��:$       B+�M	�˙	Y��A�*

Training_loss�T(Be�$       B+�M	�'
Y��A�*

Training_lossQ�B\�Y$       B+�M	�|�
Y��A�*

Training_loss�AG��3$       B+�M	�Y��A�*

Training_loss��B�AC$       B+�M	� zY��A�*

Training_loss���A��Y�$       B+�M	6�Y��A�*

Training_lossKFB}*�H$       B+�M	N|hY��A�*

Training_lossnF�A�'��$       B+�M	���Y��A�*

Training_loss)�A�(-
$       B+�M	|]Y��A�*

Training_loss���A|�a$       B+�M	��Y��A�*

Training_loss���A7<$       B+�M	�PY��A�*

Training_loss��A��(x$       B+�M	R��Y��A�*

Training_lossBiB�@�$       B+�M	�o8Y��A�*

Training_loss,� B��$       B+�M	*9�Y��A�*

Training_loss�	B �H^$       B+�M	��Y��A�*

Training_loss�9BC�d$       B+�M	��Y��A�*

Training_loss�=�Azd$       B+�M	��Y��A�*

Training_loss.��A�I��$       B+�M	���Y��A�*

Training_loss$f�A�G��$       B+�M	���Y��A�*

Training_loss��B�H�f$       B+�M	�jY��A�*

Training_lossj�A��D$       B+�M	F]�Y��A�*

Training_loss%��A�Tv�$       B+�M	h%dY��A�*

Training_lossl�2B5��h$       B+�M	�'�Y��A�*

Training_loss�cB���$       B+�M	=8Y��A�*

Training_lossx�B�I$       B+�M	#N�Y��A�*

Training_loss�ZB�#V�$       B+�M	��Y��A�*

Training_loss��B����$       B+�M	&eY��A�*

Training_loss}U�A���$       B+�M	%��Y��A�*

Training_loss��B�ٯD$       B+�M	e4%Y��A�*

Training_lossЫ�AĹN�*       ����	���Y��A�*

Validation_accuracy��P?�!�U&       sO� 	[��Y��A�*

Validation_loss <Bs^�$       B+�M	�Y��A�*

Training_loss�нA���$       B+�M	e�/Y��A�*

Training_lossy�A����$       B+�M	x�Y��A�*

Training_loss���A���$       B+�M	�/*Y��A�*

Training_lossH�As7�$       B+�M	&�Y��A�*

Training_loss�B+�P�$       B+�M	��Y��A�*

Training_loss6>�AQ6~�$       B+�M	`�Y��A�*

Training_lossN��A!�n$       B+�M	a�Y��A�*

Training_loss�S�A#&l�$       B+�M	�Z�Y��A�*

Training_lossA�Bh��$       B+�M	���Y��A�*

Training_lossc~�ALn�\$       B+�M	C�vY��A�*

Training_lossRKuA��s$       B+�M	f��Y��A�*

Training_loss�M$B��/[$       B+�M	��eY��A�*

Training_loss3 B���$       B+�M	���Y��A�*

Training_loss8�BC�$       B+�M	�rX Y��A�*

Training_loss�BW�{($       B+�M	��� Y��A�*

Training_lossA��A����$       B+�M	L�F!Y��A�*

Training_lossb��A���$       B+�M	!�!Y��A�*

Training_loss.�B�z��$       B+�M	{6"Y��A�*

Training_loss�r�AҔ�+$       B+�M	S��"Y��A�*

Training_loss(�B+�A$       B+�M	6(#Y��A�*

Training_loss�<�A[8	�$       B+�M	|Ѣ#Y��A�*

Training_lossbmB�9�Y$       B+�M	�d)$Y��A�*

Training_loss��A�.($       B+�M	�]�$Y��A�*

Training_loss�B|)5$       B+�M	O��$Y��A�*

Training_loss�fB"�$       B+�M	�qL%Y��A�*

Training_loss�|�AA���$       B+�M	�˭%Y��A�*

Training_loss�4B&?$       B+�M	v�&Y��A�*

Training_loss�z
B�$       B+�M	�{o&Y��A�*

Training_losstBgʹ�$       B+�M	�x�&Y��A�*

Training_loss(ѫA�ٛ$       B+�M	T�2'Y��A�*

Training_lossb	�Ax�A�$       B+�M	��'Y��A�*

Training_loss���Az}a�$       B+�M	|��'Y��A�*

Training_loss��A���$       B+�M	8�T(Y��A�*

Training_lossfBII �$       B+�M	��(Y��A�*

Training_loss���A���	$       B+�M	4I)Y��A�*

Training_loss�HBKp$       B+�M	2�y)Y��A�*

Training_lossr�B��1�$       B+�M	IL�)Y��A�*

Training_lossb��A�'u�$       B+�M	rR8*Y��A�*

Training_loss���A���$       B+�M	�֘*Y��A�*

Training_loss��B�)��$       B+�M	�j�*Y��A�*

Training_lossU�Ay��$       B+�M	�rW+Y��A�*

Training_loss�B�o�d$       B+�M	��+Y��A�*

Training_loss�(�A	��"$       B+�M	�:,Y��A�*

Training_loss CB��,�$       B+�M	B�,Y��A�*

Training_loss���A?�y<$       B+�M	o�,-Y��A�*

Training_loss��
BĹ@$       B+�M	iţ-Y��A�*

Training_loss�O�A �
$       B+�M		�.Y��A�*

Training_loss�~B΅�$       B+�M	��.Y��A�*

Training_loss!B-\��$       B+�M	_|/Y��A�*

Training_lossl2B%7�{*       ����	�20Y��A�*

Validation_accuracy��Q?��T.&       sO� 	�40Y��A�*

Validation_loss�?B�]d�$       B+�M	�3Y��A�*

Training_loss}��A0� $       B+�M	�cs3Y��A�*

Training_loss���A1/�|$       B+�M	���3Y��A�*

Training_lossʆ�A_�m�$       B+�M	��44Y��A�*

Training_loss�5B�G��$       B+�M	IJ�4Y��A�*

Training_lossʮB�^�]$       B+�M	#�4Y��A�*

Training_loss �B��R$       B+�M	lY5Y��A�*

Training_loss��A���`$       B+�M	�]�5Y��A�*

Training_lossp��A�;(�$       B+�M	]�16Y��A�*

Training_loss&MB<��
$       B+�M	�9�6Y��A�*

Training_lossƨ�A3��$       B+�M	���6Y��A�*

Training_loss�|B����$       B+�M	��X7Y��A�*

Training_loss$#B���	$       B+�M	9к7Y��A�*

Training_lossn�Bٝ�$       B+�M	${8Y��A�*

Training_lossxQ0B̥'$       B+�M	�4�8Y��A�*

Training_loss���A��&�$       B+�M	�0�8Y��A�*

Training_loss	�AC�`$       B+�M	��J9Y��A�*

Training_loss�>B��sz$       B+�M	�ҭ9Y��A�*

Training_lossT(�Aكj]$       B+�M	��:Y��A�*

Training_lossV�5B��j�$       B+�M	�h:Y��A�*

Training_loss��A�-'$       B+�M	s��:Y��A�*

Training_loss�<�A�=�$       B+�M	�$0;Y��A�*

Training_loss��A����$       B+�M	ྏ;Y��A�*

Training_loss���A�T�$       B+�M	�P�;Y��A�*

Training_lossB���$       B+�M	.SP<Y��A�*

Training_loss��AH=�$       B+�M	Yk�<Y��A�*

Training_loss�KBf��=$       B+�M	M�
=Y��A�*

Training_loss���A�� �$       B+�M	�h=Y��A�*

Training_lossd<B��U�$       B+�M	h��=Y��A�*

Training_loss��A�$       B+�M	׽*>Y��A�*

Training_loss�$�A>�*$       B+�M	��>Y��A�*

Training_loss�+�AR��O$       B+�M	���>Y��A�*

Training_loss���A���7$       B+�M	��K?Y��A�*

Training_loss�\B�DP$       B+�M	ݶ�?Y��A�*

Training_loss�7�AͳPl$       B+�M	��@Y��A�*

Training_loss�LB�e�[$       B+�M	1�j@Y��A�*

Training_loss��AV� <$       B+�M	�6�@Y��A�*

Training_loss!`�A�/�a$       B+�M	��-AY��A�*

Training_loss���A�d)�$       B+�M	~�AY��A�*

Training_loss��B�sc$       B+�M	���AY��A�*

Training_lossԷ�A�߯�$       B+�M	�X`BY��A�*

Training_loss�hB����$       B+�M	�B�BY��A�*

Training_loss���AG��x$       B+�M	��$CY��A�*

Training_loss��AR���$       B+�M	���CY��A�*

Training_loss�x�AS��N$       B+�M	���CY��A�*

Training_loss�(B�a$       B+�M	�?DY��A�*

Training_losso�B�Ty$       B+�M	W��DY��A�*

Training_loss���A��Oj$       B+�M	�&�DY��A�*

Training_loss�GBÔ��$       B+�M	�aYEY��A�*

Training_loss�'B���,$       B+�M	�ѶEY��A�*

Training_loss��A�mfh*       ����	�~FY��A�*

Validation_accuracy��P?��Q�&       sO� 	~FY��A�*

Validation_loss'�:B6�$       B+�M	 SZIY��A�*

Training_lossb�B,�!$       B+�M	���IY��A�*

Training_loss|��A� ��$       B+�M	Ih!JY��A�*

Training_loss���A��L$$       B+�M	J��JY��A�*

Training_loss�j�A���=$       B+�M	���JY��A�*

Training_loss�h�A����$       B+�M	�FBKY��A�*

Training_loss���Aj1Uz$       B+�M	�	�KY��A�*

Training_loss��B��n$       B+�M	t_LY��A�*

Training_loss�B?DT$       B+�M	�gLY��A�*

Training_lossK:Bs<ī$       B+�M	Ϊ�LY��A�*

Training_loss�;�A=��$       B+�M	Do*MY��A�*

Training_lossJTBw}��$       B+�M	X��MY��A�*

Training_loss�K�A�q�)$       B+�M	��MY��A�*

Training_loss�A�G�1$       B+�M	��KNY��A�*

Training_loss��A�Z-�$       B+�M	4�NY��A�*

Training_loss[�B���g$       B+�M	G�OY��A�*

Training_loss �B��l$       B+�M	��iOY��A�*

Training_loss��A��G�$       B+�M	�t�OY��A�*

Training_loss�|BW!1$       B+�M	{1PY��A�*

Training_loss��	Bk�B$       B+�M	y��PY��A�*

Training_lossb��A4��$       B+�M	\sQY��A�*

Training_loss���Ae�w�$       B+�M	O\zQY��A�*

Training_loss�@�A?a3$       B+�M	���QY��A�*

Training_loss�aB�\B�$       B+�M	�N:RY��A�*

Training_loss�MB�o�$       B+�M	��RY��A�*

Training_loss;l�A:�Y�$       B+�M	���RY��A�*

Training_loss�B}��=$       B+�M	��TSY��A�*

Training_loss B��$       B+�M	}Z�SY��A�*

Training_loss���A�ד�$       B+�M	7�TY��A�*

Training_loss�� Bnr�$       B+�M	?�sTY��A�*

Training_loss,�XB��$       B+�M	��TY��A�*

Training_loss���AC��$       B+�M	>�5UY��A�*

Training_loss��A��K�$       B+�M	1�UY��A�*

Training_loss��$B����$       B+�M	�p�UY��A�*

Training_loss��A�R"$       B+�M	�>XVY��A�*

Training_loss宍A+�Z)$       B+�M	�ԵVY��A�*

Training_loss�JB6��$       B+�M	�WY��A�*

Training_loss��A�NQB$       B+�M	0�oWY��A�*

Training_loss9�A�$       B+�M	�D�WY��A�*

Training_loss�M�A%E��$       B+�M	�U.XY��A�*

Training_lossl
B�oq�$       B+�M	j��XY��A�*

Training_loss~��A�J�$       B+�M	��XY��A�*

Training_loss�B��
�$       B+�M	�NYY��A�*

Training_loss��
B� �h$       B+�M	MٳYY��A�*

Training_loss���A��,$       B+�M	�ZY��A�*

Training_loss���A��.�$       B+�M	(uZY��A�*

Training_lossƁ�A?�8$       B+�M	s��ZY��A�*

Training_lossD_BHM|$       B+�M	�
@[Y��A�*

Training_loss��A��s$       B+�M	"6�[Y��A�*

Training_loss|��A�,U�$       B+�M	@��[Y��A�*

Training_loss�~!B.z��*       ����	#��\Y��A�*

Validation_accuracy��P?�/9�&       sO� 	<��\Y��A�*

Validation_lossCS<B*?3$       B+�M	�_Y��A�*

Training_lossT�B�<�S$       B+�M	{�_Y��A�*

Training_loss��B�GTt$       B+�M	4�L`Y��A�*

Training_loss�:B����$       B+�M	崭`Y��A�*

Training_loss���A8"�$       B+�M	?r aY��A�*

Training_loss�BB�vO�$       B+�M	<��aY��A�*

Training_loss>oBm_$       B+�M		S�aY��A�*

Training_loss�_�A'��h$       B+�M	��IbY��A�*

Training_lossF""B�>�$       B+�M	�ȧbY��A�*

Training_loss�~�A�)S�$       B+�M	K<cY��A�*

Training_loss�%�A��$       B+�M		okcY��A�*

Training_loss8�B+d��$       B+�M	y��cY��A�*

Training_loss~\�AL(�$       B+�M	T2dY��A�*

Training_loss4�(B�9ց$       B+�M	�͓dY��A�*

Training_loss�LB�h�$       B+�M	�o�dY��A�*

Training_loss:��AIp�$       B+�M	+�LeY��A�*

Training_lossb�3B	�)�$       B+�M	�eY��A�*

Training_loss��A�/y$       B+�M	� fY��A�*

Training_loss���A�;�$       B+�M	��pfY��A�*

Training_lossu�A�|��$       B+�M	Xs�fY��A�*

Training_loss��}A��_$       B+�M	�!CgY��A�*

Training_loss`�0BG�Tu$       B+�M	��gY��A�*

Training_loss}A�Ap�o�$       B+�M	�FFhY��A�*

Training_loss�+�A�S$       B+�M	YQ�hY��A�*

Training_lossl��A8A6�$       B+�M	�DiY��A�*

Training_lossȔ�AA�|$       B+�M	t�iY��A�*

Training_loss)G�A��$       B+�M	�5jY��A�*

Training_loss#C�A���7$       B+�M	T7rjY��A�*

Training_lossī�A�R$       B+�M	���jY��A�*

Training_lossp��A���$       B+�M	l[6kY��A�*

Training_loss��AW]�$       B+�M	ϒkY��A�*

Training_loss�2Bo��M$       B+�M	�N�kY��A�*

Training_loss���A��(�$       B+�M	p
LlY��A�*

Training_loss�1�AE���$       B+�M	B!�lY��A�*

Training_loss�0B��$       B+�M	�6mY��A�*

Training_loss֛�A����$       B+�M	�mmY��A�*

Training_loss2��A�� �$       B+�M	m��mY��A�*

Training_loss�B��V$       B+�M	7�'nY��A�*

Training_lossRBs?X$       B+�M	H�nY��A�*

Training_loss��A���$       B+�M	ʤ�nY��A�*

Training_loss�5�A��C%$       B+�M	�#koY��A�*

Training_loss�}�A��$       B+�M	�N�oY��A�*

Training_loss:��A���+$       B+�M	-0pY��A�*

Training_loss�o�Ao�P$       B+�M	֩�pY��A�*

Training_loss���A����$       B+�M	 r�pY��A�*

Training_lossƺB���s$       B+�M	�PqY��A�*

Training_lossG�B��)$       B+�M	�u�qY��A�*

Training_loss
D�A��$       B+�M	�YrY��A�*

Training_loss{�Bzv�f$       B+�M	��vrY��A�*

Training_loss*��A$�iS$       B+�M	%��rY��A�*

Training_loss���AQŚ�*       ����	4+�sY��A�*

Validation_accuracy��P?#���&       sO� 	�.�sY��A�*

Validation_loss��:B��"�$       B+�M	'l"wY��A�*

Training_lossx*Bؠ>�$       B+�M	�k�wY��A�*

Training_loss�&�A����$       B+�M	9	xY��A�*

Training_lossxA���u$       B+�M	�xY��A�*

Training_loss��BV���$       B+�M	1��xY��A�*

Training_lossb��Ag��z$       B+�M	OpyY��A�*

Training_lossr<�A�
N=$       B+�M	���yY��A�*

Training_loss���A�+�$       B+�M	�0hzY��A�*

Training_loss�b�A���$       B+�M	r��zY��A�*

Training_loss�o�A����$       B+�M	��*{Y��A�*

Training_loss���A���$       B+�M	���{Y��A�*

Training_lossB�B}5�]$       B+�M	${
|Y��A�*

Training_loss�|�A�3��$       B+�M	�||Y��A�*

Training_loss,S�Az/��$       B+�M	jN�|Y��A�*

Training_loss
��At�D$       B+�M	o^}Y��A�*

Training_lossz��A��'$       B+�M	p��}Y��A�*

Training_loss���A�<��$       B+�M	�,:~Y��A�*

Training_loss�%�A���`$       B+�M	j4�~Y��A�*

Training_loss=?�A��$       B+�M	K�Y��A�*

Training_loss�M�A���D$       B+�M	NaxY��A�*

Training_lossK�A$��$       B+�M	L�Y��A�*

Training_loss�HB�g�U$       B+�M	��@�Y��A�*

Training_loss��A'mԿ$       B+�M	ˠ�Y��A�*

Training_loss��BR���$       B+�M	z� �Y��A�*

Training_loss�#B��>$$       B+�M	��_�Y��A�*

Training_lossD��Au��e$       B+�M	�@��Y��A�*

Training_loss���A�W��$       B+�M	g{�Y��A�*

Training_loss�B2�z$       B+�M	�P�Y��A�*

Training_lossÔB7UW$       B+�M	�}��Y��A�*

Training_loss�Q�ASΰ�$       B+�M		R@�Y��A�*

Training_lossy�A�r?�$       B+�M	����Y��A�*

Training_lossfG�A�$       B+�M	�' �Y��A�*

Training_loss�<�A�׽�$       B+�M	r�]�Y��A�*

Training_loss��A���$       B+�M	Q�ǄY��A�*

Training_loss(V�A>@c�$       B+�M	v(�Y��A�*

Training_loss�r�A<rMO$       B+�M	B?��Y��A�*

Training_loss� �A�X��$       B+�M	AJ��Y��A�*

Training_loss~B}��n$       B+�M	w�T�Y��A�*

Training_loss&�B�<��$       B+�M	M���Y��A�*

Training_loss9~�A�ƥ1$       B+�M	�B#�Y��A�*

Training_loss�ܻA`���$       B+�M	����Y��A�*

Training_loss��B�;��$       B+�M	�g݇Y��A�*

Training_lossj��A�0��$       B+�M	�:�Y��A�*

Training_loss�'�A�چ�$       B+�M	A�Y��A�*

Training_loss��A	�д$       B+�M	+���Y��A�*

Training_lossf��A�'�$       B+�M	T�Y��A�*

Training_lossr��A����$       B+�M	I*��Y��A�*

Training_loss��B5��)$       B+�M	�*�Y��A�*

Training_loss�<'B�i��$       B+�M	��i�Y��A�*

Training_loss2F�A%\n�$       B+�M	b�ɊY��A�*

Training_lossT��A!Kl]*       ����	�[��Y��A�*

Validation_accuracyMMQ?�a��&       sO� 	�^��Y��A�*

Validation_loss9�;B�ϵ�$       B+�M	H�d�Y��A�*

Training_loss*Q�A؅^�$       B+�M	��ÎY��A�*

Training_loss��A��C1$       B+�M	��'�Y��A�*

Training_loss�3B�Tq%$       B+�M	���Y��A�*

Training_loss�X�A�d$       B+�M	�n�Y��A�*

Training_lossN��A}��$       B+�M	(�E�Y��A�*

Training_loss�	�AyI�	$       B+�M	F��Y��A�*

Training_loss�j�AoBy$       B+�M	<�Y��A�*

Training_lossؽ�AHc��$       B+�M	{v�Y��A�*

Training_loss�U�A�}$       B+�M	?�ۑY��A�*

Training_lossz�B��FR$       B+�M	�=�Y��A�*

Training_loss>��A|.$       B+�M	ܽ��Y��A�*

Training_loss�B1:4"$       B+�M	����Y��A�*

Training_loss3�A�,��$       B+�M	�x_�Y��A�*

Training_loss���A�q�8$       B+�M	=�ēY��A�*

Training_loss��A�.Re$       B+�M	��'�Y��A�*

Training_loss�BL���$       B+�M	����Y��A�*

Training_loss��A�G�$       B+�M	���Y��A�*

Training_loss�~Bp�}�$       B+�M	��V�Y��A�*

Training_loss��A&�U'$       B+�M	&��Y��A�*

Training_lossL8B;�"�$       B+�M	�0$�Y��A�*

Training_loss�"�Ay�*�$       B+�M	Ψ��Y��A�*

Training_loss.ڈA�a�$       B+�M	����Y��A�*

Training_loss���AZ�L�$       B+�M	�'>�Y��A�*

Training_loss�;�A2��$       B+�M	����Y��A�*

Training_loss��A��E$       B+�M	��Y��A�*

Training_lossޗ�Aqna$       B+�M	�n�Y��A�*

Training_loss��A�0d$       B+�M	� ϘY��A�*

Training_loss`U�A'$       B+�M	UO,�Y��A�*

Training_loss�-B��#P$       B+�M	�o��Y��A�*

Training_loss�V�A�P�+$       B+�M	��Y��A�*

Training_loss���A�l�$       B+�M	�T�Y��A�*

Training_loss�b�A����$       B+�M	�"��Y��A�*

Training_loss� Bü@�$       B+�M	��Y��A�*

Training_loss2��Aqt�$       B+�M	����Y��A�*

Training_loss�{
B����$       B+�M	
��Y��A�*

Training_loss��AK�Mm$       B+�M	�>D�Y��A�*

Training_loss��A�N�$       B+�M	���Y��A�*

Training_lossmG�A��Y$       B+�M	�m�Y��A�*

Training_loss��	BY⃉$       B+�M	1��Y��A�*

Training_loss�JBɡx$       B+�M	y�ߝY��A�*

Training_loss��Al�ñ$       B+�M	�?�Y��A�*

Training_loss�B	��$       B+�M	@��Y��A�*

Training_loss�٤A <h$       B+�M	:���Y��A�*

Training_lossӟ:B���Z$       B+�M	��g�Y��A�*

Training_loss"��Af�[�$       B+�M	��˟Y��A� *

Training_loss*W�A�kz�$       B+�M	��.�Y��A� *

Training_loss�B��.�$       B+�M	�%��Y��A� *

Training_loss���A�C*$       B+�M	�l��Y��A� *

Training_loss���A(g $       B+�M	�fQ�Y��A� *

Training_loss��A8=4*       ����	S��Y��A� *

Validation_accuracyMMR?0�_J&       sO� 	p��Y��A� *

Validation_loss{X9B=c�S$       B+�M	+�Y��A� *

Training_lossp�A� b$       B+�M	wN��Y��A� *

Training_loss$�A����$       B+�M	���Y��A� *

Training_loss�,�A6��$       B+�M	�RJ�Y��A� *

Training_loss
s BS�%�$       B+�M	����Y��A� *

Training_loss�BW�y!$       B+�M	�D�Y��A� *

Training_lossn��A��c$       B+�M	qT��Y��A� *

Training_loss�Q�A�kR$       B+�M	�Q�Y��A� *

Training_loss���A6#$       B+�M	Ό��Y��A� *

Training_loss A�An��W$       B+�M	��Y��A� *

Training_loss�N�A��`$       B+�M	t���Y��A� *

Training_loss�/�AX��s$       B+�M	f��Y��A� *

Training_loss?�At��1$       B+�M	�Q��Y��A� *

Training_loss�3�Az���$       B+�M	���Y��A� *

Training_loss'm�A�c��$       B+�M	�^��Y��A� *

Training_loss	mB��Y$       B+�M	p��Y��A� *

Training_lossT��An��9$       B+�M	X�q�Y��A� *

Training_loss�A�|�$       B+�M	�M�Y��A� *

Training_lossP�B\���$       B+�M	�X�Y��A� *

Training_lossh��A=��$       B+�M	�9ʭY��A� *

Training_lossb	�A�$       B+�M	�:�Y��A� *

Training_lossu��A�%$       B+�M	'���Y��A� *

Training_loss���A5!��$       B+�M	��4�Y��A� *

Training_loss:��A��n&$       B+�M	�.��Y��A� *

Training_loss�.�Afx�^$       B+�M	W�	�Y��A� *

Training_loss8� B��1$       B+�M	eTl�Y��A� *

Training_loss�S�A��$       B+�M	�ΰY��A� *

Training_loss,g�A޻\�$       B+�M	�n8�Y��A� *

Training_loss�!B*�w�$       B+�M	j��Y��A� *

Training_loss�hBB��^$       B+�M	l
��Y��A� *

Training_loss�:*B7��$       B+�M	�/b�Y��A� *

Training_loss�=�A�".$       B+�M	q�ӲY��A� *

Training_loss�bB��Ȍ$       B+�M	_'Z�Y��A� *

Training_losst��A���l$       B+�M	T�ȳY��A� *

Training_loss\GBe[�r$       B+�M	�a,�Y��A� *

Training_loss�B9e$       B+�M	�Ǔ�Y��A� *

Training_loss��A׆[�$       B+�M	0�Y��A� *

Training_lossc.�A0s$       B+�M	�8W�Y��A� *

Training_loss�B��̷$       B+�M	I��Y��A� *

Training_loss���A�LG8$       B+�M	��Y��A� *

Training_loss>�A���$       B+�M	��u�Y��A� *

Training_loss�R�ABH�s$       B+�M	��ֶY��A� *

Training_loss�}�A�Ѩ�$       B+�M	h8�Y��A� *

Training_loss?ƹA��$       B+�M	;8��Y��A� *

Training_lossC�A�(�_$       B+�M	���Y��A� *

Training_loss�R�A��DK$       B+�M	��Z�Y��A� *

Training_loss�J�Ae���$       B+�M	ǟ��Y��A� *

Training_lossm)B���P$       B+�M	��Y��A� *

Training_lossU	�Ak���$       B+�M	����Y��A� *

Training_loss&��A�X�a$       B+�M	 ��Y��A� *

Training_losspYB�{�*       ����	nֺY��A� *

Validation_accuracy��R?���&       sO� 	ֺY��A� *

Validation_loss��8B��k$       B+�M	��8�Y��A� *

Training_lossG�<B9mݰ$       B+�M	t$��Y��A� *

Training_loss��A�~p�$       B+�M	����Y��A� *

Training_lossc�AA߄$       B+�M	�lW�Y��A� *

Training_lossBkB��E$       B+�M	�E��Y��A� *

Training_loss|_B���D$       B+�M	i��Y��A� *

Training_loss�ҭA���N$       B+�M	eos�Y��A� *

Training_lossl��A�fd$       B+�M	����Y��A� *

Training_loss���A�U<m$       B+�M	�b-�Y��A� *

Training_lossq B�˖�$       B+�M	�@��Y��A� *

Training_lossp7 B��ג$       B+�M	O��Y��A� *

Training_loss��A��,$       B+�M	��F�Y��A� *

Training_loss3B�Pb$       B+�M	G��Y��A� *

Training_loss�
�A��N�$       B+�M	��Y��A� *

Training_loss�7�A&>�$       B+�M	��b�Y��A� *

Training_lossԽ�A�4$       B+�M	r��Y��A� *

Training_lossRYBZ�J$       B+�M	$B0�Y��A� *

Training_loss:�AU�-$       B+�M	9��Y��A� *

Training_lossB<�AL �$       B+�M	���Y��A� *

Training_loss���A��Y�$       B+�M	�`�Y��A� *

Training_loss���A؆D�$       B+�M	���Y��A� *

Training_lossΆ�Am��$       B+�M	/i'�Y��A� *

Training_loss�TB7n�$       B+�M	�Q��Y��A� *

Training_loss�J�A�͒|$       B+�M	U/��Y��A� *

Training_lossb1B1�h�$       B+�M	�H�Y��A� *

Training_loss'�ACrrW$       B+�M	�ʧ�Y��A� *

Training_loss��Ar*�$       B+�M	��
�Y��A� *

Training_lossY��A*7�$       B+�M	�k�Y��A� *

Training_losso�A��.w$       B+�M	�r��Y��A� *

Training_loss���A��PY$       B+�M	�D+�Y��A� *

Training_loss��A�}�$       B+�M	�Ռ�Y��A� *

Training_lossj��A��I�$       B+�M	2W��Y��A� *

Training_loss�*
Bg�$       B+�M	�V�Y��A� *

Training_lossT� B2f��$       B+�M	Rc��Y��A� *

Training_lossй�A�Ò�$       B+�M	�;'�Y��A� *

Training_loss�Bk��$       B+�M	p���Y��A� *

Training_loss���An��$       B+�M	H��Y��A� *

Training_loss��A��g�$       B+�M	�`t�Y��A� *

Training_loss߂�A���$       B+�M	�7��Y��A� *

Training_loss�(�A��w�$       B+�M	o�2�Y��A� *

Training_lossO�A�ކ�$       B+�M	�0��Y��A� *

Training_lossb��Ai[�;$       B+�M	?��Y��A� *

Training_loss��A�<$       B+�M	|�Y��A� *

Training_loss釷A[?�/$       B+�M	�v��Y��A� *

Training_loss:9�A�%��$       B+�M	��p�Y��A� *

Training_loss͜�Ak��$       B+�M	� ��Y��A� *

Training_loss�%�A4Rͪ$       B+�M	��[�Y��A� *

Training_loss� �A��#$       B+�M	����Y��A� *

Training_loss(�B(}}!$       B+�M	�*E�Y��A� *

Training_loss�f�A��ޫ$       B+�M	O��Y��A� *

Training_loss7��Af-�(*       ����	s��Y��A� *

Validation_accuracyMMQ?�r��&       sO� 	#��Y��A� *

Validation_loss9Bm�$       B+�M	1^u�Y��A� *

Training_lossO�A!Ò�$       B+�M	/P��Y��A� *

Training_loss���A3~�
$       B+�M	1}/�Y��A� *

Training_loss��
B�ć$       B+�M	˹��Y��A� *

Training_loss<6�A{�ݻ$       B+�M	����Y��A� *

Training_lossb��A!6�$       B+�M	�G�Y��A� *

Training_loss/w�A6���$       B+�M	�ؤ�Y��A� *

Training_loss]��A�Q$       B+�M	�"�Y��A� *

Training_loss��B#��$       B+�M	��a�Y��A� *

Training_lossK��As��W$       B+�M	���Y��A� *

Training_lossK�Bj�Ef$       B+�M	ɑ�Y��A� *

Training_loss���A�AH$       B+�M	5�}�Y��A� *

Training_loss�X�AP�$       B+�M	���Y��A� *

Training_lossJ�Aڳ�$       B+�M	�CJ�Y��A� *

Training_loss���A&��>$       B+�M	j��Y��A� *

Training_loss��A�.�W$       B+�M	r��Y��A� *

Training_loss��Aj��*$       B+�M	��f�Y��A� *

Training_loss~��AG�2�$       B+�M	�*��Y��A� *

Training_loss�m�A���$       B+�M	VI/�Y��A� *

Training_loss���AL�i�$       B+�M	���Y��A� *

Training_loss/YB9��$       B+�M	_���Y��A� *

Training_loss�b�A���$       B+�M	Y�L�Y��A� *

Training_loss�Bb��$       B+�M	�J��Y��A� *

Training_loss6�A#̈$       B+�M	)u�Y��A�!*

Training_lossB�ѝj$       B+�M	�5p�Y��A�!*

Training_lossE�BBi��$       B+�M	�=��Y��A�!*

Training_lossX��A/UiL$       B+�M	��*�Y��A�!*

Training_lossqv�AQy�$       B+�M	���Y��A�!*

Training_lossK��A�Ja�$       B+�M	b��Y��A�!*

Training_loss?n�AX��r$       B+�M	��G�Y��A�!*

Training_loss�AӞ�+$       B+�M	����Y��A�!*

Training_losst��A{��/$       B+�M	zU�Y��A�!*

Training_loss�uB��.$       B+�M	a�u�Y��A�!*

Training_loss��A5�8$       B+�M	~:��Y��A�!*

Training_loss���A�,u$       B+�M	CV��Y��A�!*

Training_loss8�AԊS&$       B+�M	�@1�Y��A�!*

Training_loss5^�A���$       B+�M	�=��Y��A�!*

Training_loss��A��~W$       B+�M		��Y��A�!*

Training_loss�1B=[t$       B+�M	�4��Y��A�!*

Training_loss�+�A,Q�!$       B+�M	��Y��A�!*

Training_loss��A�J�$       B+�M	���Y��A�!*

Training_loss���A�{��$       B+�M	�c��Y��A�!*

Training_loss���A�Ѧ�$       B+�M	�\O�Y��A�!*

Training_lossR�A�(FU$       B+�M	����Y��A�!*

Training_loss��}A�,ڍ$       B+�M	q��Y��A�!*

Training_loss|gBW}�$       B+�M	9br�Y��A�!*

Training_loss�}�A����$       B+�M	߇��Y��A�!*

Training_loss� �Aa5�$       B+�M	T]�Y��A�!*

Training_loss��A��J�$       B+�M	���Y��A�!*

Training_loss���A6g�$       B+�M	�IL�Y��A�!*

Training_loss.R�A�3�*       ����	�M�Y��A�!*

Validation_accuracy��S?K!�g&       sO� 	�M�Y��A�!*

Validation_lossk�7B\Su�$       B+�M	k���Y��A�!*

Training_loss���A2���$       B+�M	�59�Y��A�!*

Training_loss��A	
�$       B+�M	���Y��A�!*

Training_loss�V�AiZ�$       B+�M	]���Y��A�!*

Training_loss垰A��~ $       B+�M	<S�Y��A�!*

Training_loss�Y�A��}($       B+�M	Mܰ�Y��A�!*

Training_lossִ�AOa�;$       B+�M	��#�Y��A�!*

Training_loss�Bh�>�$       B+�M	|}��Y��A�!*

Training_loss8�AHzV$       B+�M	,G�Y��A�!*

Training_lossB��ALR�"$       B+�M	�X��Y��A�!*

Training_loss�D�A���$       B+�M	�?��Y��A�!*

Training_lossx��A��/$       B+�M	T�x�Y��A�!*

Training_loss��A�F�K$       B+�M	� ��Y��A�!*

Training_loss���AP?�$       B+�M	��O�Y��A�!*

Training_loss"�Bk�Bc$       B+�M	����Y��A�!*

Training_loss�߶A!DK$       B+�M	j�
�Y��A�!*

Training_loss�W�Ah_P�$       B+�M	�g�Y��A�!*

Training_loss� B_p�$       B+�M	����Y��A�!*

Training_loss�,�A�
�$       B+�M	��#�Y��A�!*

Training_lossB�A�\�%$       B+�M	�R��Y��A�!*

Training_loss^�B��@$       B+�M	���Y��A�!*

Training_loss�.�A���$       B+�M	+NA�Y��A�!*

Training_loss4"B�j��$       B+�M	����Y��A�!*

Training_lossg�A/$       B+�M	����Y��A�!*

Training_lossV^�A �8$       B+�M	Q�W�Y��A�!*

Training_lossD��Az'��$       B+�M	���Y��A�!*

Training_lossB��$       B+�M	z��Y��A�!*

Training_loss�ɄAgɎ�$       B+�M	��m�Y��A�!*

Training_lossT��A�6�X$       B+�M	����Y��A�!*

Training_loss�u�A�-��$       B+�M	Mh'�Y��A�!*

Training_loss:T�A#�:�$       B+�M	�r��Y��A�!*

Training_loss�*�A�O��$       B+�M	g���Y��A�!*

Training_loss�<B>�K$       B+�M	�=�Y��A�!*

Training_lossz�Adn
�$       B+�M	o���Y��A�!*

Training_lossJi�A���F$       B+�M	�l��Y��A�!*

Training_loss*��AsVK�$       B+�M	uU�Y��A�!*

Training_loss(�AxS[$       B+�M	�ٴ�Y��A�!*

Training_loss�~B���$       B+�M	��Y��A�!*

Training_lossC8�Ax�N$       B+�M	�!q�Y��A�!*

Training_loss�ЊA�G_?$       B+�M	{���Y��A�!*

Training_loss
��A���d$       B+�M	�3�Y��A�!*

Training_loss�2B�[�<$       B+�M	���Y��A�!*

Training_loss�B�A��\$       B+�M	�/��Y��A�!*

Training_loss#�A��$       B+�M	�W�Y��A�!*

Training_loss�A�H��$       B+�M	CW��Y��A�!*

Training_lossw�A��($       B+�M	�Y��A�!*

Training_loss>٘A)l�$       B+�M	�K}�Y��A�!*

Training_loss�Bl��T$       B+�M	����Y��A�!*

Training_loss,P�A��q�$       B+�M	��6 Z��A�!*

Training_loss�B����$       B+�M	��� Z��A�!*

Training_loss2g�A�#a�*       ����	d�mZ��A�!*

Validation_accuracy��Q?��N&       sO� 	��mZ��A�!*

Validation_loss�(:B4�>�$       B+�M	*�MZ��A�!*

Training_loss"ɾA��$       B+�M	{�Z��A�!*

Training_loss�m�A-�3�$       B+�M	�Z��A�!*

Training_loss�ӹA�ҵ�$       B+�M	��rZ��A�!*

Training_lossLHB�/�$       B+�M	8��Z��A�!*

Training_loss���A<���$       B+�M	L7Z��A�!*

Training_loss��
BIӁ�$       B+�M	�e�Z��A�!*

Training_lossb�A�� $       B+�M	 Z��A�!*

Training_loss��A��\$       B+�M	��zZ��A�!*

Training_loss�3�A(��a$       B+�M	�{�Z��A�!*

Training_loss��Akg�|$       B+�M	�[:Z��A�!*

Training_loss�m�A>95$       B+�M	G8�Z��A�!*

Training_loss�' B�$       B+�M	��Z��A�!*

Training_loss
@�AX�\�$       B+�M	VET	Z��A�!*

Training_loss���A���i$       B+�M	?Ĳ	Z��A�!*

Training_loss�/�A�w�$       B+�M	�J
Z��A�!*

Training_loss3#�A�pY$       B+�M	�gq
Z��A�!*

Training_loss��A���]$       B+�M	*�
Z��A�!*

Training_loss*Q�Ae�}�$       B+�M	��5Z��A�!*

Training_loss8�A���$       B+�M	��Z��A�!*

Training_loss;&�A�$       B+�M	F��Z��A�!*

Training_loss�U�A���j$       B+�M	�;[Z��A�!*

Training_loss���A��$       B+�M	5]�Z��A�!*

Training_loss��B��#$       B+�M	��Z��A�!*

Training_loss�l�Aܼ�z$       B+�M		�vZ��A�!*

Training_loss`��A<"ߨ$       B+�M	�c�Z��A�!*

Training_loss��B~줎$       B+�M		:Z��A�!*

Training_lossl��A�G+�$       B+�M	���Z��A�!*

Training_loss�r�A/�w$       B+�M	*��Z��A�!*

Training_lossA�A�gk�$       B+�M	�mZZ��A�!*

Training_loss�;�A0�1�$       B+�M	9)�Z��A�!*

Training_loss�X�A�ʅ$       B+�M	��Z��A�!*

Training_loss� �A��6$       B+�M	O{Z��A�!*

Training_lossV�A�_��$       B+�M	�^�Z��A�!*

Training_loss���AM $       B+�M	 W:Z��A�!*

Training_loss���A[�Z�$       B+�M	���Z��A�!*

Training_loss��AB���$       B+�M	� �Z��A�!*

Training_loss���AZ��$       B+�M	��ZZ��A�!*

Training_loss<�Blf$       B+�M	`�Z��A�!*

Training_loss�M�A}iJ�$       B+�M	��Z��A�!*

Training_loss�	�A�	D$       B+�M	���Z��A�!*

Training_lossX��A�k b$       B+�M	���Z��A�!*

Training_loss ^B����$       B+�M	�DzZ��A�!*

Training_loss⊥Agx-b$       B+�M	��Z��A�!*

Training_loss
~
Bͻ��$       B+�M	��pZ��A�!*

Training_lossP=tAPL�$       B+�M	�`�Z��A�!*

Training_loss���A�K�$       B+�M	d�[Z��A�!*

Training_lossY~BpqW�$       B+�M	���Z��A�!*

Training_loss��AB"��$       B+�M	\uPZ��A�!*

Training_lossJ��A���$       B+�M	N)�Z��A�!*

Training_loss���A�,�*       ����	��Z��A�!*

Validation_accuracyMMR?���C&       sO� 	���Z��A�!*

Validation_loss�39B�u�$       B+�M	jk$Z��A�!*

Training_loss�
�A�t!�$       B+�M	Z/�Z��A�"*

Training_loss?VeA��$       B+�M	`�Z��A�"*

Training_loss���AU)�.$       B+�M	e�FZ��A�"*

Training_loss���AJ\�v$       B+�M	f2�Z��A�"*

Training_lossb��A���$       B+�M	L�Z��A�"*

Training_loss6��A��C�$       B+�M	fJbZ��A�"*

Training_loss��A{.4$       B+�M	1�Z��A�"*

Training_loss�%�Ab�$       B+�M	sH"Z��A�"*

Training_loss���AU���$       B+�M	�ՀZ��A�"*

Training_loss7�A�=u$       B+�M	��Z��A�"*

Training_loss���A�fg�$       B+�M	��= Z��A�"*

Training_lossh<�A�� $       B+�M	�� Z��A�"*

Training_lossv�Ah�*$       B+�M	}� !Z��A�"*

Training_loss#
�AW�w$       B+�M	�gc!Z��A�"*

Training_loss{��A�f�$       B+�M	VF�!Z��A�"*

Training_loss��B�1}$       B+�M	��$"Z��A�"*

Training_loss+��A'���$       B+�M	���"Z��A�"*

Training_loss�A�v�C$       B+�M	�>�"Z��A�"*

Training_loss=��A{��$       B+�M	�S#Z��A�"*

Training_loss
�B��)$       B+�M	5^�#Z��A�"*

Training_loss5L�As�W�$       B+�M	])$Z��A�"*

Training_lossQ2�Ax{�Y$       B+�M	��$Z��A�"*

Training_loss]�A���$       B+�M	�N�$Z��A�"*

Training_loss%7�A�Ⱦ�$       B+�M	�LZ%Z��A�"*

Training_loss���A?��$       B+�M	���%Z��A�"*

Training_lossz��Ae:7�$       B+�M	��/&Z��A�"*

Training_loss�7�A�G��$       B+�M	�h�&Z��A�"*

Training_lossAB�{�/$       B+�M	�''Z��A�"*

Training_lossP]B U�H$       B+�M	Ͱ�'Z��A�"*

Training_loss�A4>�T$       B+�M	�"(Z��A�"*

Training_loss�ƶAX2�$       B+�M	iƓ(Z��A�"*

Training_loss��AʖSI$       B+�M	F�)Z��A�"*

Training_lossz�A�S��$       B+�M	T�z)Z��A�"*

Training_lossdB�AM�4�$       B+�M	M�)Z��A�"*

Training_lossA(uk$       B+�M	~�6*Z��A�"*

Training_loss"<�AL�~R$       B+�M	�8�*Z��A�"*

Training_loss���A����$       B+�M	�r�*Z��A�"*

Training_loss
R�A���$       B+�M	njW+Z��A�"*

Training_loss�r�A��SB$       B+�M	OW�+Z��A�"*

Training_lossO�A��$       B+�M	��,Z��A�"*

Training_loss��A$���$       B+�M	s�y,Z��A�"*

Training_losst�A ̊ $       B+�M	��,Z��A�"*

Training_loss�	B��qn$       B+�M	%�=-Z��A�"*

Training_lossYC�A|5��$       B+�M	� �-Z��A�"*

Training_loss�B�gR�$       B+�M	ō.Z��A�"*

Training_lossDg�AhB�$       B+�M	6ˍ.Z��A�"*

Training_lossX��A��t$       B+�M	Y� /Z��A�"*

Training_loss�h�A�v��$       B+�M	x�}/Z��A�"*

Training_lossx�Am]8&$       B+�M	�"�/Z��A�"*

Training_lossN�B����*       ����	K��0Z��A�"*

Validation_accuracyMMQ?�/�c&       sO� 	ͭ�0Z��A�"*

Validation_loss�)<BQ˝<$       B+�M	�,�3Z��A�"*

Training_lossg�A��J$       B+�M	~�4Z��A�"*

Training_loss���A�M�!$       B+�M	�lf4Z��A�"*

Training_lossb��A��߶$       B+�M	�k�4Z��A�"*

Training_loss�v�A���C$       B+�M	`#'5Z��A�"*

Training_lossG�AH;�$       B+�M	*��5Z��A�"*

Training_lossl��Ac�z�$       B+�M	���5Z��A�"*

Training_lossH��A=G�$       B+�M	��=6Z��A�"*

Training_loss�c�A�;�$       B+�M	��6Z��A�"*

Training_loss�^A��L�$       B+�M	���6Z��A�"*

Training_loss��A轪%$       B+�M	F�\7Z��A�"*

Training_loss:z�AӒq$       B+�M	�g�7Z��A�"*

Training_loss?�A:S$       B+�M	<�8Z��A�"*

Training_loss��A4��:$       B+�M	N�{8Z��A�"*

Training_loss��A��,M$       B+�M	���8Z��A�"*

Training_lossh��AH��B$       B+�M	`�69Z��A�"*

Training_lossl}�A
�$       B+�M	N^�9Z��A�"*

Training_loss/��A��$       B+�M	SY�9Z��A�"*

Training_loss.�:Bf���$       B+�M	>�X:Z��A�"*

Training_loss~��A��$       B+�M	I��:Z��A�"*

Training_loss�@�AR��x$       B+�M	�M;Z��A�"*

Training_loss�ڪA��a�$       B+�M	c�s;Z��A�"*

Training_losst��A�FS�$       B+�M	3��;Z��A�"*

Training_loss���AhX�$       B+�M	YP.<Z��A�"*

Training_loss +�Av3��$       B+�M	�.�<Z��A�"*

Training_loss���A���:$       B+�M	���<Z��A�"*

Training_loss��A�ŉ�$       B+�M	�J=Z��A�"*

Training_lossc3�Aj��i$       B+�M	��=Z��A�"*

Training_loss<��Az�C�$       B+�M	r�	>Z��A�"*

Training_loss�A�Y@$       B+�M	r�k>Z��A�"*

Training_loss'�AT�,$       B+�M	���>Z��A�"*

Training_loss��A!d��$       B+�M	'//?Z��A�"*

Training_loss\ �A�8$       B+�M	죒?Z��A�"*

Training_lossUy�A��G
$       B+�M	�L�?Z��A�"*

Training_loss�(�AfdN�$       B+�M	 �P@Z��A�"*

Training_loss}��A��!$       B+�M	�կ@Z��A�"*

Training_loss�2�A�z$       B+�M	�6AZ��A�"*

Training_lossT7�A5|��$       B+�M	>�rAZ��A�"*

Training_lossc0�A�vk$       B+�M	���AZ��A�"*

Training_loss9��A�_6�$       B+�M	o~8BZ��A�"*

Training_lossƷ�Aբ�$       B+�M	��BZ��A�"*

Training_loss���A�sM$       B+�M		�BZ��A�"*

Training_loss���A� m3$       B+�M		STCZ��A�"*

Training_loss��A�l�Z$       B+�M	ḆCZ��A�"*

Training_loss���A�� +$       B+�M	I�DZ��A�"*

Training_loss��A](�=$       B+�M	nqDZ��A�"*

Training_loss�z�A���$       B+�M	��DZ��A�"*

Training_loss.[vAj�N�$       B+�M	��*EZ��A�"*

Training_loss��Aq��$       B+�M	DP�EZ��A�"*

Training_lossG�A��E $       B+�M	2��EZ��A�"*

Training_loss˓�A��:e*       ����	¾�FZ��A�"*

Validation_accuracy��R?�=�Q&       sO� 	«FZ��A�"*

Validation_loss��8BT*�"$       B+�M	p?�IZ��A�"*

Training_loss��A�+$       B+�M	75JZ��A�"*

Training_lossr�AB�x�$       B+�M	J'�JZ��A�"*

Training_loss��
B�3�$       B+�M	80�JZ��A�"*

Training_loss��A��f�$       B+�M	��XKZ��A�"*

Training_lossm8�A��$       B+�M	��KZ��A�"*

Training_loss���A��$�$       B+�M	�LZ��A�"*

Training_lossF7�Alʌ=$       B+�M	�~LZ��A�"*

Training_loss�{�A��ub$       B+�M	8��LZ��A�"*

Training_loss ?�Ay?�$       B+�M	��;MZ��A�"*

Training_loss(��A�2�M$       B+�M	`x�MZ��A�"*

Training_loss�L�AgP�$       B+�M	\UNZ��A�"*

Training_lossv	�A%�$       B+�M	�dNZ��A�"*

Training_loss<?�Aƶ�$       B+�M	�p�NZ��A�"*

Training_lossF$�AB/:�$       B+�M	׆#OZ��A�"*

Training_lossr#�A�J��$       B+�M	�y�OZ��A�"*

Training_loss�d�A�c9I$       B+�M	%��OZ��A�"*

Training_loss���A�H,�$       B+�M	\JPZ��A�"*

Training_loss��A4�[�$       B+�M	�k�PZ��A�"*

Training_loss�+�Aα�r$       B+�M	>�QZ��A�"*

Training_lossvT�AR�$�$       B+�M	��oQZ��A�"*

Training_loss��Abp��$       B+�M	be�QZ��A�"*

Training_losst�A}�$       B+�M	dy.RZ��A�"*

Training_lossA�Aw3�$       B+�M	��RZ��A�"*

Training_loss$�A^��$       B+�M	��RZ��A�"*

Training_lossUg�A���$       B+�M	�TSZ��A�"*

Training_lossD�A�vp$       B+�M	���SZ��A�"*

Training_loss:� B��w�$       B+�M	TTZ��A�"*

Training_loss�o�A!�	�$       B+�M	i�yTZ��A�"*

Training_lossz�Ax�O�$       B+�M	%�TZ��A�#*

Training_loss+�A����$       B+�M	�9UZ��A�#*

Training_lossz��A4�u�$       B+�M	zT�UZ��A�#*

Training_loss��A_�$       B+�M	WVZ��A�#*

Training_loss���AP!YS$       B+�M	��hVZ��A�#*

Training_loss�?�Ao�g$       B+�M	���VZ��A�#*

Training_lossDBt��@$       B+�M	!x*WZ��A�#*

Training_lossXY�A�O8$       B+�M	��WZ��A�#*

Training_loss�� B�M-�$       B+�M	��WZ��A�#*

Training_loss8��A����$       B+�M	]cXZ��A�#*

Training_loss�C�A�qW�$       B+�M	���XZ��A�#*

Training_loss���AS�}�$       B+�M	��,YZ��A�#*

Training_loss��A��l�$       B+�M	��YZ��A�#*

Training_lossŎ�A�m�@$       B+�M	�B�YZ��A�#*

Training_lossPZ�A'&�$       B+�M	��oZZ��A�#*

Training_lossN:B+�n�$       B+�M	0*�ZZ��A�#*

Training_loss\�A���w$       B+�M	 �6[Z��A�#*

Training_lossP��As�l�$       B+�M	��[Z��A�#*

Training_loss��A�Г�$       B+�M	��[Z��A�#*

Training_loss(��A��4�$       B+�M	D�o\Z��A�#*

Training_loss&��A��4$       B+�M	3�\Z��A�#*

Training_loss�9�AJ�d�*       ����	�q�]Z��A�#*

Validation_accuracy��R?ma�x&       sO� 	�s�]Z��A�#*

Validation_loss��8B��$       B+�M	�߫`Z��A�#*

Training_lossFbB����$       B+�M	�aZ��A�#*

Training_loss���A_� $       B+�M	saZ��A�#*

Training_loss���A��q�$       B+�M	t��aZ��A�#*

Training_loss��A��v$       B+�M	O9bZ��A�#*

Training_lossқ�A׻�$       B+�M	<��bZ��A�#*

Training_loss�<�A�X��$       B+�M	�JcZ��A�#*

Training_loss���A�6��$       B+�M	_��cZ��A�#*

Training_lossXwBu�%$       B+�M	���cZ��A�#*

Training_loss`��A�k)�$       B+�M	*q[dZ��A�#*

Training_lossz��A�=��$       B+�M	��dZ��A�#*

Training_lossz3�A�-i|$       B+�M	eZ��A�#*

Training_loss��AVع�$       B+�M	�3veZ��A�#*

Training_lossŚ�A��o$       B+�M	*8�eZ��A�#*

Training_loss֐�A]&��$       B+�M	l2fZ��A�#*

Training_loss�^�A$�W�$       B+�M	��fZ��A�#*

Training_loss��A?mm;$       B+�M	�
�fZ��A�#*

Training_loss���A'��$       B+�M	��RgZ��A�#*

Training_loss���A�,c�$       B+�M	k�gZ��A�#*

Training_loss���A��L�$       B+�M	4�hZ��A�#*

Training_loss&~Am:�$       B+�M	�trhZ��A�#*

Training_loss��A����$       B+�M	bf�hZ��A�#*

Training_lossɲ�Ap�Ԏ$       B+�M	�-iZ��A�#*

Training_loss46A��N�$       B+�M	0,�iZ��A�#*

Training_loss��AQ5� $       B+�M	��iZ��A�#*

Training_loss��AF�W$       B+�M	�JjZ��A�#*

Training_lossC�A3�y!$       B+�M	�ޫjZ��A�#*

Training_loss��A	!R�$       B+�M	�ukZ��A�#*

Training_lossV��A���$       B+�M	|�mkZ��A�#*

Training_loss��A�0�$       B+�M	~��kZ��A�#*

Training_loss��A���$       B+�M	��4lZ��A�#*

Training_loss�:�A,�D�$       B+�M	֋�lZ��A�#*

Training_loss)[�AlxX�$       B+�M	u��lZ��A�#*

Training_loss��A��¹$       B+�M	�"_mZ��A�#*

Training_lossdm�A���$       B+�M	 ľmZ��A�#*

Training_loss�ŰA����$       B+�M	+�&nZ��A�#*

Training_loss^��A�3�)$       B+�M	�nZ��A�#*

Training_loss���A�ic�$       B+�M	��nZ��A�#*

Training_loss��A�4I$       B+�M	�'toZ��A�#*

Training_loss�9�A�p�$       B+�M	���oZ��A�#*

Training_loss��AP]$       B+�M	{�kpZ��A�#*

Training_loss�X�A2�z�$       B+�M	T��pZ��A�#*

Training_loss�p�A��~�$       B+�M	��VqZ��A�#*

Training_loss	�A���1$       B+�M	1��qZ��A�#*

Training_loss��rA���B$       B+�M	{-HrZ��A�#*

Training_loss���A�QR$       B+�M	.7�rZ��A�#*

Training_loss�d�A���$       B+�M	�0sZ��A�#*

Training_lossF<�A�I2�$       B+�M	ߧ�sZ��A�#*

Training_loss�A@gE�$       B+�M	.�tZ��A�#*

Training_loss ��AC��s$       B+�M	؍tZ��A�#*

Training_lossS �Ai���*       ����	�ܞuZ��A�#*

Validation_accuracy##R?�vA&       sO� 	&��uZ��A�#*

Validation_lossp�=B �*�$       B+�M	O;�xZ��A�#*

Training_loss~��A}s�3$       B+�M	��<yZ��A�#*

Training_loss��Aж��$       B+�M	��yZ��A�#*

Training_losshY�A�K:$       B+�M	�	zZ��A�#*

Training_loss���Al$       B+�M	E�yzZ��A�#*

Training_loss.�sAT�=$       B+�M	�r�zZ��A�#*

Training_lossIb�A���$       B+�M	�D{Z��A�#*

Training_lossN�A��E�$       B+�M	�|�{Z��A�#*

Training_loss���A�v�$       B+�M	�|Z��A�#*

Training_loss���A/i�B$       B+�M	�|Z��A�#*

Training_loss{��AI�ȩ$       B+�M	҉}Z��A�#*

Training_lossŹA�!��$       B+�M	[w}Z��A�#*

Training_loss��A/�}&$       B+�M	���}Z��A�#*

Training_loss�,�A�כ�$       B+�M	3~Z��A�#*

Training_loss���Aه+$       B+�M	�!�~Z��A�#*

Training_lossH<�AOkl$       B+�M	�wZ��A�#*

Training_loss	��A]���$       B+�M	.WrZ��A�#*

Training_loss�&`A �g�$       B+�M	Ӡ�Z��A�#*

Training_loss<��Aa�
$       B+�M	��5�Z��A�#*

Training_lossb2�A��	$       B+�M	U��Z��A�#*

Training_loss:�AL��T$       B+�M	�0��Z��A�#*

Training_loss}	�A?��$       B+�M	Y�U�Z��A�#*

Training_lossG~�A�t"�$       B+�M	�	��Z��A�#*

Training_lossA��A4AD�$       B+�M	�Z��A�#*

Training_loss?B�S�$       B+�M	P�r�Z��A�#*

Training_lossh��A��y$       B+�M	��ւZ��A�#*

Training_loss�e�A�[Q$       B+�M	͕:�Z��A�#*

Training_loss�A�A1�$       B+�M	����Z��A�#*

Training_loss{��A��]j$       B+�M	� �Z��A�#*

Training_loss�жA�ه$       B+�M	��k�Z��A�#*

Training_loss�(�A�F�:$       B+�M	'�̈́Z��A�#*

Training_loss~H�Adk׷$       B+�M	�b/�Z��A�#*

Training_lossw��A��Z3$       B+�M	X���Z��A�#*

Training_loss�}�A����$       B+�M	~�Z��A�#*

Training_loss���AU/$       B+�M	ZhN�Z��A�#*

Training_loss���A�;�$       B+�M	s���Z��A�#*

Training_loss�H�A��g$       B+�M	��Z��A�#*

Training_loss|�A{�u$       B+�M	$s�Z��A�#*

Training_loss��A#y�9$       B+�M	Ҫ·Z��A�#*

Training_loss�W�A
�@�$       B+�M	4�2�Z��A�#*

Training_loss.�A�DQ$       B+�M	�y��Z��A�#*

Training_loss�M�A�K`$       B+�M	���Z��A�#*

Training_lossa�A�y�|$       B+�M	�dQ�Z��A�#*

Training_loss��A�f�?$       B+�M	.簉Z��A�#*

Training_loss4ՍA%�cw$       B+�M	���Z��A�#*

Training_loss�#�A.P��$       B+�M	�q�Z��A�#*

Training_loss���AOG$       B+�M	+jъZ��A�#*

Training_lossH��A�ru�$       B+�M	V�2�Z��A�#*

Training_loss���ArhG�$       B+�M	px��Z��A�#*

Training_loss�@�Agv�4$       B+�M	r���Z��A�#*

Training_lossDt�AFD,�*       ����	n���Z��A�#*

Validation_accuracy��T?���&       sO� 	Ƥ��Z��A�#*

Validation_loss�6Byjj�$       B+�M	N���Z��A�#*

Training_loss��Aa�&$       B+�M	}�Y�Z��A�#*

Training_loss�J~A�B�$       B+�M	�w��Z��A�#*

Training_loss�AiIaq$       B+�M	�R�Z��A�#*

Training_loss�^�A���$       B+�M	��p�Z��A�#*

Training_lossv��A�bs($       B+�M	��͑Z��A�#*

Training_lossM3�A���$       B+�M	�+�Z��A�#*

Training_loss��AX�k�$       B+�M	C��Z��A�$*

Training_loss�9rA�[�$       B+�M	ߣ�Z��A�$*

Training_loss��A��$       B+�M	E*A�Z��A�$*

Training_loss_p�An�N�$       B+�M	��Z��A�$*

Training_lossC�A��.�$       B+�M	/���Z��A�$*

Training_loss�T�A{�l�$       B+�M	l�Y�Z��A�$*

Training_loss�m B�n�u$       B+�M	yy��Z��A�$*

Training_lossZc�A�TK$       B+�M	���Z��A�$*

Training_loss�8�A[m�S$       B+�M	U�t�Z��A�$*

Training_loss�ʱA
�;�$       B+�M	�`ՕZ��A�$*

Training_loss��AN��$       B+�M	Dl2�Z��A�$*

Training_loss��B�V[$       B+�M	�v��Z��A�$*

Training_loss���ABjy�$       B+�M	D��Z��A�$*

Training_loss�l�A��t$       B+�M	�_K�Z��A�$*

Training_loss=c�At6$       B+�M	i7��Z��A�$*

Training_loss�$�A+`�$       B+�M	'	�Z��A�$*

Training_loss�AL0G�$       B+�M	�Ei�Z��A�$*

Training_loss���A��%S$       B+�M	�HʘZ��A�$*

Training_loss���A�.n$       B+�M	R()�Z��A�$*

Training_loss�ũA�d'$       B+�M	]���Z��A�$*

Training_lossD۾A[�\�$       B+�M	���Z��A�$*

Training_loss�Q�A�&�$       B+�M	�kA�Z��A�$*

Training_loss�`�A���$       B+�M	̘��Z��A�$*

Training_loss(��Aw�=$       B+�M	L��Z��A�$*

Training_loss�>�A�_$       B+�M	�D]�Z��A�$*

Training_loss�%�A��GN$       B+�M	w��Z��A�$*

Training_loss�ɃA{��$       B+�M	
�U�Z��A�$*

Training_lossN��Ak�XN$       B+�M	��̜Z��A�$*

Training_loss���A���p$       B+�M	v�C�Z��A�$*

Training_loss���AN+�$       B+�M	����Z��A�$*

Training_loss1��A��A5$       B+�M	��6�Z��A�$*

Training_loss��AVO-�$       B+�M	���Z��A�$*

Training_loss j B���G$       B+�M	^�"�Z��A�$*

Training_loss�a�A�Z�V$       B+�M	-!��Z��A�$*

Training_loss�`�AVA:�$       B+�M	���Z��A�$*

Training_loss�:�A�HǠ$       B+�M	�&��Z��A�$*

Training_loss�A���$       B+�M	����Z��A�$*

Training_loss�e�AY���$       B+�M	�^w�Z��A�$*

Training_loss�:�Aʹ�/$       B+�M	����Z��A�$*

Training_loss6[zA��H$       B+�M	��Z�Z��A�$*

Training_loss�A���A$       B+�M	����Z��A�$*

Training_loss�9�A��f�$       B+�M	\Z�Z��A�$*

Training_loss0�A���$       B+�M	U�v�Z��A�$*

Training_lossEvA�h�*       ����	��>�Z��A�$*

Validation_accuracyxxT?�Q$�&       sO� 	��>�Z��A�$*

Validation_loss[H7B9$       B+�M	�ճ�Z��A�$*

Training_losse�B3�$       B+�M	��'�Z��A�$*

Training_loss�h�AȪ=�$       B+�M	c_��Z��A�$*

Training_loss^��A�Y �$       B+�M	f��Z��A�$*

Training_loss���A#g��$       B+�M	���Z��A�$*

Training_loss�A���$       B+�M	:A�Z��A�$*

Training_lossa�{A ��j$       B+�M	f�t�Z��A�$*

Training_loss  �A���$       B+�M	��۪Z��A�$*

Training_loss�C�A-v�_$       B+�M	F�;�Z��A�$*

Training_loss��?A�B֙$       B+�M	�C��Z��A�$*

Training_loss��A���"$       B+�M	���Z��A�$*

Training_loss2�A��.$       B+�M	$�_�Z��A�$*

Training_loss5Bu�i�$       B+�M	�ۻ�Z��A�$*

Training_loss�Ao3Ճ$       B+�M	5��Z��A�$*

Training_loss���A��U�$       B+�M	1~u�Z��A�$*

Training_loss�h�A��LV$       B+�M	u>ҭZ��A�$*

Training_loss���A�Ȁ�$       B+�M	{7�Z��A�$*

Training_loss�gaA6��b$       B+�M	�/��Z��A�$*

Training_loss�ƃAN��$       B+�M	ڨ�Z��A�$*

Training_loss�~�A�{N�$       B+�M	\M�Z��A�$*

Training_loss !�A�O�$       B+�M	'���Z��A�$*

Training_loss�8�A����$       B+�M	a��Z��A�$*

Training_lossds�AT�w!$       B+�M	K�d�Z��A�$*

Training_loss���A4���$       B+�M	F�°Z��A�$*

Training_loss��A��L�$       B+�M	j�"�Z��A�$*

Training_loss�B/���$       B+�M	���Z��A�$*

Training_loss�T�A~/�$       B+�M	��߱Z��A�$*

Training_loss��A!JN�$       B+�M	�>�Z��A�$*

Training_loss�>�A�Z`�$       B+�M	����Z��A�$*

Training_loss��A�s$       B+�M	L��Z��A�$*

Training_loss��AH6�$       B+�M	A�a�Z��A�$*

Training_lossS8�A�U_�$       B+�M	?sųZ��A�$*

Training_loss샰AI�2�$       B+�M	�="�Z��A�$*

Training_loss�w�A�>l�$       B+�M	[]�Z��A�$*

Training_loss���A��z$       B+�M	�޴Z��A�$*

Training_loss�OBN�F$       B+�M	נA�Z��A�$*

Training_loss��cAkh`^$       B+�M	. ��Z��A�$*

Training_loss�ʫAU�~S$       B+�M	���Z��A�$*

Training_loss���A֥�$       B+�M	)�Z�Z��A�$*

Training_loss;'�Aء�$       B+�M	f���Z��A�$*

Training_lossX�AlN��$       B+�M	J]8�Z��A�$*

Training_lossj��AѦ�$       B+�M	�c��Z��A�$*

Training_loss<��A��*�$       B+�M	x�"�Z��A�$*

Training_loss?�AU��$       B+�M	,���Z��A�$*

Training_lossuE�A.B��$       B+�M	8,�Z��A�$*

Training_loss��A�+�Q$       B+�M	�w��Z��A�$*

Training_loss�׶A
I��$       B+�M	���Z��A�$*

Training_loss�>A��<�$       B+�M	Ϊp�Z��A�$*

Training_loss�~�A����$       B+�M	YӺZ��A�$*

Training_loss]��A`3�$       B+�M	j�0�Z��A�$*

Training_loss��AR~�*       ����	����Z��A�$*

Validation_accuracyMMS?��:<&       sO� 	>���Z��A�$*

Validation_lossA�;B9VX?$       B+�M	%�Z��A�$*

Training_loss���A*��$       B+�M	�7��Z��A�$*

Training_lossü�A����$       B+�M	��	�Z��A�$*

Training_lossh�A�*�$       B+�M	@N~�Z��A�$*

Training_loss��A�T�$       B+�M	ͱ��Z��A�$*

Training_loss���A|5�$       B+�M	�lf�Z��A�$*

Training_losszBy8j�$       B+�M	L���Z��A�$*

Training_lossw�A��g�$       B+�M	sP�Z��A�$*

Training_loss( �A�z�p$       B+�M	�1��Z��A�$*

Training_lossxܪA�Ǵ�$       B+�M	�B�Z��A�$*

Training_lossp3�A�P$       B+�M	ZԳ�Z��A�$*

Training_loss�B�\�$       B+�M	d(�Z��A�$*

Training_loss�ɝA[N�9$       B+�M	����Z��A�$*

Training_loss�	�A$DI$       B+�M	߈�Z��A�$*

Training_lossg\�A5�y�$       B+�M	5���Z��A�$*

Training_lossڤ�A��$       B+�M	�,��Z��A�$*

Training_lossp��A;(O$       B+�M	t�t�Z��A�$*

Training_loss��A�ԁ�$       B+�M	?���Z��A�$*

Training_lossxm�Aď{�$       B+�M	��a�Z��A�$*

Training_lossc(�Ay��$       B+�M	�B��Z��A�$*

Training_loss�_�A5ž�$       B+�M	�fP�Z��A�$*

Training_loss��B���$       B+�M	�0��Z��A�$*

Training_loss�A4�'$       B+�M	��8�Z��A�$*

Training_loss���A���$       B+�M	�C��Z��A�$*

Training_lossc�A��$       B+�M	�}#�Z��A�$*

Training_loss�X�A�0T$       B+�M	����Z��A�$*

Training_lossVO�A���|$       B+�M	�#�Z��A�$*

Training_loss��A����$       B+�M	����Z��A�$*

Training_loss��B��U$       B+�M	aO#�Z��A�$*

Training_loss���A���$       B+�M	aO��Z��A�$*

Training_loss�t�A�<U�$       B+�M	
,�Z��A�$*

Training_lossI��Ad0�n$       B+�M	8��Z��A�$*

Training_lossF�A���$       B+�M	�5��Z��A�$*

Training_lossl�A�&X�$       B+�M	 ru�Z��A�$*

Training_loss0�AE q$       B+�M	����Z��A�$*

Training_loss���A�G��$       B+�M	s-I�Z��A�%*

Training_lossk��A�|=$       B+�M	խ�Z��A�%*

Training_loss0�A���$       B+�M	(+�Z��A�%*

Training_lossD��A�s��$       B+�M	*�p�Z��A�%*

Training_loss��A�2,$       B+�M	w��Z��A�%*

Training_loss8>�A�7��$       B+�M	�a9�Z��A�%*

Training_loss���A}g|K$       B+�M	�x��Z��A�%*

Training_lossQa�AzmP$       B+�M	�c��Z��A�%*

Training_loss�;�As�$       B+�M	��R�Z��A�%*

Training_lossl�A����$       B+�M	�Z��Z��A�%*

Training_loss�ʿA1'Y�$       B+�M	Ҋ�Z��A�%*

Training_loss���A�?Ɉ$       B+�M	6j�Z��A�%*

Training_lossf!�Ab��7$       B+�M	����Z��A�%*

Training_loss��ADe$       B+�M	O\$�Z��A�%*

Training_loss�,�Aʠ�N$       B+�M	h��Z��A�%*

Training_loss�4�A����*       ����	qYV�Z��A�%*

Validation_accuracyxxS?��@&       sO� 	\V�Z��A�%*

Validation_loss��<B	(�$       B+�M	jjs�Z��A�%*

Training_loss���AD��$       B+�M	����Z��A�%*

Training_loss�Q�AT��$       B+�M	n5�Z��A�%*

Training_loss��AY�o$       B+�M	ú��Z��A�%*

Training_lossm�A�G��$       B+�M	�N��Z��A�%*

Training_loss�a�A ��$       B+�M	�V�Z��A�%*

Training_loss]h�A@X�Z$       B+�M	g+��Z��A�%*

Training_loss��A���)$       B+�M	���Z��A�%*

Training_loss���A?�_l$       B+�M	�z�Z��A�%*

Training_loss!��A�؍�$       B+�M	����Z��A�%*

Training_losso��A=i]�$       B+�M	��9�Z��A�%*

Training_loss�F�AZG-�$       B+�M	&���Z��A�%*

Training_loss�l�AD��H$       B+�M	����Z��A�%*

Training_loss6_�A)�P$       B+�M	��V�Z��A�%*

Training_loss�ԲA�8�$       B+�M		P��Z��A�%*

Training_loss#�A�f-$       B+�M	I��Z��A�%*

Training_loss�óAF#2h$       B+�M	�o�Z��A�%*

Training_loss���AJ��$       B+�M	�i��Z��A�%*

Training_loss9�AL�+�$       B+�M	��'�Z��A�%*

Training_loss��A���.$       B+�M	���Z��A�%*

Training_loss\�A��$       B+�M	�4��Z��A�%*

Training_loss��B��$       B+�M	�pB�Z��A�%*

Training_loss���A�h($       B+�M	|��Z��A�%*

Training_loss�ĊA=!9$       B+�M	:���Z��A�%*

Training_lossg]�Aı��$       B+�M	��Y�Z��A�%*

Training_loss���A�I�$       B+�M	���Z��A�%*

Training_loss���A�^w$       B+�M	4�Z��A�%*

Training_loss߅�A|�Q$       B+�M	�r�Z��A�%*

Training_loss�|�AaX�H$       B+�M	����Z��A�%*

Training_loss��A=��$       B+�M	�CC�Z��A�%*

Training_loss�o�A����$       B+�M	����Z��A�%*

Training_loss���AۣM$       B+�M	-���Z��A�%*

Training_loss\[�A�3C�$       B+�M	~]�Z��A�%*

Training_lossx�A&�`�$       B+�M	X��Z��A�%*

Training_loss���A��N<$       B+�M	:�#�Z��A�%*

Training_loss̻�A�$       B+�M	,f��Z��A�%*

Training_lossZ֑AP[<�$       B+�M	����Z��A�%*

Training_lossCP�A���$       B+�M	9CK�Z��A�%*

Training_loss�W�A�î$       B+�M	�<��Z��A�%*

Training_loss.��A�)Q$       B+�M	�-�Z��A�%*

Training_loss�g�A�V��$       B+�M	�Cd�Z��A�%*

Training_lossͨB�E��$       B+�M	�~��Z��A�%*

Training_loss�X�Az�Q�$       B+�M	9�#�Z��A�%*

Training_loss�.\A��A<$       B+�M	���Z��A�%*

Training_loss��zA����$       B+�M	����Z��A�%*

Training_loss3��AMS�n$       B+�M	]�D�Z��A�%*

Training_lossmz�A�t�t$       B+�M	O���Z��A�%*

Training_loss } Bry�$       B+�M	���Z��A�%*

Training_loss?I�A���$       B+�M	�wg�Z��A�%*

Training_loss�A�/b)$       B+�M	�
��Z��A�%*

Training_loss���Aۈ�*       ����	E��Z��A�%*

Validation_accuracy##U?t쏇&       sO� 	���Z��A�%*

Validation_loss�8B�=$       B+�M	@���Z��A�%*

Training_lossb+B���G$       B+�M	��Y�Z��A�%*

Training_loss���Ah� $       B+�M	���Z��A�%*

Training_loss�P�A!+�$       B+�M	:�'�Z��A�%*

Training_loss��UAT\$       B+�M	����Z��A�%*

Training_lossx��A���E$       B+�M	����Z��A�%*

Training_lossM�B\Q��$       B+�M	WQ�Z��A�%*

Training_lossR3eA0:��$       B+�M	���Z��A�%*

Training_lossDQ�A�P�$       B+�M	=��Z��A�%*

Training_loss���A�,F$       B+�M	{Ks�Z��A�%*

Training_loss���A��Uy$       B+�M	-���Z��A�%*

Training_loss�q�A��'�$       B+�M	�f/�Z��A�%*

Training_loss�
�A
�c$       B+�M	eߑ�Z��A�%*

Training_loss:��A��*$       B+�M	m���Z��A�%*

Training_lossZ��A�#}�$       B+�M	��R�Z��A�%*

Training_loss>Z�A���$       B+�M	�A��Z��A�%*

Training_loss�.�A���v$       B+�M	���Z��A�%*

Training_lossZߑA��$       B+�M	`v�Z��A�%*

Training_lossa^}A	�KN$       B+�M	Y���Z��A�%*

Training_loss~��A��M$       B+�M	 =�Z��A�%*

Training_loss�ܟA��6�$       B+�M	f���Z��A�%*

Training_lossɔ�A���$       B+�M	����Z��A�%*

Training_lossd��A���$       B+�M	�[�Z��A�%*

Training_loss^�A�`��$       B+�M	#���Z��A�%*

Training_loss��AE0|$       B+�M	���Z��A�%*

Training_lossԑ�Ap�$       B+�M	.�w�Z��A�%*

Training_loss�,�At�P~$       B+�M	^��Z��A�%*

Training_loss(��AF\`$       B+�M	�+5�Z��A�%*

Training_loss���A�0�$       B+�M	���Z��A�%*

Training_loss)�A���O$       B+�M	:��Z��A�%*

Training_losstr�A�et*$       B+�M	�QU�Z��A�%*

Training_loss]�A7��x$       B+�M	���Z��A�%*

Training_loss�A�͙$       B+�M	���Z��A�%*

Training_loss���Ad��$       B+�M	6�n�Z��A�%*

Training_loss�A��.�$       B+�M	���Z��A�%*

Training_loss���A&̯$       B+�M	�@*�Z��A�%*

Training_loss��Aj��$       B+�M	e���Z��A�%*

Training_loss���Aك$�$       B+�M	 ���Z��A�%*

Training_loss@#�A���6$       B+�M	�)@�Z��A�%*

Training_loss�AP��$       B+�M	����Z��A�%*

Training_loss͡PA`���$       B+�M	z���Z��A�%*

Training_lossBYA|�zu$       B+�M	�Y�Z��A�%*

Training_lossT�ZA΃rL$       B+�M	3l��Z��A�%*

Training_loss(%�A/��5$       B+�M	sG�Z��A�%*

Training_loss��A�o	$       B+�M	�x�Z��A�%*

Training_loss��AQ�Y�$       B+�M	+m��Z��A�%*

Training_loss	��A�o��$       B+�M	�5 [��A�%*

Training_loss!��A��ɾ$       B+�M	\�� [��A�%*

Training_lossӠA��$       B+�M	��� [��A�%*

Training_loss&ٌA�V��$       B+�M	3lR[��A�%*

Training_loss��A����*       ����	��[��A�%*

Validation_accuracy��T?���&       sO� 	3�[��A�%*

Validation_loss�9B�"�$       B+�M	8O[��A�%*

Training_losst��A�V�$       B+�M	�P�[��A�%*

Training_loss�ЈAF���$       B+�M	��[��A�%*

Training_lossG��A��TH$       B+�M	�z[��A�%*

Training_lossL��A����$       B+�M	���[��A�%*

Training_loss���ApD.$       B+�M	�DE[��A�%*

Training_loss�	ZA�ZU$       B+�M	@��[��A�%*

Training_loss�\�AQf��$       B+�M	m�[��A�%*

Training_lossb��A�˚$       B+�M	�Q_[��A�%*

Training_loss,��Aht��$       B+�M	�<�[��A�%*

Training_loss�9�A�� l$       B+�M	�.$	[��A�%*

Training_loss1�A���L$       B+�M	�	[��A�%*

Training_loss��Aߓ��$       B+�M	l	�	[��A�%*

Training_loss�مA��2$       B+�M	�J;
[��A�&*

Training_lossD�rAYn}m$       B+�M	� �
[��A�&*

Training_loss��Aa�C$       B+�M	ۈ�
[��A�&*

Training_loss�зAÏ a$       B+�M	R[��A�&*

Training_loss��A��Z�$       B+�M	��[��A�&*

Training_lossӪ�Ag�$       B+�M	S�[��A�&*

Training_loss��sA�O��$       B+�M	D�l[��A�&*

Training_loss�a�A� ��$       B+�M	�|�[��A�&*

Training_loss>��A�p$       B+�M	�%[��A�&*

Training_loss,�A�)$�$       B+�M	�߂[��A�&*

Training_loss��AQ?^�$       B+�M	I��[��A�&*

Training_lossy�Ar1ex$       B+�M	��<[��A�&*

Training_loss��AG�7X$       B+�M	���[��A�&*

Training_lossRN�At�.$       B+�M	��[��A�&*

Training_loss臑A��I	$       B+�M	��W[��A�&*

Training_loss�@KA�W$�$       B+�M	���[��A�&*

Training_loss��A�ys$       B+�M	�� [��A�&*

Training_losspo�A�F��$       B+�M	b�~[��A�&*

Training_lossL�~A��V$       B+�M	'�[��A�&*

Training_loss���A��lG$       B+�M	n39[��A�&*

Training_lossBB]�F$       B+�M	�,�[��A�&*

Training_loss&�Aw�-�$       B+�M	��[��A�&*

Training_loss-!gAp�Ъ$       B+�M	V�v[��A�&*

Training_loss.$�Ay|�$       B+�M	���[��A�&*

Training_lossg��A���$       B+�M	��l[��A�&*

Training_loss���A6	o�$       B+�M	
��[��A�&*

Training_loss��A�z�j$       B+�M	��`[��A�&*

Training_lossT�UA�e�$       B+�M	��[��A�&*

Training_loss���A`�m�$       B+�M	�R[��A�&*

Training_loss�хA�=�$       B+�M	�[��A�&*

Training_lossr��Av�8$       B+�M	M<[��A�&*

Training_loss>&�A�B��$       B+�M	���[��A�&*

Training_loss+��A���$       B+�M	M0*[��A�&*

Training_loss���A��$       B+�M	؀�[��A�&*

Training_loss1�Aֳ�$       B+�M	�?[��A�&*

Training_lossĆ�A�fJ�$       B+�M	v��[��A�&*

Training_loss�y�A�h
O$       B+�M	�[��A�&*

Training_lossf�AbT��*       ����	�[��A�&*

Validation_accuracy##U?%.��&       sO� 	'�[��A�&*

Validation_loss�87B[�~^$       B+�M	f-[��A�&*

Training_loss��A��9I$       B+�M	���[��A�&*

Training_loss4d�A�zJ:$       B+�M	��[��A�&*

Training_loss��A3��$       B+�M	
�[��A�&*

Training_loss��A����$       B+�M	# [��A�&*

Training_lossy�A�{�.$       B+�M	�~{ [��A�&*

Training_loss<+�AO|8$       B+�M	�� [��A�&*

Training_loss�dA'sZ�$       B+�M	Y�h![��A�&*

Training_loss&��AB�$       B+�M	#�![��A�&*

Training_loss(H�A�r&N$       B+�M	�\"[��A�&*

Training_loss�6�A$%�,$       B+�M	���"[��A�&*

Training_loss|�A����$       B+�M	�eW#[��A�&*

Training_loss,�iAV�$       B+�M	�s�#[��A�&*

Training_loss�z�A�]Ə$       B+�M	h#L$[��A�&*

Training_loss�oUA�>TA$       B+�M	���$[��A�&*

Training_loss篩A����$       B+�M	��7%[��A�&*

Training_losstf�A��~O$       B+�M	��%[��A�&*

Training_lossqA�A(a�$       B+�M	��$&[��A�&*

Training_loss�
�A0���$       B+�M	�]�&[��A�&*

Training_loss���A���U$       B+�M	��'[��A�&*

Training_lossU�A���n$       B+�M	���'[��A�&*

Training_loss�dAQ��o$       B+�M	��([��A�&*

Training_lossB`�A3!Tp$       B+�M	ܠ|([��A�&*

Training_loss���A���X$       B+�M	�G�([��A�&*

Training_loss�Y�A5�X$       B+�M	w�e)[��A�&*

Training_loss8%�Ac�#>$       B+�M	�y�)[��A�&*

Training_loss��A���$       B+�M	��Q*[��A�&*

Training_loss��A��o$       B+�M	ߣ�*[��A�&*

Training_loss���A�:��$       B+�M	�?+[��A�&*

Training_loss�;�A(���$       B+�M	���+[��A�&*

Training_lossn�A�v}$       B+�M	�.,[��A�&*

Training_loss[|BY>~�$       B+�M	0�,[��A�&*

Training_loss��A��н$       B+�M	��-[��A�&*

Training_loss/�jA�$       B+�M	Վ-[��A�&*

Training_lossw��A����$       B+�M	nj.[��A�&*

Training_loss��AdT�$       B+�M	{�w.[��A�&*

Training_loss���A�9=�$       B+�M	���.[��A�&*

Training_lossXA�A4@��$       B+�M	Xd/[��A�&*

Training_loss��A��_$       B+�M	�"�/[��A�&*

Training_loss���A���F$       B+�M	��R0[��A�&*

Training_loss�&A.�m$       B+�M	 ��0[��A�&*

Training_loss��A�ۡJ$       B+�M	s/=1[��A�&*

Training_lossI�A�r.H$       B+�M	�1[��A�&*

Training_loss�B�A�F$       B+�M	
�)2[��A�&*

Training_loss�z�Ab�$       B+�M	�[�2[��A�&*

Training_lossc�A��� $       B+�M	�3[��A�&*

Training_lossk�A����$       B+�M	�Ґ3[��A�&*

Training_loss 0�A[|$       B+�M	.�4[��A�&*

Training_loss�t�A��%$       B+�M	�	~4[��A�&*

Training_lossjm�Aɘ�$$       B+�M	r2�4[��A�&*

Training_loss�7�ATHJ�*       ����	��5[��A�&*

Validation_accuracy��T?o��&       sO� 	���5[��A�&*

Validation_lossw�8Bd�$       B+�M	�:[��A�&*

Training_loss�/B�F�$       B+�M	�:[��A�&*

Training_loss|?mA+TR�$       B+�M	Kt;[��A�&*

Training_lossu��AjZN=$       B+�M	�z�;[��A�&*

Training_loss�;�Ah�$       B+�M	��<[��A�&*

Training_loss��A˻��$       B+�M	TR�<[��A�&*

Training_loss���Aܳ7$       B+�M	�N�<[��A�&*

Training_loss���At�$       B+�M	��j=[��A�&*

Training_lossN�A�$��$       B+�M	��=[��A�&*

Training_lossX��A4D�$       B+�M	i�V>[��A�&*

Training_loss��A)��$       B+�M	{��>[��A�&*

Training_loss¨�A�͝$       B+�M	t�V?[��A�&*

Training_loss��A��.�$       B+�M	��?[��A�&*

Training_loss&i�A��3�$       B+�M	K�*@[��A�&*

Training_loss]��A�Uj$       B+�M	-��@[��A�&*

Training_loss���A�9��$       B+�M	K��@[��A�&*

Training_loss_��A,f�~$       B+�M	�JA[��A�&*

Training_lossoR�A��,M$       B+�M	9��A[��A�&*

Training_loss�WAZ��:$       B+�M	BB[��A�&*

Training_lossT�A�OȔ$       B+�M	��bB[��A�&*

Training_loss���A*K#$       B+�M	��B[��A�&*

Training_loss��oA���$       B+�M	X�C[��A�&*

Training_loss(U�A���$       B+�M	>zC[��A�&*

Training_loss���Ar�Y$       B+�M	6��C[��A�&*

Training_lossI�A�L�$       B+�M	Ѱ4D[��A�&*

Training_losswcA���$       B+�M	#�D[��A�&*

Training_loss���A,(k$       B+�M	��D[��A�&*

Training_loss^g�A�3hJ$       B+�M	nLE[��A�&*

Training_lossR*�AN��$       B+�M	���E[��A�&*

Training_loss:�qA�;$       B+�M	�F[��A�&*

Training_loss���A���	$       B+�M	��cF[��A�&*

Training_loss�*�A��3�$       B+�M	�z�F[��A�&*

Training_loss���A�/�X$       B+�M	�.G[��A�&*

Training_loss KUA��GX$       B+�M	���G[��A�&*

Training_lossXA�A��@$       B+�M	�{�G[��A�&*

Training_lossJAb�Z$       B+�M	��PH[��A�&*

Training_lossE!�A&��J$       B+�M	�ɮH[��A�&*

Training_loss�8]A~��K$       B+�M	�~I[��A�&*

Training_loss(U�AD(m�$       B+�M	iWiI[��A�&*

Training_loss"�B~+$       B+�M	B?�I[��A�&*

Training_lossJR�AP�^�$       B+�M	�1$J[��A�&*

Training_loss���A3�$       B+�M	珃J[��A�'*

Training_loss.�RA���?$       B+�M	���J[��A�'*

Training_lossrAL�$       B+�M	�_>K[��A�'*

Training_loss
 �A����$       B+�M	_��K[��A�'*

Training_loss�A,��z$       B+�M	���K[��A�'*

Training_lossj^�A4�L$       B+�M	�@YL[��A�'*

Training_loss,�^A�.�$       B+�M	䣸L[��A�'*

Training_lossH��A	��$       B+�M	/M[��A�'*

Training_lossNF�A�`�$       B+�M	�[tM[��A�'*

Training_lossʏ�A1��L*       ����	��hN[��A�'*

Validation_accuracy��T?���	&       sO� 	o�hN[��A�'*

Validation_lossA6:BǖW�$       B+�M	�[�R[��A�'*

Training_loss�ЍA�e!�$       B+�M	��S[��A�'*

Training_loss{j�A���)$       B+�M	]OeS[��A�'*

Training_lossiC�A�=�J$       B+�M	9��S[��A�'*

Training_lossr�A|b��$       B+�M	�,T[��A�'*

Training_loss�Aww��$       B+�M	�	�T[��A�'*

Training_loss�'�A�k�i$       B+�M	���T[��A�'*

Training_lossS��A�D��$       B+�M	�QU[��A�'*

Training_loss�iA�i�$       B+�M	��U[��A�'*

Training_loss�g�Ad�z�$       B+�M	B_V[��A�'*

Training_losss�A��V�$       B+�M	��rV[��A�'*

Training_loss["A�F�$       B+�M	��V[��A�'*

Training_loss��AX��$       B+�M	�=W[��A�'*

Training_lossܐuA�A�$       B+�M	ʧ�W[��A�'*

Training_lossh�A1��F$       B+�M	�.-X[��A�'*

Training_loss��OA���$       B+�M	�n�X[��A�'*

Training_loss֎�A݇�$       B+�M	 �Y[��A�'*

Training_loss��AL+$       B+�M	�9�Y[��A�'*

Training_loss���A�NK$       B+�M	\	Z[��A�'*

Training_loss,v�A��I$       B+�M	�'}Z[��A�'*

Training_loss!�Aջq�$       B+�M	�<�Z[��A�'*

Training_loss���Aj�|$       B+�M	:@c[[��A�'*

Training_loss£�Ar���$       B+�M	���[[��A�'*

Training_loss L�A�l$       B+�M	�
M\[��A�'*

Training_loss~{�A�f�[$       B+�M	�(�\[��A�'*

Training_lossA��A���$       B+�M	[_9][��A�'*

Training_loss@T�A"R��$       B+�M	�{�][��A�'*

Training_lossʹ�A�8m$       B+�M	��.^[��A�'*

Training_loss��6A����$       B+�M	$d�^[��A�'*

Training_loss�8Ai��4$       B+�M	�� _[��A�'*

Training_loss��A�~��$       B+�M	�;�_[��A�'*

Training_losstj*AU��9$       B+�M	"�`[��A�'*

Training_lossj��AY�vX$       B+�M	ވ`[��A�'*

Training_loss�M�Ag�$       B+�M	[a[��A�'*

Training_lossߐA�	�$       B+�M	�kwa[��A�'*

Training_loss�@�A
��1$       B+�M	��a[��A�'*

Training_loss��AS;<�$       B+�M	�Jab[��A�'*

Training_loss�͎A��`$       B+�M	�x�b[��A�'*

Training_loss8�A��a$       B+�M	"OFc[��A�'*

Training_loss���A��:�$       B+�M	���c[��A�'*

Training_lossZ�A���$       B+�M	�/d[��A�'*

Training_loss�.�A���$$       B+�M	%��d[��A�'*

Training_loss�U�A՗�$       B+�M	ߣe[��A�'*

Training_loss���A���$       B+�M	i��e[��A�'*

Training_lossb�rAӎ��$       B+�M	vQf[��A�'*

Training_loss>�An�j$       B+�M	�7~f[��A�'*

Training_loss�|�A��s�$       B+�M	���f[��A�'*

Training_loss.�A��:Z$       B+�M	A�mg[��A�'*

Training_loss u�A���$       B+�M	%�g[��A�'*

Training_loss�P�Aե��$       B+�M	e6Zh[��A�'*

Training_lossE�uA���e*       ����	aU\i[��A�'*

Validation_accuracyONU?��XX&       sO� 	>Y\i[��A�'*

Validation_loss �8B|��$       B+�M	g�@m[��A�'*

Training_loss���A��f$       B+�M	O�m[��A�'*

Training_loss*מA��$       B+�M	���m[��A�'*

Training_loss�w�A�D$       B+�M	�_^n[��A�'*

Training_loss�>�A��$       B+�M	R�n[��A�'*

Training_lossD��A�H�$       B+�M	p	o[��A�'*

Training_loss;
B�,2C$       B+�M	d�yo[��A�'*

Training_loss��JA3���$       B+�M	%u�o[��A�'*

Training_loss�H}A�:��$       B+�M	z�7p[��A�'*

Training_loss�qhAÿM�$       B+�M	C��p[��A�'*

Training_loss�-�A��$       B+�M	RI�p[��A�'*

Training_loss�o�AҼ�$       B+�M	`�Vq[��A�'*

Training_loss�s�A4�� $       B+�M	&S�q[��A�'*

Training_loss�~MAc���$       B+�M	��r[��A�'*

Training_loss�z�AW���$       B+�M	�.qr[��A�'*

Training_loss���A{\$       B+�M	v��r[��A�'*

Training_losshX�AC���$       B+�M	#1s[��A�'*

Training_loss`�AU��m$       B+�M	��s[��A�'*

Training_lossn|ZA5���$       B+�M	�f�s[��A�'*

Training_lossBFB�쾽$       B+�M	�'Nt[��A�'*

Training_loss���A�U$       B+�M	�8�t[��A�'*

Training_loss¼A��Xi$       B+�M	�FCu[��A�'*

Training_loss`��A�Po�$       B+�M	vR�u[��A�'*

Training_loss�Q�A�ߴ$       B+�M	s�5v[��A�'*

Training_loss���A-[n�$       B+�M	�:�v[��A�'*

Training_lossiڲAc�H$       B+�M	��.w[��A�'*

Training_lossK�B$��p$       B+�M	�ʣw[��A�'*

Training_lossQ��A;�4$       B+�M	�X#x[��A�'*

Training_lossTy�A�G�$       B+�M	j2�x[��A�'*

Training_loss���Ad�B$       B+�M	�Ty[��A�'*

Training_loss�4�AChD�$       B+�M	iÒy[��A�'*

Training_loss�|�Ar�W�$       B+�M	!�
z[��A�'*

Training_loss糊A���*$       B+�M	tz�z[��A�'*

Training_loss��zAchԼ$       B+�M	���z[��A�'*

Training_loss75�A5�$       B+�M	��B{[��A�'*

Training_loss�7�Aӳ�3$       B+�M	<0�{[��A�'*

Training_loss�H�A��g[$       B+�M	�+�{[��A�'*

Training_lossůA)p`�$       B+�M	d#[|[��A�'*

Training_loss�טAM_�N$       B+�M	If�|[��A�'*

Training_lossLw�A��m$       B+�M	�X}[��A�'*

Training_lossE�A]���$       B+�M	e�|}[��A�'*

Training_loss���A6�f�$       B+�M	���}[��A�'*

Training_loss���Ax�V�$       B+�M	�G~[��A�'*

Training_lossL-�A�?��$       B+�M	���~[��A�'*

Training_loss���A)ov8$       B+�M	�[��A�'*

Training_loss���A���$       B+�M	�f[��A�'*

Training_loss��pA��O$       B+�M	���[��A�'*

Training_lossÔ�A3�.'$       B+�M	�Q1�[��A�'*

Training_loss�A��;$       B+�M	;�[��A�'*

Training_loss���A]qr}*       ����	oR�[��A�'*

Validation_accuracyyyW?���&       sO� 	sR�[��A�'*

Validation_loss;�6B�m$Y