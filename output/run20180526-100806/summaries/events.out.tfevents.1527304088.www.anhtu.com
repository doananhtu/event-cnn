       �K"	   �3��Abrain.Event:2DMP{u7     ,4+3	q��3��A"��
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
: "	��}\     ��#	D�-�3��AJ�
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
output/b_out:0output/b_out/Assignoutput/b_out/read:0��4�#       ��wC	V���3��A*

Training_loss�+�Cl�B�#       ��wC	�b�3��A*

Training_loss��C��#       ��wC	0�i�3��A*

Training_loss��C��#       ��wC	�h��3��A*

Training_lossw��C��ڛ#       ��wC	�="�3��A*

Training_loss�ӒCb�]�#       ��wC	�p~�3��A*

Training_lossە�CdI�#       ��wC	%���3��A*

Training_loss�?|CK�kn#       ��wC	m 6�3��A*

Training_loss�ÏCf�Q�#       ��wC	.:��3��A	*

Training_lossr�CRA�#       ��wC	(���3��A
*

Training_loss��C8��#       ��wC	 CK�3��A*

Training_lossbQ�C�Ք6#       ��wC	敧�3��A*

Training_loss�ZFCV`�a#       ��wC	t��3��A*

Training_loss�nYC�S�C#       ��wC	,�_�3��A*

Training_lossؘ2COUC�#       ��wC	���3��A*

Training_loss��JC�}W�#       ��wC	eS�3��A*

Training_loss�k3C�(�#       ��wC	Vu�3��A*

Training_loss.�C�yg#       ��wC	o���3��A*

Training_loss��BCW�#       ��wC	��9�3��A*

Training_loss�v#C3viJ#       ��wC	����3��A*

Training_loss�-CцK�#       ��wC	2��3��A*

Training_lossC_CkQ�#       ��wC	��M�3��A*

Training_loss2�SC����#       ��wC	���3��A*

Training_lossB�;C��a#       ��wC	��3��A*

Training_loss~�4C�c��#       ��wC	,.a�3��A*

Training_loss	b6C��#       ��wC	�k��3��A*

Training_lossC\Q�#       ��wC	t�3��A*

Training_lossrpCk�e�#       ��wC	Cv�3��A*

Training_loss��CC�[#       ��wC	����3��A*

Training_loss��B����#       ��wC	 �-�3��A*

Training_loss�C���_#       ��wC	���3��A*

Training_loss�u	C���#       ��wC	L��3��A *

Training_loss���B/�g#       ��wC	�UB�3��A!*

Training_loss���B�2#       ��wC	�e�3��A"*

Training_loss|�B��p)       7�_ 	Ku��3��A"*

Validation_accuracy�Xa?�5��%       �6�	�x��3��A"*

Validation_losscY�B�<F#       ��wC	�F�3��A#*

Training_loss���B�?�#       ��wC	+��3��A$*

Training_lossW��B�b�o#       ��wC	���3��A%*

Training_lossۯB�7y�#       ��wC	4a�3��A&*

Training_loss��B�Q��#       ��wC	���3��A'*

Training_loss�9�B��?G#       ��wC	���3��A(*

Training_loss�}C�2 #       ��wC	+�u�3��A)*

Training_loss�^�B��}�#       ��wC	NB��3��A**

Training_loss��C�G�.#       ��wC	��.�3��A+*

Training_loss��B���y#       ��wC	9
��3��A,*

Training_loss��jC�E�#       ��wC	�-��3��A-*

Training_loss:�B��#       ��wC	)yC�3��A.*

Training_loss|�%C�}�#       ��wC	]���3��A/*

Training_loss��C�#       ��wC	����3��A0*

Training_loss�9C�mY#       ��wC	ճW�3��A1*

Training_loss�8�B��P#       ��wC	�>��3��A2*

Training_lossV��B���#       ��wC	��3��A3*

Training_loss��B&Uv#       ��wC	m�3��A4*

Training_loss�BO��@#       ��wC	�8��3��A5*

Training_loss^a;C o��#       ��wC	�(%�3��A6*

Training_loss�U�Bgdz�#       ��wC	���3��A7*

Training_lossN$�B5�#       ��wC	���3��A8*

Training_losspoC��&�#       ��wC	��9�3��A9*

Training_lossW"�B���#       ��wC	,���3��A:*

Training_lossb�C�(��#       ��wC	�}��3��A;*

Training_lossa4 C!Ļ�#       ��wC	�M�3��A<*

Training_lossJ�C��'�#       ��wC	m��3��A=*

Training_loss�C/���#       ��wC	d��3��A>*

Training_loss@�Cb�2/#       ��wC	&9b�3��A?*

Training_loss�klC��~#       ��wC	�ھ�3��A@*

Training_loss��B�[):#       ��wC	��3��AA*

Training_loss���BB���#       ��wC	�iv�3��AB*

Training_loss�' C��Y#       ��wC	����3��AC*

Training_loss"��BUz�#       ��wC	��.�3��AD*

Training_loss]��B�C�)       7�_ 	� ��3��AD*

Validation_accuracy(vb?&7ܲ%       �6�	1#��3��AD*

Validation_loss��BFP[�#       ��wC	9���3��AE*

Training_loss��Aqr�c#       ��wC	�I2 4��AF*

Training_loss���BX�n�#       ��wC	�� 4��AG*

Training_loss5��B��n�#       ��wC	�� 4��AH*

Training_loss��B��U�#       ��wC	�ZH4��AI*

Training_lossf&C<W�#       ��wC	z��4��AJ*

Training_lossř�B_i<"#       ��wC	�� 4��AK*

Training_lossu��B
ڗ�#       ��wC	�]4��AL*

Training_loss�(�Bٛ�F#       ��wC	a�4��AM*

Training_loss�31C뉹7#       ��wC	�4��AN*

Training_loss��Ch�A�#       ��wC	�u4��AO*

Training_loss6�CYK��#       ��wC	���4��AP*

Training_loss5��Bn<��#       ��wC	.�-4��AQ*

Training_loss���B��=�#       ��wC	��4��AR*

Training_lossk@�B�{]!#       ��wC	���4��AS*

Training_loss.?�B
�#       ��wC	B�C4��AT*

Training_loss�.�B_���#       ��wC	�ڟ4��AU*

Training_lossF^�B�M��#       ��wC	]��4��AV*

Training_loss��B��e#       ��wC	g�W4��AW*

Training_loss�=�Bjè#       ��wC	��4��AX*

Training_lossAC��C�#       ��wC	��4��AY*

Training_lossI�+C ��n#       ��wC	�7k4��AZ*

Training_loss�;C`�#       ��wC	���4��A[*

Training_loss&��BR=�#       ��wC	�d#4��A\*

Training_lossj�B:�V�#       ��wC	�u4��A]*

Training_loss`�C/c�#       ��wC	���4��A^*

Training_loss!��B�U#       ��wC	qs8	4��A_*

Training_loss���Bxi{#       ��wC	 �	4��A`*

Training_loss"DC��j�#       ��wC	�J�	4��Aa*

Training_loss���B�W1�#       ��wC	J�L
4��Ab*

Training_lossڷ�B��l�#       ��wC	��
4��Ac*

Training_loss�C�S+8#       ��wC	�W4��Ad*

Training_loss+ �Bhڏ�#       ��wC	'�`4��Ae*

Training_lossN�	C'���#       ��wC	�s�4��Af*

Training_loss�M�Bd?n)       7�_ 	�q@4��Af*

Validation_accuracy(vc?.8x�%       �6�	mt@4��Af*

Validation_lossJ^�B��bq#       ��wC	�-�4��Ag*

Training_loss8!C�HO�#       ��wC	���4��Ah*

Training_loss�xFB
�_�#       ��wC	l=4��Ai*

Training_loss4*C��#       ��wC	f/y4��Aj*

Training_loss9�B�#       ��wC	�_�4��Ak*

Training_loss�B�B���#       ��wC	`�14��Al*

Training_loss㸰B �w�#       ��wC	^�4��Am*

Training_loss4oFCp4�#       ��wC	���4��An*

Training_loss��B�1�V#       ��wC	��F4��Ao*

Training_loss?��Bi-�9#       ��wC	?��4��Ap*

Training_loss��$C��o#       ��wC	���4��Aq*

Training_loss�C_�#       ��wC	��\4��Ar*

Training_loss��B�Ņ8#       ��wC	vo�4��As*

Training_loss���B���W#       ��wC	� 4��At*

Training_loss*k(C�#       ��wC	��q4��Au*

Training_loss��C9q��#       ��wC	/�4��Av*

Training_loss���B�.�#       ��wC	�r)4��Aw*

Training_lossI��BgdE#       ��wC	��4��Ax*

Training_loss&CZD��#       ��wC	;r�4��Ay*

Training_lossE�B��� #       ��wC	[�=4��Az*

Training_lossz��B�.n#       ��wC	Cr�4��A{*

Training_lossrP�BH��#       ��wC	8��4��A|*

Training_loss0C�#       ��wC	�MR4��A}*

Training_lossx��Bs���#       ��wC	��4��A~*

Training_loss���B ���#       ��wC	%�
4��A*

Training_lossZ�B
x�$       B+�M	��f4��A�*

Training_lossK��BR(�$       B+�M	���4��A�*

Training_loss���B�$       B+�M	t#4��A�*

Training_loss�(�Bw]$       B+�M	w�z4��A�*

Training_loss���B�),$       B+�M	VF�4��A�*

Training_loss���B�|n�$       B+�M	��34��A�*

Training_loss6�B���$       B+�M	�͏4��A�*

Training_loss�~�B�6��$       B+�M	4��4��A�*

Training_loss�f�B��vD$       B+�M	a�H4��A�*

Training_loss.�C����*       ����	�?�4��A�*

Validation_accuracy(�d?�~{�&       sO� 	�A�4��A�*

Validation_lossݵ�B
�$       B+�M	��'4��A�*

Training_loss��B%,$       B+�M	HO�4��A�*

Training_loss %B��01$       B+�M	��4��A�*

Training_loss�pOB�yyJ$       B+�M	�14��A�*

Training_loss
$jBo�î$       B+�M	�_4��A�*

Training_loss$�C}t��$       B+�M	#׻4��A�*

Training_loss
��BQ��m$       B+�M	/4��A�*

Training_lossd�.B5�7�$       B+�M	t4��A�*

Training_lossdN�B���n$       B+�M	���4��A�*

Training_lossz��BA�U�$       B+�M	��-4��A�*

Training_loss� �B�-&$       B+�M	�U�4��A�*

Training_loss� �B8?�$       B+�M	���4��A�*

Training_losscd�BG�2�$       B+�M	�D4��A�*

Training_lossp�
C�kI�$       B+�M	N_�4��A�*

Training_loss��xBN�Uw$       B+�M	��4��A�*

Training_loss9�C�eF$       B+�M	��Y4��A�*

Training_loss��B�A��$       B+�M	si�4��A�*

Training_loss�L�B�� �$       B+�M	-�4��A�*

Training_loss��B۶�L$       B+�M	�n4��A�*

Training_lossؓ�B4q<k$       B+�M	���4��A�*

Training_loss���B�(��$       B+�M	S' 4��A�*

Training_loss^�B�=$       B+�M	� 4��A�*

Training_loss��B���$       B+�M	�(� 4��A�*

Training_lossD~�B����$       B+�M	��?!4��A�*

Training_loss��C➆$       B+�M	M�!4��A�*

Training_lossƯBu��$       B+�M	��!4��A�*

Training_loss�CL��$       B+�M	�@Y"4��A�*

Training_lossI��B���$       B+�M	^ո"4��A�*

Training_lossL��B�I��$       B+�M	�L#4��A�*

Training_lossR��B�Lb�$       B+�M	�:}#4��A�*

Training_loss���B���$       B+�M	���#4��A�*

Training_lossF׾BZ��4$       B+�M	��7$4��A�*

Training_loss/V"C|��$       B+�M	�Ǔ$4��A�*

Training_loss2DCa�X�$       B+�M	Z��$4��A�*

Training_loss�_�B�42�*       ����	\tz%4��A�*

Validation_accuracy��e?x�&       sO� 	6wz%4��A�*

Validation_lossف�B��c$       B+�M	ob�%4��A�*

Training_loss�lC���$       B+�M	h�N&4��A�*

Training_loss��B3S�$       B+�M	<i�&4��A�*

Training_lossm C݆vE$       B+�M	��&4��A�*

Training_loss��BBp�f$       B+�M	,-'4��A�*

Training_lossh�B#t�$       B+�M	�T�'4��A�*

Training_loss���Bg�$       B+�M	R_�'4��A�*

Training_loss�y�Bqo�
$       B+�M	��i(4��A�*

Training_loss�C�|��$       B+�M	M��(4��A�*

Training_loss�ӠB:Cԇ$       B+�M	P�[)4��A�*

Training_loss�g�Bz��$       B+�M	P��)4��A�*

Training_lossNC�B�Z��$       B+�M	fi%*4��A�*

Training_loss���B����$       B+�M	Ǟ�*4��A�*

Training_lossUC`:[e$       B+�M	���*4��A�*

Training_loss˗�B3�$       B+�M	�[A+4��A�*

Training_lossm�Bcx`�$       B+�M	�^�+4��A�*

Training_loss&�B��W($       B+�M	�	�+4��A�*

Training_lossbA�B<b�O$       B+�M	r�Y,4��A�*

Training_lossɖC��-�$       B+�M	��,4��A�*

Training_loss�XC˱U$       B+�M	 A-4��A�*

Training_lossڅ�B�$��$       B+�M	�o-4��A�*

Training_loss<L�B��g$       B+�M	��-4��A�*

Training_loss~��B�c�4$       B+�M	wi+.4��A�*

Training_loss~��Bͷ^I$       B+�M	!�.4��A�*

Training_loss���BO $       B+�M	3��.4��A�*

Training_lossI��B���i$       B+�M	�Y@/4��A�*

Training_loss�B����$       B+�M	���/4��A�*

Training_lossL~�B��R$       B+�M	M.�/4��A�*

Training_lossqg�Bvi!�$       B+�M	�Z04��A�*

Training_loss]�C�q$       B+�M	I��04��A�*

Training_loss�D�B+�o�$       B+�M	�14��A�*

Training_loss^Q�B{�k$       B+�M	q�x14��A�*

Training_loss���By�:$       B+�M	���14��A�*

Training_loss�h�Bt��=$       B+�M	u�324��A�*

Training_loss4)�B�ڞ�*       ����	~:�24��A�*

Validation_accuracy�f?IS|&       sO� 	y=�24��A�*

Validation_loss�,�B���\$       B+�M	�34��A�*

Training_loss�V�B8��$       B+�M	W�s34��A�*

Training_loss���B��	$       B+�M	��34��A�*

Training_loss���BI9�$       B+�M	�.44��A�*

Training_losst��Bؗ��$       B+�M	_�R44��A�*

Training_loss�2�B)��"$       B+�M	���44��A�*

Training_loss/�B��$       B+�M	k)54��A�*

Training_lossT�B��$       B+�M	��j54��A�*

Training_loss��B^��
$       B+�M	��54��A�*

Training_lossw�B.�$       B+�M	�$64��A�*

Training_lossX�B!nK�$       B+�M	}�64��A�*

Training_loss�לB�)�"$       B+�M	���64��A�*

Training_loss�G�B�QGF$       B+�M	��:74��A�*

Training_loss I�B�T$L$       B+�M	\��74��A�*

Training_loss�յBBf�4$       B+�M	a
84��A�*

Training_loss䟦B�y�$       B+�M	Ɗl84��A�*

Training_loss� Cx��$       B+�M	��84��A�*

Training_lossó�B���j$       B+�M	�c/94��A�*

Training_loss���BA���$       B+�M	$��94��A�*

Training_loss���B*�J$       B+�M	7��94��A�*

Training_loss�]�B����$       B+�M	��C:4��A�*

Training_loss�BeLM$       B+�M	��:4��A�*

Training_loss�~�B��_$       B+�M	�n�:4��A�*

Training_loss���Bu�ϝ$       B+�M	~7`;4��A�*

Training_loss4��B��$       B+�M	�[�;4��A�*

Training_lossF^�Bs��S$       B+�M	&<4��A�*

Training_loss�C��$       B+�M	���<4��A�*

Training_loss�{B��[($       B+�M	���<4��A�*

Training_loss�!C��R�$       B+�M	�J=4��A�*

Training_loss�x�B�-n$       B+�M	Ș�=4��A�*

Training_loss�C�BI��?$       B+�M	^L>4��A�*

Training_lossD:C��
�$       B+�M	�$l>4��A�*

Training_loss�PC���$       B+�M	��>4��A�*

Training_loss��B�=��$       B+�M	�5?4��A�*

Training_loss��B����*       ����	�^�?4��A�*

Validation_accuracy�f? #��&       sO� 	a�?4��A�*

Validation_loss��B��]$       B+�M	k�+@4��A�*

Training_lossO��Brk��$       B+�M	�̓@4��A�*

Training_lossz,�B.��$       B+�M	2��@4��A�*

Training_loss�%�B��\$       B+�M	R�OA4��A�*

Training_loss��"C��m�$       B+�M	��A4��A�*

Training_lossJeB���k$       B+�M	�U�A4��A�*

Training_lossV�
B�5p$       B+�M	�E:B4��A�*

Training_loss���BԳ	$       B+�M	�u�B4��A�*

Training_loss�V�B��9S$       B+�M	a��B4��A�*

Training_loss!ȢBh,`�$       B+�M	�+YC4��A�*

Training_loss�єB�!�=$       B+�M	��C4��A�*

Training_loss�4�B��	D$       B+�M	�u"D4��A�*

Training_lossƥB�|/$       B+�M	���D4��A�*

Training_loss���BYb�($       B+�M	���D4��A�*

Training_lossp�Cu�3�$       B+�M	 �HE4��A�*

Training_loss��C�ߡL$       B+�M	��E4��A�*

Training_loss���B��$       B+�M	��F4��A�*

Training_loss��C�-z�$       B+�M	h"iF4��A�*

Training_loss��}B�G}�$       B+�M	��F4��A�*

Training_losss�1B'�/w$       B+�M	l[,G4��A�*

Training_lossR�B`���$       B+�M	�,�G4��A�*

Training_loss��BO�i.$       B+�M	1��G4��A�*

Training_lossڭ�Bp ��$       B+�M	�ILH4��A�*

Training_loss��BR���$       B+�M	�f�H4��A�*

Training_loss�>�B����$       B+�M	MI4��A�*

Training_lossGkB8,
$       B+�M	�cpI4��A�*

Training_lossw�B��$       B+�M	���I4��A�*

Training_loss�Bc�F$       B+�M	$�*J4��A�*

Training_loss�Bpi	b$       B+�M	d<�J4��A�*

Training_loss���BH`�$       B+�M	���J4��A�*

Training_loss���B~���$       B+�M	�PK4��A�*

Training_losse�B��I�$       B+�M	d�K4��A�*

Training_loss���BXM҆$       B+�M	��L4��A�*

Training_lossRߌBo4�$       B+�M	L�oL4��A�*

Training_loss�CL�*       ����	�L4��A�*

Validation_accuracy��f?)4�(&       sO� 	r�L4��A�*

Validation_loss*ɈB.�Hk$       B+�M	�>ZM4��A�*

Training_loss�sCY��$       B+�M	ɪ�M4��A�*

Training_loss\A�Bf�]$       B+�M	��N4��A�*

Training_lossY�B�Y:$       B+�M	{N4��A�*

Training_loss��B�Qa�$       B+�M	���N4��A�*

Training_loss1��B�
$       B+�M	
�HO4��A�*

Training_lossظ�BP�f$       B+�M	s�pO4��A�*

Training_loss�OB �$       B+�M	��O4��A�*

Training_loss`��B;"'{$       B+�M	�5P4��A�*

Training_lossm��B�U�/$       B+�M	��P4��A�*

Training_loss��B� ��$       B+�M	C��P4��A�*

Training_lossx�B��$       B+�M	s�YQ4��A�*

Training_lossqrC4�D$       B+�M	�ԾQ4��A�*

Training_lossh6C�S*@$       B+�M	��R4��A�*

Training_lossL��B�_��$       B+�M	��wR4��A�*

Training_loss~�B<�A($       B+�M	U0�R4��A�*

Training_losso�B8��$       B+�M	�2S4��A�*

Training_loss�ZB,즉$       B+�M	m��S4��A�*

Training_loss՛B��Â$       B+�M	�&�S4��A�*

Training_loss8B�BJ[�$       B+�M	GqPT4��A�*

Training_loss���B�a$       B+�M	eìT4��A�*

Training_loss���B7���$       B+�M	�7U4��A�*

Training_lossA�B%qʍ$       B+�M	��lU4��A�*

Training_loss"�B{ǁ�$       B+�M	���U4��A�*

Training_loss��B��m$       B+�M	�v&V4��A�*

Training_loss�v�B$��,$       B+�M	�5�V4��A�*

Training_loss���BW���$       B+�M	�v�V4��A�*

Training_loss]��BY���$       B+�M	d[DW4��A�*

Training_lossl�B���$       B+�M	�,�W4��A�*

Training_loss�k�B�W+�$       B+�M	7X4��A�*

Training_loss��BV�_$       B+�M	�AgX4��A�*

Training_loss��5B�/��$       B+�M	��X4��A�*

Training_loss�L�B�u	�$       B+�M	/M Y4��A�*

Training_loss�]�B�/Cp$       B+�M	0*}Y4��A�*

Training_loss͍�BV���*       ����	�� Z4��A�*

Validation_accuracy��f?d}��&       sO� 	�� Z4��A�*

Validation_loss��B;\ʁ$       B+�M	Z�\Z4��A�*

Training_loss���B���$       B+�M	���Z4��A�*

Training_loss���B��B$       B+�M		[4��A�*

Training_loss��B���$       B+�M	��p[4��A�*

Training_loss�lB����$       B+�M	V��[4��A�*

Training_loss(B�B�W�$       B+�M	z6)\4��A�*

Training_losstB�^"$       B+�M	)z�\4��A�*

Training_loss~!�BM��$       B+�M	�\4��A�*

Training_lossN�A[~$       B+�M	&]4��A�*

Training_loss��B�tN�$       B+�M	��d]4��A�*

Training_loss�h�Bj��b$       B+�M	���]4��A�*

Training_lossH��B�خ�$       B+�M	Ϟ^4��A�*

Training_lossB�7$       B+�M	��x^4��A�*

Training_loss|h�B��"$       B+�M	���^4��A�*

Training_lossMBpy)$       B+�M	^�2_4��A�*

Training_loss��B��6$       B+�M	<��_4��A�*

Training_lossu�BRI��$       B+�M	�3�_4��A�*

Training_loss@9�B��,$       B+�M	��G`4��A�*

Training_losso�BN�S�$       B+�M	[�`4��A�*

Training_loss:�BP��$       B+�M	Za4��A�*

Training_loss�ZB�]$       B+�M	>\]a4��A�*

Training_loss	W�BBL�$       B+�M	��a4��A�*

Training_loss��B�4t�$       B+�M	�b4��A�*

Training_loss�A�B�y�$       B+�M	�rb4��A�*

Training_losshJdB��$       B+�M	m��b4��A�*

Training_lossJ��B��V$       B+�M	�+c4��A�*

Training_loss�*�B*�$       B+�M	��c4��A�*

Training_loss���BQ�c�$       B+�M	���c4��A�*

Training_loss;E�B ��$       B+�M	��Qd4��A�*

Training_loss��B���$       B+�M	4d�d4��A�*

Training_loss��B���$       B+�M	r�e4��A�*

Training_loss���BvF'$       B+�M	
ye4��A�*

Training_loss��B��4X$       B+�M	 ��e4��A�*

Training_loss�C�u�$       B+�M	� ;f4��A�*

Training_loss^��B�=5g*       ����	��f4��A�*

Validation_accuracy��f?�Km&       sO� 	�
�f4��A�*

Validation_loss@|�Bu]�$       B+�M	�s%g4��A�*

Training_loss5 �B�~�4$       B+�M	ևg4��A�*

Training_loss�U�B�$       B+�M	�e�g4��A�*

Training_losse7�B��$       B+�M	
Gh4��A�*

Training_loss��B¸�/$       B+�M	�T�h4��A�*

Training_lossR�
CK��$       B+�M	_�i4��A�*

Training_lossϡB�I� $       B+�M	�ii4��A�*

Training_loss�}BB�f��$       B+�M	���i4��A�*

Training_loss+�BU�X�$       B+�M	H�i4��A�*

Training_loss�A�(I�*       ����	��kj4��A�*

Validation_accuracy��f?�q��&       sO� 	H�kj4��A�*

Validation_loss�сBS��: