       �K"	  �g���Abrain.Event:2�0�u7     ,4+3	5��g���A"��
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
: "n"Pt}\     ��#	��g���AJ�
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
output/b_out:0output/b_out/Assignoutput/b_out/read:0뿲?#       ��wC	q�h���A*

Training_loss���CK�ɿ#       ��wC	�ah���A*

Training_losslg�C�N��#       ��wC	w�h���A*

Training_loss�@�C�=��#       ��wC	�i���A*

Training_loss�J�C�^�
#       ��wC	-\xi���A*

Training_loss�p�C�EF�#       ��wC	���i���A*

Training_loss�D�CAPs#       ��wC	W{2j���A*

Training_loss��C����#       ��wC	��j���A*

Training_loss�\C��-1#       ��wC	b��j���A	*

Training_loss~J�CM��#       ��wC	��bk���A
*

Training_loss���C �#       ��wC	�2�k���A*

Training_lossZFC+0 r#       ��wC	%l���A*

Training_loss�Cj�E#       ��wC	�Z�l���A*

Training_loss��}C|��#       ��wC	�P�l���A*

Training_loss�/_Ck�xi#       ��wC	ڭEm���A*

Training_loss��'C�]d�#       ��wC	�m���A*

Training_lossh�(C�]*#       ��wC	l�m���A*

Training_loss�V>C|�$#       ��wC	�K[n���A*

Training_loss�j9C���#       ��wC	9��n���A*

Training_loss�5VCb��Q#       ��wC	*�o���A*

Training_lossW&C1��@#       ��wC	e�uo���A*

Training_loss���CA�#       ��wC	T:�o���A*

Training_loss2�DC���#       ��wC	q�/p���A*

Training_loss;*C���#       ��wC	<�p���A*

Training_loss"�C@�b�#       ��wC	zp�p���A*

Training_loss��JC�`�#       ��wC	G�Tq���A*

Training_loss�C�,D�#       ��wC	���q���A*

Training_loss4CU���#       ��wC	��%r���A*

Training_loss�Cm��z#       ��wC	�r���A*

Training_loss�|CKg#       ��wC	��r���A*

Training_loss��5C��T�#       ��wC	�Bs���A*

Training_lossICU���#       ��wC	�(�s���A *

Training_lossn�&C�֑#       ��wC	{�s���A!*

Training_loss�$�B�;�#       ��wC	��!t���A"*

Training_loss�4B2{)       7�_ 	���t���A"*

Validation_accuracy�Xa?bn%       �6�	��t���A"*

Validation_loss�t�Bx(ѻ#       ��wC	Q@u���A#*

Training_lossM�B����#       ��wC	kf�u���A$*

Training_loss��"C�H�#       ��wC	IGv���A%*

Training_loss�C{��B#       ��wC	I�tv���A&*

Training_lossT�/C��#       ��wC	�@�v���A'*

Training_lossZC�3?|#       ��wC	�65w���A(*

Training_loss_CC�#       ��wC	���w���A)*

Training_loss�z�Bf(1#       ��wC	B�w���A**

Training_loss)N!Co�#       ��wC	�"`x���A+*

Training_loss~�CQ�#       ��wC	<��x���A,*

Training_loss̀!C��H�#       ��wC		3&y���A-*

Training_lossZPLC���{#       ��wC	�ކy���A.*

Training_loss�FC	5��#       ��wC	�a�y���A/*

Training_loss�C=���#       ��wC	�Hz���A0*

Training_lossԃ�B�E#       ��wC	FA�z���A1*

Training_loss�ڗB�jM�#       ��wC	7�{���A2*

Training_lossb��B2cl.#       ��wC	/6�{���A3*

Training_lossu�0C��K?#       ��wC	X<�{���A4*

Training_lossu�B~���#       ��wC	�MQ|���A5*

Training_loss��C��)h#       ��wC	�Z�|���A6*

Training_loss��2C@�#       ��wC	I.}���A7*

Training_lossT�B�wA#       ��wC	��t}���A8*

Training_loss.h0CMw�q#       ��wC	��}���A9*

Training_loss���B�(sS#       ��wC	>~���A:*

Training_loss��C��##       ��wC	ڦ~���A;*

Training_loss{DC}$4#       ��wC	�����A<*

Training_loss�-C����#       ��wC	R�}���A=*

Training_loss R�B���#       ��wC	�����A>*

Training_loss��C4���#       ��wC	�N����A?*

Training_lossC7C��)#       ��wC	f������A@*

Training_loss�~�Bn?�B#       ��wC	������AA*

Training_lossF<C�ЬC#       ��wC	Xoo����AB*

Training_loss�� Ct�k�#       ��wC	�c΁���AC*

Training_loss���BYzh�#       ��wC	��.����AD*

Training_loss�I�B��y%)       7�_ 	�ɂ���AD*

Validation_accuracy(vc?�:�%       �6�	��ɂ���AD*

Validation_loss�-�B?S��#       ��wC	��+����AE*

Training_loss&�B����#       ��wC	������AF*

Training_loss�]C*6��#       ��wC	�냽��AG*

Training_loss���B,B�6#       ��wC	��J����AH*

Training_loss��B���h#       ��wC	c������AI*

Training_loss��	C�QAd#       ��wC	l����AJ*

Training_loss�z8C�$v�#       ��wC	�����AK*

Training_lossb��B�fj#       ��wC	�慽��AL*

Training_loss�CY��>#       ��wC	&�I����AM*

Training_lossOCf#�#       ��wC	s������AN*

Training_loss��(C/h�.#       ��wC	��)����AO*

Training_losssW,C.�#       ��wC	�[�����AP*

Training_loss���B���k#       ��wC	�#��AQ*

Training_loss���BZG2#       ��wC	�\S����AR*

Training_loss�7�B�¨�#       ��wC	0�����AS*

Training_loss`%�B|�̮#       ��wC	.����AT*

Training_loss_��Bh��#       ��wC	B�~����AU*

Training_loss%�C���#       ��wC	/䉽��AV*

Training_loss(�C�v�#       ��wC	�H����AW*

Training_loss���Br���#       ��wC	�y�����AX*

Training_loss>�C���#       ��wC	�M����AY*

Training_lossY�C�܍#       ��wC	�p����AZ*

Training_loss�O�BѴ��#       ��wC	F\؋���A[*

Training_loss3��BE���#       ��wC	��:����A\*

Training_lossb�B��#       ��wC	�Q�����A]*

Training_loss� �BY�#       ��wC	M����A^*

Training_loss���B(Υe#       ��wC	�d����A_*

Training_loss�>�B�ظ	#       ��wC	(ƍ���A`*

Training_loss��Cc4�#       ��wC	��(����Aa*

Training_lossp�B�u��#       ��wC	�3�����Ab*

Training_loss��B�Q �#       ��wC	�����Ac*

Training_loss���B��m�#       ��wC	�_����Ad*

Training_loss�_�B�Yq=#       ��wC		������Ae*

Training_lossk��Bj��/#       ��wC	W
!����Af*

Training_loss��Bp\�)       7�_ 	�(�����Af*

Validation_accuracy�g?�D��%       �6�	�+�����Af*

Validation_lossԦxB#R("#       ��wC	��H����Ag*

Training_loss�C��W�#       ��wC	�Ol����Ah*

Training_loss���A��#       ��wC	�i͑���Ai*

Training_loss�C=2�#       ��wC	�/����Aj*

Training_lossE��B����#       ��wC	ũ�����Ak*

Training_lossLm�BK���#       ��wC	�����Al*

Training_lossB2�B��/#       ��wC	O"R����Am*

Training_loss���B^�1�#       ��wC	3Q�����An*

Training_loss{]�B�F�;#       ��wC	f�����Ao*

Training_loss�B��4�#       ��wC	t����Ap*

Training_loss��CJl�#       ��wC	#�Ҕ���Aq*

Training_loss(�B�Zf#       ��wC	��/����Ar*

Training_loss'7C{@r#       ��wC	Q������As*

Training_loss���B�SX5#       ��wC	kD���At*

Training_lossD�CqdQk#       ��wC	GO����Au*

Training_loss��&C��#       ��wC	𥳐���Av*

Training_lossF��B��#       ��wC	�
����Aw*

Training_loss���B�t(u#       ��wC		�o����Ax*

Training_loss0@C�ݫ#       ��wC	=З���Ay*

Training_loss���BJf8�#       ��wC	Dm-����Az*

Training_lossٕ�B/:�k#       ��wC	�d�����A{*

Training_loss���B,\�}#       ��wC	Ę瘽��A|*

Training_lossm�C`�#       ��wC	�hE����A}*

Training_loss*��B��!#       ��wC	�������A~*

Training_loss�C�)�#       ��wC	�����A*

Training_loss��B�b/H$       B+�M	wI]����A�*

Training_loss���Brؠ�$       B+�M	]߹����A�*

Training_lossS6�B�LR$       B+�M	�E����A�*

Training_loss:�B7<ٮ$       B+�M	�Pr����A�*

Training_loss���B/��6$       B+�M	�ϛ���A�*

Training_lossI_
Cw���$       B+�M	-����A�*

Training_loss}x�B�6p$       B+�M	�߉����A�*

Training_losse,�B��,$       B+�M	q�윽��A�*

Training_loss6�B)g�-$       B+�M	�{L����A�*

Training_loss�k�BC��$*       ����	K�ҝ���A�*

Validation_accuracy��e?xi�9&       sO� 	��ҝ���A�*

Validation_loss� xB9�0$       B+�M	q�w����A�*

Training_lossl��B)���$       B+�M	�s՞���A�*

Training_losscn�BO�)�$       B+�M	o������A�*

Training_loss%�B���$       B+�M	��\����A�*

Training_loss�\�Bvf7v$       B+�M	��ş���A�*

Training_loss�B"J$       B+�M	��!����A�*

Training_loss�v�B^�V$       B+�M	>́����A�*

Training_lossn�B'�
\$       B+�M	I�ݠ���A�*

Training_loss:�B⩌5$       B+�M	�:����A�*

Training_losst��B���$       B+�M	�D�����A�*

Training_loss*�%C�y�$       B+�M	�s�����A�*

Training_loss���B�?�$       B+�M	�GT����A�*

Training_lossUi C;n$       B+�M	ݘ�����A�*

Training_loss�^B���$       B+�M	2:����A�*

Training_loss�5�B%;�.$       B+�M	�j����A�*

Training_loss��B�D67$       B+�M	z�ƣ���A�*

Training_lossCv�B49�#$       B+�M	0�%����A�*

Training_lossj1lB�~=�$       B+�M	�������A�*

Training_loss?��B�^J�$       B+�M	Tn᤽��A�*

Training_loss�f�Bh��$       B+�M	7A����A�*

Training_loss��B}�k�$       B+�M	����A�*

Training_loss4H�B�L	>$       B+�M	*�����A�*

Training_loss�g�B���t$       B+�M	�yl����A�*

Training_loss��B}�[S$       B+�M	t�Ц���A�*

Training_loss��C��6�$       B+�M	�y1����A�*

Training_loss1�C�f^�$       B+�M	�1�����A�*

Training_loss*�BQH�$       B+�M	{짽��A�*

Training_loss��B0��3$       B+�M	̙L����A�*

Training_loss@A�B�~E$       B+�M	0/�����A�*

Training_lossɏB�M��$       B+�M	������A�*

Training_loss��C�e7$       B+�M	��{����A�*

Training_loss��B/�$       B+�M	�٩���A�*

Training_lossE7C�<�($       B+�M	<�5����A�*

Training_loss��>C�Q�$       B+�M	D�����A�*

Training_lossx��BXx��*       ����	� ����A�*

Validation_accuracy(�f?q�1�&       sO� 	�� ����A�*

Validation_lossD�{Ba��:$       B+�M	1	ͫ���A�*

Training_loss��=CGW$       B+�M	��,����A�*

Training_lossúC��d�$       B+�M	p|�����A�*

Training_lossA��B�H�]$       B+�M	p}�����A�*

Training_loss�d@B߰�g$       B+�M	������A�*

Training_loss�$�B���K$       B+�M	mr����A�*

Training_loss�)�B.�w.$       B+�M	�j٭���A�*

Training_loss���Bj;�$       B+�M	)�8����A�*

Training_loss7^<CS9�$       B+�M	񕮽��A�*

Training_lossf~ C��JW$       B+�M	F(���A�*

Training_loss'��BG��w$       B+�M	��O����A�*

Training_lossHC�B����$       B+�M	�=�����A�*

Training_loss̠�B�)q$$       B+�M	�?����A�*

Training_loss�E	C<�L$       B+�M	�Fh����A�*

Training_loss���B����$       B+�M	:uư���A�*

Training_loss�ӵB�fqP$       B+�M	�>#����A�*

Training_loss��VB�@�$       B+�M	�������A�*

Training_lossf�C���$       B+�M	�ޱ���A�*

Training_lossә�B�&{�$       B+�M	" <����A�*

Training_loss���B�#�$       B+�M	�ʙ����A�*

Training_lossx�Bn��<$       B+�M	�������A�*

Training_lossrwCm�C$       B+�M	Pl����A�*

Training_loss��B��2&$       B+�M	6Zγ���A�*

Training_loss��B7m4$       B+�M	�O����A�*

Training_loss��B\�e�$       B+�M	|+ϴ���A�*

Training_loss��Bѕ)r$       B+�M	D����A�*

Training_loss"y�BBɜ$       B+�M	������A�*

Training_lossҏ�B����$       B+�M	�u����A�*

Training_lossoO�Bp�4�$       B+�M	Y6z����A�*

Training_loss���B���$       B+�M	��ڶ���A�*

Training_loss䩾Bk�C�$       B+�M	�=����A�*

Training_losst��B����$       B+�M	�������A�*

Training_loss�B�%{+$       B+�M	�7�����A�*

Training_loss�o�B�h�$       B+�M	+/_����A�*

Training_loss�S�Bͤ|�*       ����	ߧ�����A�*

Validation_accuracy(vg?R0)�&       sO� 	������A�*

Validation_loss�kB6J�r$       B+�M	������A�*

Training_loss��Bcv��$       B+�M	�.%����A�*

Training_loss���B��M0$       B+�M	.8�����A�*

Training_loss���B�~A�$       B+�M	庽��A�*

Training_loss��B��CU$       B+�M	�����A�*

Training_loss��DB��%�$       B+�M	Dj}����A�*

Training_loss���BM�	$       B+�M	�滽��A�*

Training_loss�	�B�g��$       B+�M	��S����A�*

Training_loss�b�Bh���$       B+�M	�軼���A�*

Training_loss��B�Y�{$       B+�M	c����A�*

Training_loss�B��З$       B+�M	3�y����A�*

Training_loss���BD�+$       B+�M	�������A�*

Training_loss"ݴB��T�$       B+�M	��W����A�*

Training_loss
Q�B�mO$       B+�M	�������A�*

Training_loss��B�1��$       B+�M	l\?����A�*

Training_lossE?�B�>�e$       B+�M	I0ƿ���A�*

Training_lossp֫B����$       B+�M	�@����A�*

Training_loss�u�BϷ޲$       B+�M	i�����A�*

Training_loss8��BѬ[$       B+�M	��;����A�*

Training_loss*��B�#�p$       B+�M	�_�����A�*

Training_loss�B2�$       B+�M	� ½��A�*

Training_loss���B�$       B+�M	I��½��A�*

Training_loss%�eB�w�}$       B+�M	��½��A�*

Training_loss���B��-�$       B+�M	C�Rý��A�*

Training_loss85�B=HD$       B+�M	���ý��A�*

Training_loss���B=3u�$       B+�M	�rĽ��A�*

Training_lossF2�B6�C�$       B+�M	!�Ľ��A�*

Training_loss��B��$       B+�M	��Ľ��A�*

Training_loss���B�� e$       B+�M	nimŽ��A�*

Training_loss�,�B��ۿ$       B+�M	\!�Ž��A�*

Training_loss��
C��a$       B+�M	�TBƽ��A�*

Training_loss�J C�DQ$       B+�M	�)�ƽ��A�*

Training_lossΒ�B�V0 $       B+�M	</ǽ��A�*

Training_loss��BӀQ�$       B+�M	<yǽ��A�*

Training_loss�CM�*       ����	��Ƚ��A�*

Validation_accuracy(�g?&       sO� 	��Ƚ��A�*

Validation_loss��oBiZ�$       B+�M	f��Ƚ��A�*

Training_loss��B6@|$       B+�M	�)ɽ��A�*

Training_loss ��B�'�$       B+�M	���ɽ��A�*

Training_lossTf�B��?$       B+�M	֍�ɽ��A�*

Training_lossz�B-��*$       B+�M	��Hʽ��A�*

Training_loss��B��4$       B+�M	��oʽ��A�*

Training_loss��%B%k2$       B+�M	b�ʽ��A�*

Training_loss��CAqG�$       B+�M	�[˽��A�*

Training_loss���B�ʑ$$       B+�M	���˽��A�*

Training_loss�ȭBw�$       B+�M	ͯ$̽��A�*

Training_lossF��B+��9$       B+�M	p>�̽��A�*

Training_loss�K�B'�K}$       B+�M	�a�̽��A�*

Training_loss�W�BF�M�$       B+�M	�K[ͽ��A�*

Training_loss"d�B��$       B+�M	0�ͽ��A�*

Training_lossb��BW�e-$       B+�M	�pν��A�*

Training_loss0ϩB,-�S$       B+�M	]S�ν��A�*

Training_lossI:�B\ѻ$       B+�M	j��ν��A�*

Training_lossR��Bս$       B+�M	��XϽ��A�*

Training_loss,�(C���V$       B+�M	�/�Ͻ��A�*

Training_loss4�BE��$       B+�M	�2$н��A�*

Training_loss���B���$       B+�M	9�н��A�*

Training_lossd�B%�k$       B+�M	�F�н��A�*

Training_lossTU�B�1�$       B+�M	��Wѽ��A�*

Training_loss���B��3$       B+�M	���ѽ��A�*

Training_loss��B,�W�$       B+�M	0�,ҽ��A�*

Training_loss�iB0:�g$       B+�M	��ҽ��A�*

Training_loss��C���"$       B+�M	l_�ҽ��A�*

Training_loss��cB_be�$       B+�M	��hӽ��A�*

Training_lossi=�B�\��$       B+�M	Hm�ӽ��A�*

Training_lossښ�B��$       B+�M	�AԽ��A�*

Training_loss��
C�E$       B+�M	5}�Խ��A�*

Training_loss�u�B���$       B+�M	�qս��A�*

Training_loss	C��.�$       B+�M	�hmս��A�*

Training_loss�S�B�"K"$       B+�M	yY�ս��A�*

Training_loss��B��l*       ����	�VZֽ��A�*

Validation_accuracy(�g?}8��&       sO� 	�XZֽ��A�*

Validation_loss�hBu"��$       B+�M	6x6׽��A�*

Training_loss�7�BOo*[$       B+�M	��׽��A�*

Training_loss3эB Ɍ�$       B+�M	��ؽ��A�*

Training_loss!�BJ��$       B+�M	W�uؽ��A�*

Training_loss K�BY���$       B+�M	V�ؽ��A�*

Training_loss�N�BY/{$       B+�M	�4Fٽ��A�*

Training_loss��BS�q�$       B+�M	�oٽ��A�*

Training_lossȳB���%$       B+�M	���ٽ��A�*

Training_loss�B9Ŭ$       B+�M	��Fڽ��A�*

Training_loss|0�BYR
�$       B+�M	\V�ڽ��A�*

Training_lossx��Bs�[�$       B+�M	�g-۽��A�*

Training_loss�CyB;Ô$       B+�M	��۽��A�*

Training_loss��B�3�$       B+�M	�%�۽��A�*

Training_loss��B�\�$       B+�M	�l\ܽ��A�*

Training_lossB#�B��(A$       B+�M	���ܽ��A�*

Training_loss��C#�h�$       B+�M	�'ݽ��A�*

Training_lossp7C?HfV$       B+�M	g��ݽ��A�*

Training_loss<��B�֗E$       B+�M	X��ݽ��A�*

Training_loss��B�b��$       B+�M	ėl޽��A�*

Training_loss�	�B ǚN$       B+�M	���޽��A�*

Training_loss�'�B�Ј�$       B+�M	�N߽��A�*

Training_loss��C3R�.$       B+�M	`��߽��A�*

Training_loss:�B�d��$       B+�M	23���A�*

Training_loss��B��a$       B+�M	bN����A�*

Training_loss�Z�B[���$       B+�M	�����A�*

Training_loss�V�B�dq	$       B+�M	�Uc���A�*

Training_loss�2B�S$       B+�M	������A�*

Training_loss�B�'_�$       B+�M	��/���A�*

Training_loss��B,��$       B+�M	�T����A�*

Training_lossxa�B�$       B+�M	����A�*

Training_lossh��B��c$       B+�M	=b���A�*

Training_loss
��Bӭ$       B+�M	�����A�*

Training_loss@�xB�L��$       B+�M	r"���A�*

Training_lossr}�B�:�$       B+�M	X����A�*

Training_lossB(�B	�YP*       ����	U.���A�*

Validation_accuracy(�g?���\&       sO� 	1���A�*

Validation_loss��[B�X�i$       B+�M	!@����A�*

Training_loss�٘B��^$       B+�M	�U���A�*

Training_loss�#�BV�D�$       B+�M	W_����A�*

Training_loss��C�$       B+�M	p����A�*

Training_loss�lB�%�"$       B+�M	$ӊ���A�*

Training_loss���Bte�$       B+�M	��	���A�*

Training_lossN��B�d�$       B+�M	|�����A�*

Training_loss���B��3	$       B+�M	3����A�*

Training_lossr��A�0�.$       B+�M	��	���A�*

Training_lossXr�Bǲ�%$       B+�M	H�h���A�*

Training_loss��B�o$       B+�M	`�����A�*

Training_lossͿ�B"c��$       B+�M	��R���A�*

Training_lossz»B��]�$       B+�M	�����A�*

Training_loss5 �B�st$       B+�M	�85���A�*

Training_loss�{B���$       B+�M	�����A�*

Training_lossB�=ֱ$       B+�M	v����A�*

Training_loss^6�B\�'-$       B+�M	��`���A�*

Training_loss⨤B�*"�$       B+�M	ё����A�*

Training_loss�0�B�50$       B+�M	�M'����A�*

Training_loss6>�B+�-$       B+�M	�_�����A�*

Training_loss�� C��h0$       B+�M	�a�����A�*

Training_lossԺ�B7��$       B+�M	�
E���A�*

Training_loss���B�z��$       B+�M	�w����A�*

Training_loss��B�ݦ�$       B+�M	d����A�*

Training_losskf�BG��$       B+�M	{�d���A�*

Training_loss#+�BW.�=$       B+�M	������A�*

Training_loss^�[BA��J$       B+�M	6r6���A�*

Training_loss��|Bۙ#J$       B+�M	q����A�*

Training_lossƪnB�76'$       B+�M	��
���A�*

Training_loss��B+df$       B+�M	0m���A�*

Training_loss s�B�9��$       B+�M	������A�*

Training_loss��BB�l$       B+�M	�3���A�*

Training_lossju�B`�4�$       B+�M	Po����A�*

Training_losspC�R�$       B+�M	B����A�*

Training_loss�$�BB�=U*       ����	y�����A�*

Validation_accuracy(�g?L�J�&       sO� 	k�����A�*

Validation_loss�DhB��+�$       B+�M	�ڗ����A�*

Training_loss��C鲤d$       B+�M	�8�����A�*

Training_loss��Cn��$       B+�M	&sZ����A�*

Training_loss�o�BuZ��$       B+�M	c|�����A�*

Training_loss�C�e�S$       B+�M	Ό!����A�*

Training_loss���BXZ�$       B+�M	�f�����A�*

Training_loss�_�BISJf$       B+�M	�]�����A�*

Training_lossP�4BrI�$       B+�M	eR[����A�*

Training_loss�|C����$       B+�M	gF�����A�*

Training_loss��IBe�m�$       B+�M	@������A�*

Training_loss��B���]$       B+�M	�q[����A�*

Training_loss��B|L�$       B+�M	�������A�*

Training_loss3/C��$       B+�M	��$����A�*

Training_loss���B�;=$       B+�M	�������A�*

Training_loss���B�4$       B+�M	�������A�*

Training_loss�ʝB���($       B+�M	�M����A�*

Training_loss��BԤ��$       B+�M	76�����A�*

Training_lossu�xB4I3$       B+�M	v�����A�*

Training_loss�A�Bj��$       B+�M	6�{����A�*

Training_loss�qCi�$       B+�M	�r�����A�*

Training_loss&6�B 7�$       B+�M	�Y����A�*

Training_loss��B<��$       B+�M	������A�*

Training_losst��BE� ]$       B+�M	L�����A�*

Training_loss��B�Z�$       B+�M	-]�����A�*

Training_loss�HRB�/r�$       B+�M	�N�����A�*

Training_lossu��B/<��$       B+�M	�H����A�*

Training_loss`�B���$       B+�M	������A�*

Training_loss�/�B��b$       B+�M	�)����A�*

Training_loss�	�B�MLN$       B+�M	�$m����A�*

Training_loss q�B��'�$       B+�M	*�����A�*

Training_loss��B�4�,$       B+�M	��< ���A�*

Training_lossOC� �$       B+�M	Ӝ ���A�*

Training_lossP̶B�8E�$       B+�M	�� ���A�*

Training_loss�}�B
?��$       B+�M	��d���A�*

Training_loss@6�B����*       ����	�����A�*

Validation_accuracy�i?�X�&       sO� 	;�����A�*

Validation_loss<�bBfL�$       B+�M	i ����A�*

Training_lossZ� C�O��$       B+�M	/5H���A�*

Training_loss�>�B9�Y$       B+�M	l^����A�*

Training_loss�;�B�;[.$       B+�M	�	���A�*

Training_loss��BL2��$       B+�M	V�n���A�*

Training_lossܾB�jb$       B+�M	D����A�*

Training_lossЫ�BS�Fk$       B+�M	��7���A�*

Training_loss�I C)q�$       B+�M	J����A�*

Training_loss�E�B���$       B+�M	������A�*

Training_loss菑B27�$       B+�M	z5���A�*

Training_loss4�uB�5F�$       B+�M	�v���A�*

Training_loss#v�B��Dm$       B+�M	�����A�*

Training_loss���B�_O�$       B+�M	��3���A�*

Training_loss6��B���$       B+�M	ۧ����A�*

Training_loss`��B�l�o$       B+�M	�T����A�*

Training_loss˩B�Lb�$       B+�M	p�M���A�*

Training_loss�'�Bݺ�$       B+�M	)Z����A�*

Training_loss��B�Ϋ$       B+�M		2	���A�*

Training_loss���B����$       B+�M	�{i	���A�*

Training_loss���B�h?$       B+�M	<��	���A�*

Training_loss�8hB�.�$       B+�M	��&
���A�*

Training_loss�-nBt.��$       B+�M	��
���A�*

Training_loss���BE�nZ$       B+�M	���
���A�*

Training_lossp1�B�x��$       B+�M	cbB���A�*

Training_loss��B��O�$       B+�M	�V����A�*

Training_loss �B���$       B+�M	�����A�*

Training_loss�ȦB���_$       B+�M	<\���A�*

Training_losszǚB��$       B+�M	+�����A�*

Training_lossɹ�BN+$b$       B+�M	�'���A�*

Training_lossU�B�G�$       B+�M	�"w���A�*

Training_loss؃�B�u��$       B+�M	l!����A�*

Training_loss\
�B;�<$       B+�M	�5���A�*

Training_loss\{iB�b-�$       B+�M	������A�*

Training_loss�UkBf1p$       B+�M	�����A�*

Training_loss2طB=U�*       ����	�?{���A�*

Validation_accuracy(vh?2�q&       sO� 	�A{���A�*

Validation_loss5�TB,{ۛ$       B+�M	��X���A�*

Training_loss5��B����$       B+�M	�����A�*

Training_loss��iB�m�$       B+�M	����A�*

Training_loss���B��
$       B+�M	`Vs���A�*

Training_loss0E�B��7$       B+�M	�����A�*

Training_loss��PB��=	$       B+�M	�P/���A�*

Training_loss�"�B^�$       B+�M	�8����A�*

Training_loss��B�ֺ�$       B+�M	�����A�*

Training_lossc�B�`�$       B+�M	Q�K���A�*

Training_loss�p�BW�2N$       B+�M	g����A�*

Training_loss&��B�q��$       B+�M	)A����A�*

Training_loss�rB�S�$       B+�M	o-���A�*

Training_loss�e�B��6�$       B+�M	+j����A�*

Training_loss/��B�%R$       B+�M	�t����A�*

Training_loss_pB;i*$       B+�M	k�H���A�*

Training_loss8T�B�YS�$       B+�M	8H����A�*

Training_loss�N�B���$       B+�M	$����A�*

Training_lossj�B5� �$       B+�M	�5e���A�*

Training_loss �B�*�>$       B+�M	������A�*

Training_loss*��B1�L�$       B+�M	�#���A�*

Training_loss��BFT~r$       B+�M	������A�*

Training_loss.��BoA��$       B+�M		�����A�*

Training_loss9>�B�ĝ$       B+�M	S�>���A�*

Training_lossw��B�[�$       B+�M	#�����A�*

Training_lossݟB����$       B+�M	�O����A�*

Training_loss)��B���$       B+�M	��Y���A�*

Training_loss�k%B`���$       B+�M	������A�*

Training_losssոBP>�$       B+�M	�����A�*

Training_loss.�dB����$       B+�M	L�u���A�*

Training_loss�7�B]�F$       B+�M	-^����A�*

Training_loss� �B\/Z$       B+�M	i2���A�*

Training_loss8�B�� �$       B+�M	wې���A�*

Training_loss�IBB�m�$       B+�M	u�����A�*

Training_loss���B0��:$       B+�M	��N���A�*

Training_lossD�C�~$*       ����	 �����A�*

Validation_accuracy�i?�vEU&       sO� 	�����A�*

Validation_loss�JYB�L�|$       B+�M	�9����A�*

Training_loss�*�B'}�&$       B+�M	p����A�*

Training_lossQ��B7$       B+�M	D0w���A�*

Training_losskC-!H�$       B+�M	�p����A�*

Training_lossA��BE�$       B+�M	��?���A�*

Training_loss���Ar#$       B+�M	ͮ����A�*

Training_loss�.BZ�_�$       B+�M	������A�*

Training_loss$��B��_�$       B+�M	��\ ���A�*

Training_loss%�B���h$       B+�M	W� ���A�*

Training_loss���B�0�$       B+�M		!���A�*

Training_loss^��Bຓ$       B+�M	�u|!���A�*

Training_loss��C����$       B+�M	�!���A�*

Training_loss*�WB;���$       B+�M	X	"���A�*

Training_lossu�B_|Hg$       B+�M	l
k"���A�*

Training_loss�$�B6\ҭ$       B+�M	��"���A�*

Training_lossh�B�p,�$       B+�M	��1#���A�*

Training_loss��B���%$       B+�M	��#���A�*

Training_loss���B�x��$       B+�M	jg�#���A�*

Training_lossS B���$       B+�M	�YZ$���A�*

Training_loss���B&K0$       B+�M	V��$���A�*

Training_lossÛdBL�m$       B+�M	vl@%���A�*

Training_lossXw`B�K��$       B+�M	�y�%���A�*

Training_lossnw�B2���$       B+�M	nM"&���A�*

Training_loss���B�:z$       B+�M	��&���A�*

Training_lossk0BN�Ф$       B+�M	�� '���A�*

Training_loss�gcB�$lk$       B+�M	��p'���A�*

Training_loss��_B@N45$       B+�M	p��'���A�*

Training_loss��tB�:($       B+�M	t�X(���A�*

Training_lossD+<Be>R�$       B+�M	���(���A�*

Training_losss"kB'�$E$       B+�M	��U)���A�*

Training_loss��!B㲔i$       B+�M	���)���A�*

Training_loss��B�w&r$       B+�M	d�,*���A�*

Training_loss��dB�#Y�$       B+�M	���*���A�*

Training_lossfm�BJ"��$       B+�M	�G
+���A�*

Training_lossX�B��X�*       ����	}��+���A�*

Validation_accuracy�i?f!4o&       sO� 	��+���A�*

Validation_loss��SBD�j�$       B+�M	��,���A�*

Training_loss/�B�O�}$       B+�M	=I+-���A�*

Training_loss��B��b$       B+�M	fO�-���A�*

Training_loss(��Bd���$       B+�M	���-���A�*

Training_loss̖�BB<q$       B+�M	�S.���A�*

Training_lossZьBk}$I$       B+�M	�>�.���A�*

Training_loss�<�B��$       B+�M	�/���A�*

Training_loss�BjO�]$       B+�M	_�j/���A�*

Training_loss1�Bi�֓$       B+�M	K�/���A�*

Training_loss���B��$       B+�M	��&0���A�*

Training_lossx�B��i$       B+�M	N_�0���A�*

Training_lossD��B�ʊ$       B+�M	�U�0���A�*

Training_loss/A
C��v�$       B+�M	.U	1���A�*

Training_loss$��A��A�$       B+�M	Nbg1���A�*

Training_lossQTBl�n\$       B+�M	��1���A�*

Training_loss���B7ú$       B+�M	�.2���A�*

Training_loss�$HB�%�$       B+�M	�b�2���A�*

Training_loss��B���$       B+�M	�2���A�*

Training_loss�'CX�$       B+�M	"W3���A�*

Training_loss�5�B�"�$       B+�M	�$�3���A�*

Training_loss��lB}�:$       B+�M	֌4���A�*

Training_loss2�BHf$       B+�M	�}4���A�*

Training_loss<B��(e$       B+�M	�x�4���A�*

Training_loss\��B�jA$       B+�M	8R5���A�*

Training_loss�h�B���$       B+�M	�ù5���A�*

Training_loss���B<�d$       B+�M	X�6���A�*

Training_loss"ZSBn���$       B+�M	O�6���A�*

Training_loss���B_80�$       B+�M	�L�6���A�*

Training_loss�kB��)$       B+�M	�TJ7���A�*

Training_lossN^�B����$       B+�M	�+�7���A�*

Training_loss8�kB#;�$       B+�M	�8���A�*

Training_loss�umB�R$       B+�M	��h8���A�*

Training_loss#g�Bj]�^$       B+�M	���8���A�*

Training_loss��B���$       B+�M	B�29���A�*

Training_loss�œBV9�*       ����	��9���A�*

Validation_accuracy�j?����&       sO� 	��9���A�*

Validation_loss�JB�+$       B+�M	㦷:���A�*

Training_lossY��B�g"$       B+�M	�;���A�*

Training_loss�ݍB;�2<$       B+�M	�s;���A�*

Training_loss��B� =$       B+�M	�[�;���A�*

Training_loss���B!�m0$       B+�M	ɑ.<���A�*

Training_lossʕB̝�$       B+�M	]Ë<���A�*

Training_loss0��B/Pu$       B+�M	W
�<���A�*

Training_loss]~�B�H$       B+�M	��Q=���A�*

Training_loss�f�B����$       B+�M	ᖳ=���A�*

Training_lossߗ�B��$       B+�M	��>���A�*

Training_loss���B��Sy$       B+�M	�<s>���A�*

Training_loss�E�BߵW�$       B+�M	��>���A�*

Training_lossw0-B(�M$$       B+�M	5�6?���A�*

Training_lossh �B�Wf�$       B+�M	�Qb?���A�*

Training_lossS�5BI�l$       B+�M	���?���A�*

Training_lossi�B���$       B+�M	I+*@���A�*

Training_lossPe�B��
$       B+�M	oE�@���A�*

Training_loss�Au��$       B+�M	��@���A�*

Training_lossr�sBg�$       B+�M	3IA���A�*

Training_loss��qB���$       B+�M	�G�A���A�*

Training_loss�WBń $       B+�M	j2B���A�*

Training_loss���B���$       B+�M	��fB���A�*

Training_loss�C�BC$�$       B+�M	g,�B���A�*

Training_loss(*B�IϤ$       B+�M	t%$C���A�*

Training_loss�cB���$       B+�M	���C���A�*

Training_loss�Z�B�U�/$       B+�M	��C���A�*

Training_loss��OBY)�$       B+�M	g�AD���A�*

Training_loss���BFr�$       B+�M	���D���A�*

Training_loss�I�B�)�$       B+�M	YLE���A�*

Training_loss �B��$       B+�M	S=kE���A�*

Training_loss�Z�BtF�j$       B+�M	�o�E���A�*

Training_loss
J�B}�x$       B+�M	�/F���A�*

Training_loss��B���$       B+�M	���F���A�*

Training_loss��7B� �S$       B+�M	�T�F���A�*

Training_lossb�}B���*       ����	A�G���A�*

Validation_accuracy�j?�S*&       sO� 	D�G���A�*

Validation_loss�WHB���$       B+�M	+n�H���A�*

Training_loss'z�BU}��$       B+�M	l]�H���A�*

Training_loss��B/n�$       B+�M	��HI���A�*

Training_loss@�BL�
�$       B+�M	���I���A�*

Training_loss�u�B����$       B+�M	(J���A�*

Training_loss�&�B�^�2$       B+�M	�mJ���A�*

Training_loss��B.�$       B+�M	-A�J���A�*

Training_loss��B�.�$       B+�M	�g0K���A�*

Training_loss�3�B�~�j$       B+�M	�}�K���A�*

Training_loss���B�a�'$       B+�M	yy�K���A�*

Training_loss���B�G$       B+�M	RL���A�*

Training_lossz��B��+k$       B+�M	���L���A�*

Training_loss"��B���$       B+�M	�M���A�*

Training_loss��B��s$       B+�M	F�M���A�*

Training_lossl��Ac�r0$       B+�M	0��M���A�*

Training_loss��A>RXT$       B+�M	�DN���A�*

Training_loss��B���-$       B+�M	�lN���A�*

Training_loss��B���t$       B+�M	�]�N���A�*

Training_loss(��B��ܲ$       B+�M	P�1O���A�*

Training_loss��B0���$       B+�M	͑O���A�*

Training_loss��tB��k~$       B+�M	�-�O���A�*

Training_loss�r\Bר�$       B+�M	�=YP���A�*

Training_loss��B�|�Q$       B+�M	:>�P���A�*

Training_loss��wB�A��$       B+�M	��"Q���A�*

Training_loss�dB�*��$       B+�M	��Q���A�*

Training_loss���B��R�$       B+�M	��Q���A�*

Training_loss6�B����$       B+�M	��KR���A�*

Training_loss��!B#Jj�$       B+�M	�;�R���A�*

Training_loss�%�B����$       B+�M	)>S���A�*

Training_loss�ĵBG�-�$       B+�M	�cS���A�*

Training_losshn�B��$       B+�M	t%�S���A�*

Training_loss�I�B{�$       B+�M	�T���A�*

Training_loss,u�BD��H$       B+�M	��{T���A�*

Training_loss��B)>�X$       B+�M	�T���A�*

Training_lossۋ�Bw�;l*       ����	`U���A�*

Validation_accuracy��j?ZX]&&       sO� 	|`U���A�*

Validation_loss0�CB�(�|$       B+�M	�pV���A�*

Training_loss���B�!7$       B+�M	`�V���A�*

Training_lossr�tB�_4$       B+�M	�WBW���A�*

Training_loss�K�B��j$       B+�M	=�W���A�*

Training_lossĖ�B���$       B+�M	�Q X���A�*

Training_loss�a�B��G$       B+�M	w�`X���A�*

Training_lossjyIBˌt$       B+�M	)=�X���A�*

Training_loss��B�$       B+�M	ɰY���A�*

Training_loss\0{B����$       B+�M	Ad}Y���A�*

Training_loss���B��$       B+�M	ѯ�Y���A�*

Training_loss ��B��_�$       B+�M	�;Z���A�*

Training_loss�VB@���$       B+�M	+��Z���A�*

Training_loss�p�B~���$       B+�M	���Z���A�*

Training_loss���B,W�N$       B+�M	&T_[���A�*

Training_loss@��B��y�$       B+�M	*��[���A�*

Training_loss��B$��$       B+�M	3��[���A�*

Training_lossXPLA��_|$       B+�M	7�f\���A�*

Training_loss�M�B���S$       B+�M	��\���A�*

Training_loss�:pBu/�$       B+�M		Q']���A�*

Training_loss$7�B��$       B+�M	$F�]���A�*

Training_loss�G�B>h9�$       B+�M	���]���A�*

Training_loss�xB̀�$       B+�M	�G^���A�*

Training_lossս�B���]$       B+�M	%�^���A�*

Training_loss��FBѿL$       B+�M	 �_���A�*

Training_loss~d�B;��$       B+�M	(�__���A�*

Training_lossP]�B̖D$       B+�M	�>�_���A�*

Training_loss���BH-j$       B+�M	h`���A�*

Training_loss��B��$       B+�M	�y`���A�*

Training_loss�8�B�յ�$       B+�M	�F�`���A�*

Training_lossJBS"E�$       B+�M	-"7a���A�*

Training_loss�ǊB��~5$       B+�M	rj�a���A�*

Training_loss��B�e�c$       B+�M	�b���A�*

Training_loss
�B��C�$       B+�M	�~wb���A�*

Training_loss~��B��at$       B+�M	b��b���A�*

Training_loss1�B���*       ����	jP�c���A�*

Validation_accuracy�k?ј��&       sO� 	XS�c���A�*

Validation_loss*
AB�#P�$       B+�M	?��d���A�*

Training_loss��cB��$       B+�M	���e���A�*

Training_lossu�B�[Io$       B+�M	D�f���A�*

Training_loss4�iBĩ�	$       B+�M	�G�f���A�*

Training_loss�_3B�7a�$       B+�M	��g���A�*

Training_lossr�B�׊$       B+�M	�x�g���A�*

Training_loss��ZB�M��$       B+�M	{L
h���A�*

Training_loss�L�B�G�<$       B+�M	��h���A�*

Training_loss��NB2wTQ$       B+�M	$|i���A�*

Training_loss�K�B�$9$       B+�M	U�~i���A�*

Training_loss6�B���$       B+�M	P:�i���A�*

Training_loss�gkB.�$       B+�M	��rj���A�*

Training_loss�wB��I7$       B+�M	E�j���A�*

Training_loss��BE�$       B+�M	�e�k���A�*

Training_loss��BG8)�$       B+�M	�P�k���A�*

Training_loss7p=B�	�=$       B+�M	,pl���A�*

Training_loss�[�B���$       B+�M	�w�l���A�*

Training_loss7��AX�3�$       B+�M	�l���A�*

Training_loss�ˑBm���$       B+�M	M1\m���A�*

Training_lossvz�Bq��$       B+�M	2 �m���A�*

Training_loss2�B����$       B+�M	NA n���A�*

Training_loss��sBQW�$       B+�M	Ɣn���A�*

Training_loss�h�B�\�$       B+�M	��o���A�*

Training_loss\��B��$       B+�M	��o���A�*

Training_loss)��B��R$       B+�M	Dop���A�*

Training_loss��?Bߒ��$       B+�M	�}�p���A�*

Training_loss��sB�7$       B+�M	"��p���A�*

Training_losse�tBE5��$       B+�M	��dq���A�*

Training_loss"�B6��$       B+�M	���q���A�*

Training_loss֟<B7K�W$       B+�M	֬Hr���A�*

Training_loss6"(B3sB-$       B+�M	3T�r���A�*

Training_loss(]�B�x<�$       B+�M	��s���A�*

Training_loss�=+B��p�$       B+�M	=ns���A�*

Training_lossnIsBj��$       B+�M	$��s���A�*

Training_loss�F~BK���*       ����	���t���A�*

Validation_accuracy��i?��^�&       sO� 	�t���A�*

Validation_loss��JB�В$       B+�M	���u���A�*

Training_loss�}B�C�$       B+�M	Av���A�*

Training_loss�=B�Y�@$       B+�M	E��v���A�*

Training_lossG3BwG$       B+�M	�:w���A�*

Training_loss��B{_k�$       B+�M	�{�w���A�*

Training_loss�XB���\$       B+�M	r�x���A�*

Training_loss&�B�8��$       B+�M	��}x���A�*

Training_loss��BY@$       B+�M	�}�x���A�*

Training_loss1�B:�xl$       B+�M	��Gy���A�*

Training_lossQu�B���$       B+�M	gҭy���A�*

Training_loss�κBO.�3$       B+�M	��z���A�*

Training_loss�4nB����$       B+�M	�yz���A�*

Training_lossXyB6��$       B+�M	}��z���A�*

Training_loss`��B���$       B+�M	U�S{���A�*

Training_loss�JB��K$       B+�M	s׾{���A�*

Training_lossA/�B��6$       B+�M	B-|���A�*

Training_loss��	B�)1$       B+�M	3�|���A�*

Training_lossdkBI�6�$       B+�M	��|���A�*

Training_loss��B���$       B+�M	?N}���A�*

Training_loss��B���$       B+�M	2u�}���A�*

Training_lossP��B��W$       B+�M	��5~���A�*

Training_loss��B�s��$       B+�M	j��~���A�*

Training_lossߛB��~�$       B+�M	�_���A�*

Training_loss���BWb��$       B+�M	�����A�*

Training_lossbjqBz $       B+�M	H�����A�*

Training_loss�W�B�+$�$       B+�M	��T����A�*

Training_loss^�B���($       B+�M	�ڹ����A�*

Training_loss45�B6o�@$       B+�M	Q�!����A�*

Training_loss.{Bx;DQ$       B+�M		T�����A�*

Training_loss�8Bc�B$       B+�M	$���A�*

Training_loss%)�B̷+�$       B+�M	�`P����A�*

Training_loss
+�B��/$       B+�M	8-�����A�*

Training_loss�EB[Um�$       B+�M	]����A�*

Training_loss�=7B�1#$       B+�M	�i����A�*

Training_loss��)Bm��.*       ����	"�����A�*

Validation_accuracy��k?Ƒ&       sO� 	�'�����A�*

Validation_loss>�=B���$       B+�M	������A�*

Training_lossrsB�Kt|$       B+�M	�q����A�*

Training_lossI(_B7�}$       B+�M	��҅���A�*

Training_loss�͝B�ي�$       B+�M	�C5����A�*

Training_loss'UBԟ2p$       B+�M	������A�*

Training_loss��rB��C�$       B+�M	Z�����A�*

Training_lossp�*B���;$       B+�M	�O����A�*

Training_loss(�bB�fۿ$       B+�M	�q�����A�*

Training_loss-��B<@��$       B+�M	����A�*

Training_lossg�lB7�$       B+�M	}p����A�*

Training_lossK��Bb�ڠ$       B+�M	��Έ���A�*

Training_loss�F�B�V�$       B+�M	��,����A�*

Training_loss�"�Bz��$       B+�M	�$�����A�*

Training_loss�*�B�5�B$       B+�M	+�牾��A�*

Training_loss��yB_�#m$       B+�M	��E����A�*

Training_lossWB-���$       B+�M	,������A�*

Training_loss�Q{B��$       B+�M	�� ����A�*

Training_lossvB�͢z$       B+�M	 Sc����A�*

Training_loss���B<*�d$       B+�M	�+�����A�*

Training_loss��A+�&$       B+�M	��苾��A�*

Training_loss$�yB�a)$       B+�M	�eF����A�*

Training_losszΔBw�6$       B+�M	�������A�*

Training_loss;��B帅�$       B+�M	8�����A�*

Training_loss�mB��$       B+�M	��u����A�*

Training_loss��BE&^$       B+�M	�jލ���A�*

Training_loss"�PB�,��$       B+�M	A�>����A�*

Training_loss�C��$       B+�M	������A�*

Training_lossh�SB��A�$       B+�M	������A�*

Training_losst�B]C�s$       B+�M	(�l����A�*

Training_loss��B���$       B+�M	�̏���A�*

Training_loss��Ay��r$       B+�M	�8����A�*

Training_lossZ��B��P$       B+�M	?�����A�*

Training_loss"�WBgU�\$       B+�M	�v����A�*

Training_loss��B3�c�$       B+�M	�*�����A�*

Training_loss���B�:y�*       ����	C�����A�*

Validation_accuracy��k?i$P&       sO� 	ͬ����A�*

Validation_loss�?B�;�$       B+�M	�_A����A�*

Training_loss�ˉB���B$       B+�M	<�����A�*

Training_loss9FB�}
$       B+�M	�����A�*

Training_loss*��B�E$       B+�M	�e����A�*

Training_lossMueB��^$       B+�M	�FД���A�*

Training_loss*7�BT61$       B+�M	KZD����A�*

Training_lossU��B��$       B+�M	q�����A�*

Training_loss]D!B�<��$       B+�M	�����A�*

Training_lossR��B���$       B+�M	@1m����A�*

Training_lossz��B��8$       B+�M	J͖���A�*

Training_lossWfuBHܔ$       B+�M	�`9����A�*

Training_lossC��B	+(&$       B+�M	${�����A�*

Training_loss�6�Bo~$v$       B+�M	h�����A�*

Training_loss�-�B�$�$       B+�M	��d����A�*

Training_loss���B[b��$       B+�M	4�Ę���A�*

Training_lossX�B�3d$       B+�M	��)����A�*

Training_loss���B'��$       B+�M	�$�����A�*

Training_loss��BD�z�$       B+�M	������A�*

Training_loss���B�s�$       B+�M	̲X����A�*

Training_loss��BV̲�$       B+�M	�Q~����A�*

Training_loss6S�AKQ�$       B+�M	'1ܚ���A�*

Training_loss�	VB0ƶ$       B+�M	��A����A�*

Training_lossV��B����$       B+�M	F꥛���A�*

Training_loss�"<Bbuy#$       B+�M	a�����A�*

Training_loss�+BL��F$       B+�M	-�j����A�*

Training_loss�ΐBxj<w$       B+�M	uϜ���A�*

Training_lossx�B�V�m$       B+�M	�I3����A�*

Training_loss�7}B8;�$       B+�M	�.�����A�*

Training_loss͡(B1�$       B+�M	
�����A�*

Training_loss4R�B_�l$       B+�M	��]����A�*

Training_loss�U�B���$       B+�M	=)Þ���A�*

Training_loss˴B�deT$       B+�M	��%����A�*

Training_loss�ČBi`� $       B+�M	�=�����A�*

Training_loss��RB��}`$       B+�M	��䟾��A�*

Training_loss���B+���*       ����	��p����A�*

Validation_accuracy��k?�5��&       sO� 	�p����A�*

Validation_lossБ6B��H�$       B+�M	F?�����A�*

Training_loss]p�By�f�$       B+�M	A���A�*

Training_loss�	�BL�$       B+�M	pBM����A�*

Training_loss��BJ8$       B+�M	�
�����A�*

Training_lossa��B�c�$       B+�M	:$	����A�*

Training_loss��BI03}$       B+�M	��f����A�*

Training_loss߬�B��LY$       B+�M	��ţ���A�*

Training_lossh�_B��JE$       B+�M	&�%����A�*

Training_loss���B��4A$       B+�M	& �����A�*

Training_loss&6�B/[�$       B+�M	�H⤾��A�*

Training_loss�.�A$T�$       B+�M	�VC����A�*

Training_loss�l�B'�$       B+�M	�#�����A�*

Training_loss�"B����$       B+�M	C�����A�*

Training_loss�o_B6�*z$       B+�M	�Rc����A�*

Training_lossQ�`B���$       B+�M	m������A�*

Training_lossG�sBQ4#$       B+�M	�z����A�*

Training_loss�=B�]?�$       B+�M	�3�����A�*

Training_lossQ�2B�"��$       B+�M	�������A�*

Training_loss�IuB�	B$       B+�M	�S����A�*

Training_loss�`MB�tX$       B+�M	�@�����A�*

Training_lossD�B�o=+$       B+�M	�	ਾ��A�*

Training_lossn5B�T$       B+�M	�@F����A�*

Training_loss�2�B}�]$       B+�M	zţ����A�*

Training_loss�BpP�$       B+�M	����A�*

Training_loss�s�B���j$       B+�M	��~����A�*

Training_loss��?B7��$       B+�M	��۪���A�*

Training_loss��TB��j"$       B+�M	` <����A�*

Training_lossƑ�BE]��$       B+�M	ƥ�����A�*

Training_lossFV�Bf>$       B+�M	Q������A�*

Training_loss�� B�/0�$       B+�M	�V_����A�*

Training_lossqGKBK���$       B+�M	gE�����A�*

Training_loss���B �E�$       B+�M	��$����A�*

Training_lossB��B�~�$       B+�M	�ۇ����A�*

Training_loss�~B�,�$       B+�M	�|���A�*

Training_loss`ݷB��'�*       ����	1E����A�*

Validation_accuracy��k?h�\&       sO� 	|G����A�*

Validation_loss��<B��a�$       B+�M	~�����A�*

Training_loss̽�B)��&$       B+�M	������A�*

Training_loss�m�B�Up$       B+�M	Yn�����A�*

Training_loss��_B���c$       B+�M	&ⰾ��A�*

Training_loss/ )B��Ն$       B+�M	�BA����A�*

Training_lossx��BV��+$       B+�M	z������A�*

Training_lossVl'BU��$       B+�M	�����A�*

Training_loss֓`B[���$       B+�M	�4b����A�*

Training_lossw��A���x$       B+�M	)²���A�*

Training_loss���B/�O�$       B+�M	�7!����A�*

Training_loss�k�Aj��$       B+�M	�������A�*

Training_lossM֪B���$       B+�M	�Z鳾��A�*

Training_loss�ĢB�r�\$       B+�M	�O����A�*

Training_loss"�8B,�!$       B+�M	Ϻ�����A�*

Training_loss��B�+�$       B+�M	������A�*

Training_lossfѡB�؆7$       B+�M	�B~����A�*

Training_loss���B�h7$       B+�M	��޵���A�*

Training_loss��BH�=�$       B+�M	s�D����A�*

Training_lossjB��I$       B+�M	�馶���A�*

Training_loss%MBsA^�$       B+�M	M�	����A�*

Training_loss� B�G6�$       B+�M	��k����A�*

Training_lossXN�B��k$       B+�M	������A�*

Training_lossޯ�A<��\$       B+�M	�������A�*

Training_loss\(OBô��$       B+�M	��]����A�*

Training_loss��KB���
$       B+�M	�n�����A�*

Training_lossU��BC�9$       B+�M	� ����A�*

Training_loss�ŞB�[Z�$       B+�M	�������A�*

Training_losstjB�@ $       B+�M	�n޹���A�*

Training_loss��JB��=c$       B+�M	�=����A�*

Training_loss�HB�-N$       B+�M	�	�����A�*

Training_loss��eB"T$       B+�M	����A�*

Training_losss�\BtgBN$       B+�M	X�a����A�*

Training_loss���Bf)�c$       B+�M	i:�����A�*

Training_loss�ՅBj�X�$       B+�M	������A�*

Training_lossX�B$Ʉ�*       ����	�¨����A�*

Validation_accuracy;�l?�B�&       sO� 	�Ĩ����A�*

Validation_loss��-B?�n�$       B+�M	2����A�*

Training_loss���Bd0�$       B+�M	�Zo����A�*

Training_loss���BP�L�$       B+�M	��о���A�*

Training_loss�>�Btڐ�$       B+�M	%�/����A�*

Training_loss"k|B^+Y�$       B+�M	7ߘ����A�*

Training_lossCkiB���$       B+�M	�G ����A�*

Training_loss�U�Bj?��$       B+�M	��g����A�*

Training_lossW��Bh��_$       B+�M	i�����A�*

Training_lossp,�B���$       B+�M	�b5����A�*

Training_loss��tBנ2$       B+�M	�?�����A�*

Training_losszn0B:�^$       B+�M	�e¾��A�*

Training_loss�"JB�T�d$       B+�M	�$`¾��A�*

Training_loss��'B)?�$       B+�M	�{�¾��A�*

Training_loss�BX��$       B+�M	��þ��A�*

Training_loss�F2B�W�
$       B+�M	��þ��A�*

Training_loss�πB����$       B+�M	�C�þ��A�*

Training_loss�P'B	c$       B+�M	�?ľ��A�*

Training_loss�ۤB�%!$       B+�M	M�ľ��A�*

Training_lossJ�MBL���$       B+�M	��ľ��A�*

Training_loss��dBfJ�$       B+�M	C<]ž��A�*

Training_lossL�-B��p$       B+�M	���ž��A�*

Training_lossBHPBlJ��$       B+�M	��(ƾ��A�*

Training_loss��dB�,�$       B+�M	�	Pƾ��A�*

Training_lossx1dAc,�L$       B+�M	%�ƾ��A�*

Training_loss���Bd^6$       B+�M	ȖǾ��A�*

Training_lossc�B¢�	$       B+�M	T�qǾ��A�*

Training_loss��nB�d�$       B+�M	�#�Ǿ��A�*

Training_loss6,�B�K��$       B+�M	�Z6Ⱦ��A�*

Training_loss5]B %�$       B+�M	�C�Ⱦ��A�*

Training_loss>�DB�ثJ$       B+�M	�J�Ⱦ��A�*

Training_loss�Bo�N^$       B+�M	Yhɾ��A�*

Training_lossr��B�+`$       B+�M	���ɾ��A�*

Training_lossh�ZB�Ŋ�$       B+�M	u_ʾ��A�*

Training_loss�+JB$ճ8$       B+�M	���ʾ��A�*

Training_loss\�%B�)��*       ����	�5\˾��A�*

Validation_accuracy�l?��^&       sO� 	=\˾��A�*

Validation_loss��1B0�G$       B+�M	Su�̾��A�*

Training_loss��PBB1�$       B+�M	*;��A�*

Training_loss��}B��M�$       B+�M	��t;��A�*

Training_lossؘVB�'�$       B+�M	Dn�;��A�*

Training_loss�~�B�sޔ$       B+�M	T�5ξ��A�*

Training_loss��eB�$$       B+�M	��ξ��A�*

Training_lossh�2B%�\$       B+�M	��Ͼ��A�*

Training_lossc_BT��$       B+�M	O�Ͼ��A�*

Training_loss��A'�=$       B+�M	�Y	о��A�*

Training_loss��[B�a$       B+�M	Uwо��A�*

Training_loss��tB����$       B+�M	qX�о��A�*

Training_loss��B!�2$       B+�M	c%NѾ��A�*

Training_loss�X[B��Q$       B+�M	��Ѿ��A�*

Training_lossPJoBH1�$       B+�M	W#Ҿ��A�*

Training_loss�dB�'�$       B+�M	~T�Ҿ��A�*

Training_losse��B�㴉$       B+�M	���Ҿ��A�*

Training_loss�V�B[V�$       B+�M	ywNӾ��A�*

Training_loss"�iB_3=O$       B+�M	%ͲӾ��A�*

Training_loss�VBc֮�$       B+�M	PsԾ��A�*

Training_lossq�TB���$       B+�M	�yԾ��A�*

Training_lossLB�̎7$       B+�M	=_�Ծ��A�*

Training_loss��HBf#_7$       B+�M	0�Fվ��A�*

Training_loss�[B�G^B$       B+�M	5�վ��A�*

Training_loss`�2Bfe��$       B+�M	��վ��A�*

Training_loss�ńA��$       B+�M	�}C־��A�*

Training_losssK�ByW$       B+�M	��־��A�*

Training_loss�;BY���$       B+�M	�� ׾��A�*

Training_loss��B���$       B+�M	r�׾��A�*

Training_loss�*�Ar��W$       B+�M	"��׾��A�*

Training_loss�V�B[p�N$       B+�M	�fLؾ��A�*

Training_lossl�FB�vF.$       B+�M	���ؾ��A�*

Training_lossb|wB%B:�$       B+�M	�eپ��A�*

Training_loss��qB�j�7$       B+�M	��پ��A�*

Training_loss��JB�}�$       B+�M	�`�پ��A�*

Training_loss��OB�V5*       ����	d�ھ��A�*

Validation_accuracy��k?z��j&       sO� 	%�ھ��A�*

Validation_loss�6B����$       B+�M	�Mܾ��A�*

Training_loss�^�BG2�$       B+�M	��rܾ��A�*

Training_loss 1�B quX$       B+�M	@��ܾ��A�*

Training_loss
�BѰ��$       B+�M	�BXݾ��A�*

Training_lossh~B���$       B+�M	�ݾ��A�*

Training_loss\sB���$       B+�M	<�D޾��A�*

Training_losslGB���K$       B+�M	�r�޾��A�*

Training_loss�m�B����$       B+�M	.߾��A�*

Training_lossS�B�
8�$       B+�M	��|߾��A�*

Training_lossFBB�b[�$       B+�M	+�߾��A�*

Training_lossY�@B�3�$       B+�M	�N���A�*

Training_loss�rB�$       B+�M	�^����A�*

Training_loss�'rBtQ��$       B+�M	�����A�*

Training_lossx!jB�޷$       B+�M	�x���A�*

Training_lossΕ�B�IP�$       B+�M	������A�*

Training_loss�ndB�_D$       B+�M	�#7���A�*

Training_loss��	Bn�e�$       B+�M	�I����A�*

Training_loss�
�BΟ�F$       B+�M	�����A�*

Training_loss��B&x:�$       B+�M	E*S���A�*

Training_loss!NB/v$       B+�M	0�����A�*

Training_losst,B��l�$       B+�M	P4���A�*

Training_loss���BQޠ�$       B+�M	�;n���A�*

Training_loss�cUB���$       B+�M	������A�*

Training_loss�@�A|�u�$       B+�M	Tp,���A�*

Training_loss���B���6$       B+�M	�Q���A�*

Training_loss���AV��$       B+�M	ܜ����A�*

Training_loss<��B�\#$       B+�M	~����A�*

Training_loss�]wB`��$       B+�M	bf����A�*

Training_lossW��B���$       B+�M	K����A�*

Training_loss4.�BW~$       B+�M	o~L���A�*

Training_lossPX�B��@�$       B+�M	DM����A�*

Training_loss�
�B�1B$       B+�M	�.���A�*

Training_lossj�hB}%xZ$       B+�M	
�t���A�*

Training_loss�YB��Ǔ$       B+�M	צ����A�*

Training_lossꩋB��q*       ����	�d���A�*

Validation_accuracy�l?d���&       sO� 	Fd���A�*

Validation_loss>�-B�Zl�$       B+�M	j�����A�*

Training_lossr�B�TL$       B+�M	�y���A�*

Training_loss�+sBM���$       B+�M	�hr���A�*

Training_lossGB���$       B+�M	Ҭ����A�*

Training_loss~@ B毹�$       B+�M	\Z2���A�*

Training_loss"�=B�劥$       B+�M	b����A�*

Training_loss�DB~&Z�$       B+�M	�����A�*

Training_loss�B���$       B+�M	�KR����A�*

Training_loss�-rB�B1$       B+�M	�ճ����A�*

Training_loss��]B���[$       B+�M	����A�*

Training_loss(�>B(Z$       B+�M	��v���A�*

Training_loss�%�B|A$       B+�M	sg����A�*

Training_loss��AW#�$       B+�M	/�6���A�*

Training_loss���B���$       B+�M	�C����A�*

Training_lossg�B��Y$       B+�M	}�����A�*

Training_loss'_sB��>�$       B+�M	|�c���A�*

Training_loss��Bg�$       B+�M	�����A�*

Training_loss3TBKS��$       B+�M	<2=���A�*

Training_loss�ćB�Q�$       B+�M	������A�*

Training_loss
�CB�B$       B+�M	j1���A�*

Training_lossʦrB�z��$       B+�M	�zn���A�*

Training_loss��nBu���$       B+�M	������A�*

Training_loss<�EBx���$       B+�M	%�8���A�*

Training_loss�B���.$       B+�M	|�����A�*

Training_loss,k�A�f�_$       B+�M	�����A�*

Training_loss�oB�֠9$       B+�M	d.����A�*

Training_lossZ�yA�,��$       B+�M	z������A�*

Training_loss���B��C�$       B+�M	�������A�*

Training_loss{�GB0��0$       B+�M	��^����A�*

Training_loss��B�۫.$       B+�M	#������A�*

Training_loss@�eBW�p�$       B+�M	������A�*

Training_loss�B?֨�$       B+�M	�W{����A�*

Training_loss43B��s2$       B+�M	�������A�*

Training_loss�lB���$       B+�M	s9����A�*

Training_loss) B]���*       ����	ܿ����A�*

Validation_accuracy�l?&�n&       sO� 	�޿����A�*

Validation_lossq�1B��]$       B+�M	ȗ����A�*

Training_loss=B ��:$       B+�M	��t����A�*

Training_loss�Y3B�$       B+�M	]�����A�*

Training_loss�aB)�ZW$       B+�M	1����A�*

Training_lossCkB#�@$       B+�M	������A�*

Training_loss�
"B,���$       B+�M	�U�����A�*

Training_loss��.B�E��$       B+�M	��L����A�*

Training_lossZAB$�z{$       B+�M	������A�*

Training_loss�V�B.vL�$       B+�M	o�/����A�*

Training_lossl�9B� ��$       B+�M	</�����A�*

Training_loss��TB���$       B+�M	8�����A�*

Training_loss�,.B�V�$       B+�M	������A�*

Training_loss��B[X=?$       B+�M	�L ����A�*

Training_losst�=B���$       B+�M	M�`����A�*

Training_loss��iB���g$       B+�M	������A�*

Training_losse��A&�_$       B+�M	�*����A�*

Training_lossX�B��<�$       B+�M	)͐����A�*

Training_loss��XB[*C%$       B+�M	������A�*

Training_loss+�BI�K$       B+�M	#�V ���A�*

Training_loss�{B�d��$       B+�M	pѴ ���A�*

Training_lossx�0B�7��$       B+�M	�����A�*

Training_loss��pB¿$       B+�M	�{t���A�*

Training_loss:^�Br��$       B+�M	ۈ����A�*

Training_lossd*�A�;e/$       B+�M	8.5���A�*

Training_loss:�eB���$       B+�M	 z����A�*

Training_lossqQnB�؎'$       B+�M	N����A�*

Training_loss�ѠB���@$       B+�M	����A�*

Training_loss�;"B�S�$       B+�M	@�}���A�*

Training_loss��BrMS$       B+�M	ۇ����A�*

Training_loss�DB��l$       B+�M	�k?���A�*

Training_loss��pB�c�$       B+�M	� ����A�*

Training_loss('�B��o*$       B+�M	Yi����A�*

Training_lossS�UBK���$       B+�M	��[���A�*

Training_loss��B��K4$       B+�M	V�����A�*

Training_loss�֜B	tx*       ����	��T���A�*

Validation_accuracy;�l?V�ƚ&       sO� 	:�T���A�*

Validation_loss\.B��	�$       B+�M	(����A�*

Training_loss�XCB��$       B+�M	N	���A�*

Training_loss�$}Bo�:�$       B+�M	��d���A�*

Training_loss�_wBo]�$       B+�M	������A�*

Training_loss��8Bҍ$       B+�M	�o!	���A�*

Training_loss�rDB���_$       B+�M	��	���A�*

Training_loss�IyB�̃*$       B+�M	���	���A�*

Training_loss��B���f$       B+�M	-�>
���A�*

Training_lossg_B�\$       B+�M	���
���A�*

Training_lossl�MB�*�$       B+�M	�]�
���A�*

Training_loss��|B	��d$       B+�M	F[Z���A�*

Training_loss`�B�K>$       B+�M	�ӹ���A�*

Training_loss�\_B���$       B+�M	T����A�*

Training_loss�o!B�;:�$       B+�M	5Ew���A�*

Training_loss�ݫB��$       B+�M	2X����A�*

Training_loss'k�BG2+$       B+�M	��6���A�*

Training_loss�AB�d�9$       B+�M	�����A�*

Training_loss�k!B(��E$       B+�M	�����A�*

Training_loss��~B҄&�$       B+�M	GWf���A�*

Training_losseY\B7\��$       B+�M	�����A�*

Training_loss���A^㸟$       B+�M	N�)���A�*

Training_loss��Am$       B+�M	Б���A�*

Training_lossL��A�ж�$       B+�M	1����A�*

Training_lossWmB`�	�$       B+�M	�7U���A�*

Training_loss���B���2$       B+�M	Z����A�*

Training_loss�u�A(�*�$       B+�M	����A�*

Training_loss��2BVL�$       B+�M	�|���A�*

Training_lossnP]B�K4$       B+�M	������A�*

Training_loss��&AE�ڽ$       B+�M	x���A�*

Training_loss�'B�Ù�$       B+�M	�[f���A�*

Training_lossCB?T��$       B+�M	�����A�*

Training_loss��[Bbk��$       B+�M	��~���A�*

Training_lossc�BE&!$       B+�M	0�G���A�*

Training_loss�)B�?�y$       B+�M	Yn���A�*

Training_loss��Bd��*       ����	rjN���A�*

Validation_accuracy�l?8S6~&       sO� 	�N���A�*

Validation_lossnV3Bt	k�$       B+�M	�����A�*

Training_loss�BFa	$       B+�M	p����A�*

Training_loss̘�B̒��$       B+�M	/����A�*

Training_loss���A�P@�$       B+�M	�����A�*

Training_losse�8B��oK$       B+�M	I���A�*

Training_loss��VB���7$       B+�M	U�����A�*

Training_lossk^�A�p�$       B+�M	����A�*

Training_loss ��B�ɱU$       B+�M	�Y����A�*

Training_loss���BC��$       B+�M	YM#���A�*

Training_lossT�YB,\��$       B+�M	9����A�*

Training_loss��>BOŵ$       B+�M	� ���A�*

Training_loss���B1;	z$       B+�M	-�d���A�*

Training_loss/�0BQ���$       B+�M	������A�*

Training_loss�BD��!$       B+�M	��_���A�*

Training_loss�L@B����$       B+�M	gH����A�*

Training_lossJ*B
Cϖ$       B+�M		S)���A�*

Training_loss�J2B����$       B+�M	�҇���A�*

Training_lossQuB3>Jm$       B+�M	8�����A�*

Training_lossgI�Bl�I�$       B+�M	>zE ���A�*

Training_loss@�B[��T$       B+�M	�k� ���A�*

Training_loss��BWf��$       B+�M	ta!���A�*

Training_loss��BݛH*$       B+�M	�`b!���A�*

Training_loss��~B�|�$       B+�M	�O�!���A�*

Training_lossK!B��e�$       B+�M	�s""���A�*

Training_loss0�iB�-�z$       B+�M	l�"���A�*

Training_loss��JB���R$       B+�M	I�"���A�*

Training_loss�t1B��$       B+�M	k}?#���A�*

Training_loss\`B�zb$       B+�M	E��#���A�*

Training_loss(�zB5l!$       B+�M	%��#���A�*

Training_loss�A�r+$       B+�M	/�+$���A�*

Training_loss␠B�Wb$       B+�M	��$���A�*

Training_loss��IB����$       B+�M	K�$���A�*

Training_loss+�FB��$       B+�M	�~Q%���A�*

Training_loss-��B�|�$       B+�M	�a�%���A�*

Training_loss��A�]�*       ����	��D&���A�*

Validation_accuracy�l?� ab&       sO� 	�D&���A�*

Validation_loss��/BF�mL$       B+�M	��'���A�*

Training_loss��eB��r�$       B+�M	��%(���A�*

Training_loss4QFB+��$       B+�M	�>�(���A�*

Training_loss\J�A���P$       B+�M	<�(���A�*

Training_loss��JBH��$       B+�M	q�G)���A�*

Training_loss0�@B�Wp$       B+�M	ݘ�)���A�*

Training_loss�M�A6 B$       B+�M	�f*���A�*

Training_loss�|'B���,$       B+�M	`we*���A�*

Training_loss��CB�_�T$       B+�M	q��*���A�*

Training_loss���ANz{0$       B+�M	�J(+���A�*

Training_loss��aB/"&$       B+�M	@O�+���A�*

Training_loss�H�B[^al$       B+�M	�;�+���A�*

Training_loss��+B>�=�$       B+�M	H�Z,���A�*

Training_loss�;�BTK^�$       B+�M	��,���A�*

Training_loss�T=B"��]$       B+�M	&�-���A�*

Training_loss�Y�BZ3Y9$       B+�M	hy�-���A�*

Training_loss��B�0_$       B+�M	��-���A�*

Training_loss.�BiVt�$       B+�M	V*G.���A�*

Training_loss��RBJ
a$       B+�M	V~�.���A�*

Training_lossb<@B]�Ԡ$       B+�M	��/���A�*

Training_loss���B��xg$       B+�M	`�t/���A�*

Training_loss�6
B�PW$       B+�M	^��/���A�*

Training_loss@:B����$       B+�M	l�<0���A�*

Training_loss2:�B��kw$       B+�M	��0���A�*

Training_lossh��B�d��$       B+�M	��0���A�*

Training_loss��A�ܨ�$       B+�M	[1���A�*

Training_loss��&B�?Y�$       B+�M	*��1���A�*

Training_loss2�\B`w�:$       B+�M	�&2���A�*

Training_loss�ՆB�7�$       B+�M	#N�2���A�*

Training_lossH��B����$       B+�M	���2���A�*

Training_loss#�:A)O$       B+�M	��
3���A�*

Training_loss	�uB��~$       B+�M	>�i3���A�*

Training_loss�v�B���$       B+�M	���3���A�*

Training_lossK�B���u$       B+�M	6&4���A�*

Training_loss�ZB�p��*       ����	�u�4���A�*

Validation_accuracy;1m?�u��&       sO� 	�x�4���A�*

Validation_loss�l"Bs��$       B+�M	�76���A�*

Training_loss�bB��B$       B+�M	+Qx6���A�*

Training_loss4�	Bv���$       B+�M	 �6���A�*

Training_loss�!#B�7��$       B+�M	w�47���A�*

Training_loss��B��$       B+�M	�w�7���A�*

Training_loss��B���!$       B+�M	�^�7���A�*

Training_loss�qQB�'$       B+�M	geQ8���A�*

Training_lossISB����$       B+�M	���8���A�*

Training_lossu+B4M�S$       B+�M	Z�9���A�*

Training_lossRdTB����$       B+�M	;�v9���A�*

Training_loss|�A��w|$       B+�M	���9���A�*

Training_loss�EB9U2�$       B+�M	~8:���A�*

Training_loss<��B�|$       B+�M	uZ�:���A�*

Training_losso�B�iY$       B+�M	��:���A�*

Training_loss�g)B����$       B+�M	;Qf;���A�*

Training_loss��4B8�s]$       B+�M	p}�;���A�*

Training_loss8ՂB��PH$       B+�M	ǜC<���A�*

Training_loss4N5B��-�$       B+�M	"��<���A�*

Training_loss¼BB�L�:$       B+�M	�=���A�*

Training_loss�vB�{cd$       B+�M	��g=���A�*

Training_loss�FB�'�$       B+�M	��=���A�*

Training_loss��#B,N��$       B+�M	�W/>���A�*

Training_lossB3��$       B+�M	T�>���A�*

Training_loss�61B��$       B+�M	���>���A�*

Training_loss��HB���$       B+�M	�Oa?���A�*

Training_loss��AB�?$       B+�M	o+�?���A�*

Training_loss�s�A C��$       B+�M	N�*@���A�*

Training_lossPd�B�v�$       B+�M	�Ɗ@���A�*

Training_loss�n�Bۮ�$       B+�M	���@���A�*

Training_lossX B8��$       B+�M	�TA���A�*

Training_loss�Bt��$       B+�M	��{A���A�*

Training_loss��A>�Lc$       B+�M	m��A���A�*

Training_loss�L�A��/o$       B+�M	��FB���A�*

Training_loss3�gBT�J#$       B+�M	���B���A�*

Training_lossOKfBXU�*       ����	s=C���A�*

Validation_accuracy;1m?�tJ&       sO� 	�u=C���A�*

Validation_loss��+B�g��$       B+�M	�'�D���A�*

Training_loss\��A��n$$       B+�M	��+E���A�*

Training_loss8�BT���$       B+�M	> �E���A�*

Training_loss��SBo��$       B+�M	��E���A�*

Training_lossjtB�g$       B+�M	W
\F���A�*

Training_loss�Z>B�u��$       B+�M	�z�F���A�*

Training_loss�vmB$�O5$       B+�M	�U$G���A�*

Training_lossչ3B���$       B+�M	�+�G���A�*

Training_loss3--B��"$       B+�M	W�G���A�*

Training_loss�i<B�Ȅ�$       B+�M	�)UH���A�*

Training_lossط�AO ��$       B+�M	��H���A�*

Training_losso�[B�F�$       B+�M	�9I���A�*

Training_loss�%�B���$       B+�M	Թ�I���A�*

Training_loss�(B���$       B+�M	�&�I���A�*

Training_loss�	lB��ܷ$       B+�M	N�UJ���A�*

Training_loss,=(B�:i$       B+�M	o��J���A�*

Training_loss��BB�$       B+�M	#K���A�*

Training_lossZ�WB��C�$       B+�M	I��K���A�*

Training_loss��rB&�$       B+�M	��K���A�*

Training_loss@;$B��$       B+�M	MSL���A�*

Training_loss*
�B0Cگ$       B+�M	xA�L���A�*

Training_loss��B��$       B+�M	J�M���A�*

Training_loss���A���J$       B+�M	��M���A�*

Training_loss�dB�>��$       B+�M	���M���A�*

Training_loss��mB��=�$       B+�M	��KN���A�*

Training_lossuQ�B���$       B+�M	�l�N���A�*

Training_loss�K3B�1�F$       B+�M	r�O���A�*

Training_loss���A�sh)$       B+�M	_bxO���A�*

Training_loss�,DB����$       B+�M	��O���A�*

Training_loss�B{��@$       B+�M	�DP���A�	*

Training_loss䵂B|^߃$       B+�M	�G�P���A�	*

Training_loss�B���$       B+�M	���P���A�	*

Training_loss��A/^VA$       B+�M	��7Q���A�	*

Training_loss�7QB����$       B+�M	R(�Q���A�	*

Training_loss;Y"Bx��*       ����	��R���A�	*

Validation_accuracy;�l?4~�5&       sO� 	�R���A�	*

Validation_loss�,"B���$       B+�M	���S���A�	*

Training_loss���B�@�c$       B+�M	gd�S���A�	*

Training_losss{B��$       B+�M	bWT���A�	*

Training_loss� B��6�$       B+�M	�A�T���A�	*

Training_lossz�hB��$       B+�M	(CU���A�	*

Training_loss���A��;$       B+�M	�\rU���A�	*

Training_loss�"7Bq��$       B+�M	��U���A�	*

Training_loss��B���]$       B+�M	��/V���A�	*

Training_loss �AÞ#$       B+�M	�;�V���A�	*

Training_loss(�A.S1N$       B+�M	�|�V���A�	*

Training_lossh5B�� $       B+�M	��LW���A�	*

Training_lossc@PB�53�$       B+�M	�ǬW���A�	*

Training_loss�@�B�<Mf$       B+�M	EdX���A�	*

Training_lossL:SB9��$       B+�M	�=sX���A�	*

Training_loss[�<B�m�$       B+�M	!�X���A�	*

Training_lossҐ;B��T�$       B+�M	�<@Y���A�	*

Training_lossPQB��7$       B+�M	
��Y���A�	*

Training_loss�(B���/$       B+�M	Y�Z���A�	*

Training_loss�+VB�L`$       B+�M	�.kZ���A�	*

Training_lossa!\B�@;�$       B+�M	Y��Z���A�	*

Training_loss���A�W5$       B+�M	�
2[���A�	*

Training_loss��BI�*$       B+�M	G<�[���A�	*

Training_loss�S1Bٹ) $       B+�M	���[���A�	*

Training_loss:
BV�_�$       B+�M	�U\���A�	*

Training_loss�LEB���$       B+�M	Dܴ\���A�	*

Training_loss�?B�Lh�$       B+�M	6�]���A�	*

Training_loss�M�AAd{�$       B+�M	h]���A�	*

Training_loss�B�	��$       B+�M	��]���A�	*

Training_loss2�Bб�$       B+�M	��D^���A�	*

Training_loss��2B+��$       B+�M	&�^���A�	*

Training_loss0�BrBX$       B+�M	~�_���A�	*

Training_loss'!nBH�O$       B+�M	��s_���A�	*

Training_loss��3B�׷%$       B+�M	Ȝ_���A�	*

Training_loss�AhP�$       B+�M	:\`���A�	*

Training_loss�upB���+*       ����	r7�`���A�	*

Validation_accuracy;1m?ŋ�&&       sO� 	C;�`���A�	*

Validation_lossR	(B����$       B+�M	�">b���A�	*

Training_loss�NB��-�$       B+�M	fM�b���A�	*

Training_loss|�)B�Ɣ�$       B+�M	�ac���A�	*

Training_loss��B�uF�$       B+�M	��wc���A�	*

Training_loss��B#���$       B+�M	@��c���A�	*

Training_loss��B톧�$       B+�M	�9Fd���A�	*

Training_loss,�=B���S$       B+�M	:��d���A�	*

Training_loss(�9B����$       B+�M	>�#e���A�	*

Training_loss>�#B�.2$       B+�M	�i�e���A�	*

Training_loss��OBƖ�$       B+�M	,I�e���A�	*

Training_loss�B�3m$       B+�M	H�Sf���A�	*

Training_loss�~�As8��$       B+�M	.˸f���A�	*

Training_loss���Ad�m$       B+�M	��g���A�	*

Training_loss�\B�'�`$       B+�M	�́g���A�	*

Training_loss0OB�F��$       B+�M	4h�g���A�	*

Training_lossl�+B�1�b$       B+�M	��Dh���A�	*

Training_loss.yZB��UF$       B+�M	.��h���A�	*

Training_loss�a�Aȟ�z$       B+�M	�wi���A�	*

Training_loss�AB�݁$       B+�M	�]ei���A�	*

Training_loss��B�Y��$       B+�M	�O�i���A�	*

Training_lossގBŴ�$       B+�M	O&j���A�	*

Training_lossz�lBP	[�$       B+�M	CV�j���A�	*

Training_lossv�)B�km$       B+�M	��j���A�	*

Training_loss��)BF��$       B+�M	$�Tk���A�	*

Training_loss �jB���$       B+�M	�b�k���A�	*

Training_loss3�A[�u$       B+�M	%�#l���A�	*

Training_loss�SWB�]{$       B+�M	�S�l���A�	*

Training_loss?Bg�$t$       B+�M	���l���A�	*

Training_lossZ�Aڿ�d$       B+�M	�ycm���A�	*

Training_loss�vCB���$       B+�M	2��m���A�	*

Training_loss`�BD"K�$       B+�M	�<)n���A�	*

Training_lossu�nB���n$       B+�M	{-�n���A�	*

Training_loss��IB<�!$       B+�M	���n���A�	*

Training_losscdB���Y$       B+�M	l%o���A�	*

Training_loss-�FA�Q.	*       ����	VE�o���A�	*

Validation_accuracy;1m?���&       sO� 	�G�o���A�	*

Validation_loss@�&BltrQ$       B+�M	�R.q���A�	*

Training_loss,\B�%��$       B+�M	tҕq���A�	*

Training_loss�,B�ct$       B+�M	�0�q���A�	*

Training_loss��B�6EB$       B+�M	YTr���A�	*

Training_loss�hB/Y�$       B+�M	�$�r���A�	*

Training_loss���B;SZ�$       B+�M	y�s���A�	*

Training_loss��AT���$       B+�M	J}rs���A�	*

Training_loss01B�I�$       B+�M	��s���A�	*

Training_loss��AB�ge�$       B+�M	ڪ0t���A�	*

Training_loss�uB�k3}$       B+�M	��t���A�	*

Training_loss��B��^$       B+�M	LR�t���A�	*

Training_loss�?B4��$       B+�M	~7Qu���A�	*

Training_loss��A�#k�$       B+�M	���u���A�	*

Training_loss~8~B��[$       B+�M	{v���A�	*

Training_lossE�B��$       B+�M	 |tv���A�	*

Training_loss&�4B��2�$       B+�M	q�v���A�	*

Training_loss�0B�?�8$       B+�M	b�>w���A�	*

Training_loss��oB��ړ$       B+�M	Vצw���A�	*

Training_loss2B�`��$       B+�M	�x���A�	*

Training_lossz��A��W^$       B+�M	�{ix���A�	*

Training_lossE�Ag/!$       B+�M	���x���A�	*

Training_lossn7EB�x$       B+�M	��8y���A�	*

Training_loss���A-;�$       B+�M	�'�y���A�	*

Training_lossBQǍ�$       B+�M	��z���A�	*

Training_loss-�B�ȿ$       B+�M	�>cz���A�	*

Training_lossTLB�HP$       B+�M	���z���A�	*

Training_loss4��AstS�$       B+�M	��0{���A�	*

Training_loss��B�(��$       B+�M	�ۥ{���A�	*

Training_loss*?�A����$       B+�M	��|���A�	*

Training_losszB:�ڦ$       B+�M	�9r|���A�	*

Training_loss$��B7�$       B+�M	o��|���A�	*

Training_loss2*B>b	$       B+�M	;O}���A�	*

Training_lossv��A�$       B+�M	���}���A�	*

Training_loss�atB�u�$       B+�M	˽"~���A�	*

Training_loss�>:B:�*       ����	u��~���A�	*

Validation_accuracy;1m?q^/&       sO� 	���~���A�	*

Validation_loss-�%B����$       B+�M	<k����A�	*

Training_loss��:B���_$       B+�M	�j����A�	*

Training_lossEGBO��$       B+�M	c&Ԁ���A�	*

Training_loss��AVK�e$       B+�M	�YB����A�	*

Training_loss�[5BY��$       B+�M	'������A�	*

Training_loss��B��$       B+�M	������A�	*

Training_loss�9B�$       B+�M	1z����A�	*

Training_loss�SlB���$       B+�M	�������A�	*

Training_lossr�(B��1I$       B+�M	fJS����A�	*

Training_loss�1B�|�$       B+�M	�S�����A�	*

Training_loss�hJB#�"$       B+�M	wd$����A�	*

Training_loss��(BBA��$       B+�M	�^�����A�	*

Training_loss�i,Bi�/$       B+�M	p������A�	*

Training_lossoP�AVd�q$       B+�M	^�\����A�	*

Training_loss��B*S�$       B+�M	�������A�	*

Training_loss���B8o�$       B+�M	�(!����A�	*

Training_loss��.B��r$       B+�M	И�����A�	*

Training_loss~�2B��0a$       B+�M	�sㆿ��A�	*

Training_loss�sGBgJ��$       B+�M	\E����A�	*

Training_loss� B�=�$       B+�M	"������A�	*

Training_loss_�A�g�$$       B+�M	H2����A�	*

Training_loss�phB��`T$       B+�M	�'f����A�
*

Training_loss�%B�!�7$       B+�M	��ǈ���A�
*

Training_loss���B�`Ec$       B+�M	]�*����A�
*

Training_loss (Bi��$       B+�M	W������A�
*

Training_loss�OBKx o$       B+�M	 Vꉿ��A�
*

Training_loss5��A8��$       B+�M	@H����A�
*

Training_loss�oBzg��$       B+�M	����A�
*

Training_loss��}BO�$       B+�M	�a����A�
*

Training_lossM��B��Q$       B+�M	�ƅ����A�
*

Training_loss^�B�L�$       B+�M	@4닿��A�
*

Training_loss�\?Bf�By$       B+�M	7�M����A�
*

Training_lossT�DB�tsY$       B+�M	������A�
*

Training_lossnYBy��$       B+�M	;�����A�
*

Training_lossN�JB��*       ����	������A�
*

Validation_accuracy;1m?�G�v&       sO� 	U�����A�
*

Validation_loss�� B�&
�$       B+�M	��<����A�
*

Training_lossT�B�j"�$       B+�M	�a����A�
*

Training_loss�YA"�$       B+�M	0ŏ���A�
*

Training_lossQ�LB����$       B+�M	?�.����A�
*

Training_loss.1^Bf([$       B+�M	8�����A�
*

Training_loss��B��(Z$       B+�M	0������A�
*

Training_loss��B�-�$       B+�M	�b����A�
*

Training_loss<�$B��~$       B+�M	�ő���A�
*

Training_lossl�6B�f$       B+�M	VG%����A�
*

Training_lossxwB�1�$       B+�M	������A�
*

Training_loss��"B���b$       B+�M	�b蒿��A�
*

Training_loss��B���K$       B+�M	�XI����A�
*

Training_lossz%BcS$'$       B+�M	v������A�
*

Training_lossg BDu��$       B+�M	������A�
*

Training_loss_[B���5$       B+�M	X�p����A�
*

Training_loss��A�	ۆ$       B+�M	��֔���A�
*

Training_loss<BϨ��$       B+�M	B����A�
*

Training_loss�G�A}O$       B+�M	Sꪕ���A�
*

Training_lossR�#B9sb$       B+�M	UL����A�
*

Training_loss��EB���$       B+�M	�z����A�
*

Training_lossj�1B�O�y$       B+�M	 '�����A�
*

Training_lossбBH�$       B+�M	�H����A�
*

Training_loss�c�Aa[n$       B+�M	�ѩ����A�
*

Training_loss���A�X�$       B+�M	�>
����A�
*

Training_loss �1BG��0$       B+�M	c�l����A�
*

Training_lossP�Bg��$       B+�M	�tΘ���A�
*

Training_loss~sBc~:($       B+�M	 4����A�
*

Training_loss�[)B!Li$       B+�M	X������A�
*

Training_lossZ�>BoL�1$       B+�M	�������A�
*

Training_loss��JB�L,�$       B+�M	�(a����A�
*

Training_loss�עB ,r$       B+�M	�˚���A�
*

Training_lossM\QB)k:Q$       B+�M	�/����A�
*

Training_loss�,B-�.V$       B+�M	?9�����A�
*

Training_loss}�B�G$       B+�M	�<�����A�
*

Training_loss\��A3� *       ����	�熜���A�
*

Validation_accuracy;�m?B#b2&       sO� 	ꆜ���A�
*

Validation_loss<�$B���$       B+�M	l�-����A�
*

Training_loss�:B%�Ė$       B+�M	�z�����A�
*

Training_loss�B���S$       B+�M	H�����A�
*

Training_loss�oA�J��$       B+�M	ۉ����A�
*

Training_loss�%B ���$       B+�M	�Yo����A�
*

Training_loss�ԯA��<�$       B+�M	,�͟���A�
*

Training_loss>G/BǠ�$       B+�M	*�.����A�
*

Training_loss
`�AZ�'L$       B+�M	^ڏ����A�
*

Training_lossz�@B	��$       B+�M	����A�
*

Training_lossVB@h��$       B+�M	=�N����A�
*

Training_loss�p�AW&[$       B+�M	������A�
*

Training_lossV@@B8l)$       B+�M	,d����A�
*

Training_lossT�A��X�$       B+�M	
�s����A�
*

Training_loss)�+B���$       B+�M	9^֢���A�
*

Training_loss}ȰA��Z$       B+�M	M�9����A�
*

Training_lossw�AG$       B+�M	Ւ�����A�
*

Training_loss�SBMtci$       B+�M	�����A�
*

Training_lossl�Bx� �$       B+�M	x&q����A�
*

Training_loss�dB���$       B+�M	�2����A�
*

Training_loss1&�A-Q$       B+�M	x���A�
*

Training_loss�S~BvZ��$       B+�M	)�Ԧ���A�
*

Training_loss��B�^�$       B+�M	������A�
*

Training_loss �B�t&y$       B+�M	paK����A�
*

Training_loss�(B����$       B+�M	�WҨ���A�
*

Training_loss�HB�x��$       B+�M	I+V����A�
*

Training_lossDHB�Z��$       B+�M	�I۩���A�
*

Training_loss�Z�A�+c�$       B+�M	!�^����A�
*

Training_loss��B�FQ�$       B+�M	O�ܪ���A�
*

Training_loss���A�&��$       B+�M	��g����A�
*

Training_loss�oIB�o��$       B+�M	f���A�
*

Training_lossp�6B�H��$       B+�M	��w����A�
*

Training_loss�SYB�x�$       B+�M	� ����A�
*

Training_lossf9Bۘ)6$       B+�M	s۝����A�
*

Training_loss��BH��$       B+�M	�^F����A�
*

Training_loss4UB{e^�*       ����	�	����A�
*

Validation_accuracy;1m?SW�I&       sO� 		����A�
*

Validation_loss:�"B�V�#$       B+�M	����A�
*

Training_lossǡBͣ��$       B+�M	�m����A�
*

Training_lossDbB�+�|$       B+�M	�f߱���A�
*

Training_loss�MBFQfb$       B+�M	�����A�
*

Training_loss�Aӱľ$       B+�M	*�l����A�
*

Training_lossôZBm/��$       B+�M	��Ѳ���A�
*

Training_loss�� B���$       B+�M	�J4����A�
*

Training_loss�]BW�QP$       B+�M	tі����A�
*

Training_loss�B?�{O$       B+�M	Ӈ�����A�
*

Training_lossW
B�Z
$       B+�M	F�^����A�
*

Training_lossP�+B��ԯ$       B+�M	ѽ����A�
*

Training_loss�	#B���$       B+�M	������A�
*

Training_lossA9B ɐ�$       B+�M	Y������A�
*

Training_loss>�HBò$       B+�M	�+浿��A�
*

Training_loss��IBJ�˒$       B+�M	��D����A�
*

Training_loss�8�A���[$       B+�M	Ϡ�����A�
*

Training_loss�)B3���$       B+�M	&�����A�
*

Training_loss�}9B��ns$       B+�M	��c����A�
*

Training_lossf�IB�TJ�$       B+�M	�E·���A�
*

Training_loss�$B�jb$       B+�M	S�%����A�
*

Training_losshL�A�P�&$       B+�M	�d�����A�
*

Training_loss!srB��$       B+�M	�ḿ��A�
*

Training_lossI�A��?�$       B+�M	�A����A�
*

Training_lossX��BUB�$       B+�M	�F�����A�
*

Training_lossA��A'�1�$       B+�M	�������A�
*

Training_loss�(B[�w0$       B+�M	�=^����A�
*

Training_loss��A<agg$       B+�M	�~�����A�
*

Training_loss��OBT�@$       B+�M	�m ����A�
*

Training_loss�B�7P�$       B+�M	�󂻿��A�
*

Training_loss��B�)�$       B+�M	�"軿��A�
*

Training_lossp$�B��1�$       B+�M	�K����A�
*

Training_loss�jDB�}\I$       B+�M	*������A�
*

Training_loss�K.B��m�$       B+�M	������A�
*

Training_loss��$BV�c�$       B+�M	�Kr����A�
*

Training_loss�QB)l��*       ����	\������A�
*

Validation_accuracy;�l?�[&       sO� 	)������A�
*

Validation_loss9B����$       B+�M	v㔿���A�
*

Training_loss"UB��M$       B+�M	]n���A�
*

Training_loss�	B1Һ_$       B+�M	z�P����A�
*

Training_loss���A���$       B+�M	x�����A�
*

Training_lossZ�AT�j�$       B+�M	�.�����A�
*

Training_loss��AJ�L�$       B+�M	\�.����A�
*

Training_loss�� B���$       B+�M	b�����A�
*

Training_loss�ZBҾ>�$       B+�M	��¿��A�
*

Training_loss"J$B���$       B+�M	�&c¿��A�
*

Training_loss���A9���$       B+�M	O$�¿��A�
*

Training_loss���A~�� $       B+�M	#"ÿ��A�
*

Training_lossy�AN�� $       B+�M	3R�ÿ��A�
*

Training_loss*fABw��$       B+�M	Q��ÿ��A�
*

Training_loss��B3R�$       B+�M	�cĿ��A�*

Training_loss,�~B�OW$       B+�M	���Ŀ��A�*

Training_lossǐ�AE	`I$       B+�M	�5ſ��A�*

Training_lossT�-B�^|�$       B+�M	��ſ��A�*

Training_loss��A�A�$       B+�M	bf ƿ��A�*

Training_loss~bB�P��$       B+�M	�iaƿ��A�*

Training_lossT�B���?$       B+�M	 ��ƿ��A�*

Training_loss�@�A�QB$       B+�M	��'ǿ��A�*

Training_loss��B�YV$       B+�M	��ǿ��A�*

Training_loss�f�A	9��$       B+�M	jNȿ��A�*

Training_loss�oB� ��$       B+�M	4Չȿ��A�*

Training_loss&�ZBϓ�$       B+�M	��ȿ��A�*

Training_loss$CB�.�$       B+�M	C7Zɿ��A�*

Training_lossX�Bz�b�$       B+�M	f��ɿ��A�*

Training_loss�B����$       B+�M	+�ʿ��A�*

Training_loss�=B��B$       B+�M	��ʿ��A�*

Training_loss&�BZ�\�$       B+�M	���ʿ��A�*

Training_loss�NB@Š}$       B+�M	�D˿��A�*

Training_loss�D�A%���$       B+�M	�m�˿��A�*

Training_loss�7�AY_��$       B+�M	w�̿��A�*

Training_loss"��A�>��$       B+�M	��b̿��A�*

Training_lossN91B&z��*       ����	V�̿��A�*

Validation_accuracy;�l?��&       sO� 	BZ�̿��A�*

Validation_loss�(!B.=�@$       B+�M	��ο��A�*

Training_loss��Ac�!?$       B+�M	���ο��A�*

Training_lossa�MB�&J$       B+�M	��QϿ��A�*

Training_lossp�BEh�$       B+�M	�ήϿ��A�*

Training_loss��B�P,�$       B+�M	*�п��A�*

Training_lossj��A��H$       B+�M	��/п��A�*

Training_loss�o.A���$       B+�M	}��п��A�*

Training_loss���A)2^�$       B+�M	�g�п��A�*

Training_loss(�B]��$       B+�M	{�Hѿ��A�*

Training_loss�Q&BQ�+l$       B+�M	���ѿ��A�*

Training_lossh�GB<<�$       B+�M	ywҿ��A�*

Training_loss5) Bph�$       B+�M	�aҿ��A�*

Training_loss�G�A���
$       B+�M	�ҿ��A�*

Training_loss���AS8�$       B+�M	u=3ӿ��A�*

Training_lossƸ�A�Ƹa$       B+�M	臑ӿ��A�*

Training_lossk�4B���C$       B+�M		Կ��A�*

Training_loss;�A�Ya$       B+�M	4�zԿ��A�*

Training_loss	�A�o�$       B+�M	�&�Կ��A�*

Training_lossz�BK���$       B+�M	�lտ��A�*

Training_loss\D�AE�J�$       B+�M	a��տ��A�*

Training_lossƬbA;���$       B+�M	��]ֿ��A�*

Training_loss���Aw��$       B+�M	���ֿ��A�*

Training_lossV�#Bm�8$       B+�M	<[׿��A�*

Training_lossä*B�A��$       B+�M	Ct�׿��A�*

Training_lossD4BEM $       B+�M	ӥ[ؿ��A�*

Training_loss*M!B^���$       B+�M	��ؿ��A�*

Training_loss��B�r�$       B+�M	��Qٿ��A�*

Training_loss�B�jj|$       B+�M	�W�ٿ��A�*

Training_lossĎ&BL�ۛ$       B+�M	�@ڿ��A�*

Training_loss&5KB��R"$       B+�M	�˸ڿ��A�*

Training_loss��B��\z$       B+�M	�]3ۿ��A�*

Training_lossJ�;B�	j$       B+�M	8�ۿ��A�*

Training_loss��EB����$       B+�M	4�%ܿ��A�*

Training_lossb�B��v$       B+�M	/�ܿ��A�*

Training_loss��\B��C�*       ����	��]ݿ��A�*

Validation_accuracy;�l?Q�<&       sO� 	�]ݿ��A�*

Validation_losslvB�J'�$       B+�M	û�߿��A�*

Training_loss�X B*��,$       B+�M	�MM���A�*

Training_lossa^�A��$       B+�M	������A�*

Training_loss�BBF�8
$       B+�M	��I���A�*

Training_loss��(B�-�"$       B+�M	v����A�*

Training_loss��B\�ߦ$       B+�M	LoF���A�*

Training_loss�<�B���$       B+�M	��u���A�*

Training_lossv"Asʋ$       B+�M	E�����A�*

Training_loss�<B4!�$       B+�M	�2q���A�*

Training_loss�YB a�$       B+�M	/����A�*

Training_lossB\Bf���$       B+�M	�m_���A�*

Training_loss�R)B�Q�$       B+�M	�|����A�*

Training_loss�R�Az��$       B+�M	k�K���A�*

Training_loss �B�0�$       B+�M	DO����A�*

Training_loss��B�(�$       B+�M	J8���A�*

Training_loss�6�A@e@$       B+�M	�����A�*

Training_loss�TB���$       B+�M	^�-���A�*

Training_loss���A�?�$       B+�M	%�����A�*

Training_losszbB(Zl$       B+�M	�����A�*

Training_loss��3B@�M�$       B+�M	������A�*

Training_loss���AZ�-�$       B+�M	B�
���A�*

Training_loss�k,B6�_�$       B+�M	t�����A�*

Training_loss��!B�N�2$       B+�M	�����A�*

Training_loss �Bm�T�$       B+�M	�o���A�*

Training_loss�:B$��^$       B+�M	2�����A�*

Training_loss�eCB���?$       B+�M	�[���A�*

Training_loss�QB���$       B+�M	Xu����A�*

Training_loss�*B^��$       B+�M	&I���A�*

Training_loss��AfB��$       B+�M	����A�*

Training_loss�]BmGp�$       B+�M	t�5����A�*

Training_loss�B���>$       B+�M	������A�*

Training_losst�1B�E-�$       B+�M	��!���A�*

Training_lossy��A��$       B+�M	侉���A�*

Training_loss�"B�$       B+�M	������A�*

Training_loss�tSBA�0�*       ����	�p���A�*

Validation_accuracy�Nn?+"Uk&       sO� 	̵p���A�*

Validation_loss�� BUť$       B+�M	�<2���A�*

Training_loss�.+B�A�$       B+�M	�ۏ���A�*

Training_loss�$B�0q$       B+�M	kI����A�*

Training_loss���AL�v�$       B+�M	H4Q���A�*

Training_loss���B'�f�$       B+�M	�5����A�*

Training_loss��AA��$       B+�M	����A�*

Training_lossy��A��/�$       B+�M	 _u���A�*

Training_loss%��A�-$       B+�M	)�����A�*

Training_loss�(A�셄$       B+�M	�m����A�*

Training_lossl��A����$       B+�M	�]����A�*

Training_loss��A_pR$       B+�M	�q�����A�*

Training_loss���By�$       B+�M	�� ����A�*

Training_lossP�A��M�$       B+�M	nO�����A�*

Training_loss1�B�ݒ�$       B+�M	������A�*

Training_lossЅ#Bf�!;$       B+�M	ҪB����A�*

Training_loss��B�h�?$       B+�M	'ݢ����A�*

Training_loss�K&B�#�$       B+�M	�����A�*

Training_loss��B67�$       B+�M	��^����A�*

Training_lossq�4B\{�>$       B+�M	x������A�*

Training_loss=>�A����$       B+�M	�0����A�*

Training_loss��`B��| $       B+�M	w������A�*

Training_loss��<B=i�1$       B+�M	mV�����A�*

Training_loss�v~A	1t�$       B+�M	i�`����A�*

Training_loss�]$B�=�^$       B+�M	�-�����A�*

Training_loss`[�A���$       B+�M	�,����A�*

Training_loss���A|w�$       B+�M	�������A�*

Training_loss��A�c�$       B+�M	�������A�*

Training_loss �HB5g�$       B+�M	O����A�*

Training_loss��CB��)�$       B+�M	�/�����A�*

Training_lossl�A�7�$       B+�M	������A�*

Training_loss�)B��V$       B+�M	�!s����A�*

Training_loss�h�Aߥ��$       B+�M	w�����A�*

Training_loss���A�o9z$       B+�M	?�6����A�*

Training_loss�"/B�ǧ�$       B+�M	ˡ�����A�*

Training_lossk�A?m�N*       ����	������A�*

Validation_accuracy;�l?��&       sO� 	ę����A�*

Validation_loss��B�CE�$       B+�M	�������A�*

Training_loss�DAB��^$       B+�M	*XY ���A�*

Training_loss�h Bk�C�$       B+�M	e� ���A�*

Training_loss/BB�S6$       B+�M	8���A�*

Training_losszXBv?$       B+�M	1Ew���A�*

Training_lossԋB���6$       B+�M	������A�*

Training_loss!o�Aa}K$       B+�M	��1���A�*

Training_loss�&Bå
'$       B+�M	�����A�*

Training_loss�erB:'j$       B+�M	$ӳ���A�*

Training_loss`��A4���$       B+�M	�����A�*

Training_loss_�Agt�v$       B+�M	#�o���A�*

Training_lossP��A@�N�$       B+�M	"n����A�*

Training_lossd}1B��d�$       B+�M	}Y*���A�*

Training_loss<�<Bm%��$       B+�M	n�����A�*

Training_lossY{3B�~v$       B+�M	>Y����A�*

Training_loss�l�AHq#$       B+�M		C���A�*

Training_loss AB�K��$       B+�M	�>����A�*

Training_loss�?B�-$       B+�M	q;����A�*

Training_loss5��A6j	�$       B+�M	z�Z���A�*

Training_lossrqB�.ؒ$       B+�M	&Ÿ���A�*

Training_loss�DuB����$       B+�M	3����A�*

Training_loss��kAb+i�$       B+�M	X�s���A�*

Training_loss�A�
 �$       B+�M	,c����A�*

Training_loss���A�Y�$       B+�M	)w/���A�*

Training_loss� �A���$       B+�M	�6����A�*

Training_loss�@A9>t$       B+�M	������A�*

Training_loss��!Bյ�$       B+�M	 G	���A�*

Training_loss9��A�卆$       B+�M	W	�	���A�*

Training_loss�v=B�;D<$       B+�M	nP
���A�*

Training_loss5:�AUI$       B+�M	��^
���A�*

Training_loss�wBf�$       B+�M	VG�
���A�*

Training_loss�p#Br9�z$       B+�M	�E���A�*

Training_lossFC�AG�1t$       B+�M	p	v���A�*

Training_loss�iB��$       B+�M	B����A�*

Training_loss"vB�V�*       ����	{�Z���A�*

Validation_accuracy�Nm?� �&       sO� 	��Z���A�*

Validation_lossB�%B�$       B+�M	�-���A�*

Training_loss�#YB�5==$       B+�M	d����A�*

Training_loss��A�A�P$       B+�M	;o����A�*

Training_loss:��A�UU�$       B+�M	�d���A�*

Training_loss5�An��$       B+�M	�z����A�*

Training_lossDBg�)$       B+�M	��1���A�*

Training_loss��*B����$       B+�M	U2����A�*

Training_loss��ARi��$       B+�M	~����A�*

Training_loss&��A�o�y$       B+�M	qUU���A�*

Training_loss`��A�PD$       B+�M	 y���A�*

Training_lossJ&�A�Q�~$       B+�M	7m����A�*

Training_loss��B8�Û$       B+�M	�2���A�*

Training_loss���A]��$       B+�M	z�����A�*

Training_lossS.�A��|$       B+�M	������A�*

Training_loss��B�<ۂ$       B+�M	�FI���A�*

Training_loss'�	B�t)4$       B+�M	c����A�*

Training_loss61�A�N$       B+�M	�>���A�*

Training_loss��0B�I�$       B+�M	��`���A�*

Training_loss���AR�Y�$       B+�M	�V����A�*

Training_lossQ�+B2	e-$       B+�M	����A�*

Training_lossI�A���($       B+�M	8�v���A�*

Training_loss�W:B����$       B+�M	A�����A�*

Training_loss���A�J(%$       B+�M	O�1���A�*

Training_loss^KBK$       B+�M	я���A�*

Training_lossV�B�n�$       B+�M	����A�*

Training_loss�p�A5��Y$       B+�M	]�J���A�*

Training_loss��"B��� $       B+�M	9'����A�*

Training_loss��A�y��$       B+�M	���A�*

Training_loss��Bˎj�$       B+�M	�`���A�*

Training_loss!I�As1�$       B+�M	�����A�*

Training_lossh�A���$       B+�M	: ���A�*

Training_loss���A7�!�$       B+�M	�vx���A�*

Training_loss	�WBNG�$       B+�M	�����A�*

Training_loss��B΢x�$       B+�M	�62���A�*

Training_loss�\3Bߴ��*       ����	�e����A�*

Validation_accuracy�m?:Ų&       sO� 	ni����A�*

Validation_lossG[B�\�$       B+�M	��n���A�*

Training_loss�9#B��e�$       B+�M	=�����A�*

Training_loss=��A�yV�$       B+�M	X�(���A�*

Training_lossJ��An���$       B+�M	�Չ���A�*

Training_loss\	�A)j,$       B+�M	'�����A�*

Training_loss���A�[�$       B+�M	йC���A�*

Training_loss�A��v $       B+�M	�e����A�*

Training_loss�I'B�_��$       B+�M	�T����A�*

Training_losszrB@��Z$       B+�M	Cq^���A�*

Training_loss��QB9M�4$       B+�M	2t����A�*

Training_loss��	B�(��$       B+�M	�����A�*

Training_lossz�?3���$       B+�M	}= ���A�*

Training_loss+��A}`��$       B+�M	PS� ���A�*

Training_loss	�Agc�$       B+�M	�U� ���A�*

Training_loss�q�A�
u$       B+�M	1%U!���A�*

Training_lossRhB& s�$       B+�M	K�!���A�*

Training_loss�BC�i$       B+�M	2�"���A�*

Training_loss�g�AD~�$       B+�M	��k"���A�*

Training_loss�)Bj	ſ$       B+�M	���"���A�*

Training_loss�,Bh� $       B+�M	 &#���A�*

Training_loss�B�A�7$       B+�M	'1�#���A�*

Training_loss��QB�0�$       B+�M	}�#���A�*

Training_loss�Y�A�/�$       B+�M	�=$���A�*

Training_loss"JA�/��$       B+�M	~��$���A�*

Training_loss�5�Aa��'$       B+�M	!�$���A�*

Training_loss
�A�^�,$       B+�M	�@T%���A�*

Training_loss��2B���7$       B+�M	d\�%���A�*

Training_loss��#BV)`�$       B+�M	d&���A�*

Training_lossr��A��
�$       B+�M	��j&���A�*

Training_loss��(B� ?$       B+�M	�X�&���A�*

Training_lossbtB��J`$       B+�M	�%'���A�*

Training_lossy��A"U)�$       B+�M	 ��'���A�*

Training_loss���A�"�:$       B+�M	���'���A�*

Training_loss�5B{2��$       B+�M	�m=(���A�*

Training_loss�HB46�
*       ����	ji�(���A�*

Validation_accuracy;�l?��Z�&       sO� 	l�(���A�*

Validation_loss$�B���$       B+�M	P5�*���A�*

Training_lossB��_$       B+�M	�0�*���A�*

Training_loss�!iA����$       B+�M	Y�Q+���A�*

Training_lossʛA�X�$       B+�M	x�+���A�*

Training_lossS��A���$       B+�M	�,���A�*

Training_loss�s�A�:K$       B+�M	�/k,���A�*

Training_loss��
B(YQ�$       B+�M	g*�,���A�*

Training_losshA?BiE��$       B+�M	��'-���A�*

Training_loss&M-B8���$       B+�M	eރ-���A�*

Training_loss-�B����$       B+�M	)[�-���A�*

Training_lossBB�=be$       B+�M	+L>.���A�*

Training_loss�B�"�$       B+�M	 Fb.���A�*

Training_loss��AW;�f$       B+�M	��.���A�*

Training_loss�Q�A� ��$       B+�M	�F/���A�*

Training_loss<�B0xPJ$       B+�M	�z/���A�*

Training_loss�A�B��$       B+�M	��/���A�*

Training_loss�J5B^\&$       B+�M	n�30���A�*

Training_loss�9B�C�p$       B+�M	�0���A�*

Training_loss�U�A<��e$       B+�M	`�0���A�*

Training_loss�=B��p�$       B+�M	��J1���A�*

Training_lossȂRB�F�$       B+�M	�5�1���A�*

Training_loss���Ai���$       B+�M	i2���A�*

Training_loss)�B�@$       B+�M	=�h2���A�*

Training_lossJ%�ArΆ$       B+�M	!Z�2���A�*

Training_loss��A`]$       B+�M	@m$3���A�*

Training_lossr-�Ak�u}$       B+�M	`��3���A�*

Training_lossM�B�gv$       B+�M	`��3���A�*

Training_loss�>B���$       B+�M	�<4���A�*

Training_loss���A���$       B+�M	��4���A�*

Training_loss�װA��K�$       B+�M	�4���A�*

Training_loss��Ad7�$       B+�M	lCT5���A�*

Training_loss�B��f�$       B+�M	��5���A�*

Training_loss�B��$       B+�M	�6���A�*

Training_loss��A��?$       B+�M	��k6���A�*

Training_loss)y�A���g*       ����	:#�6���A�*

Validation_accuracy;�m?�&�&       sO� 	_&�6���A�*

Validation_loss)U$B��$       B+�M	K>�8���A�*

Training_losst��Ax��$       B+�M	#I'9���A�*

Training_loss�	B���$       B+�M	�9���A�*

Training_loss��B�J܆$       B+�M	�e�9���A�*

Training_loss�P�B{A��$       B+�M	�X?:���A�*

Training_lossz�BS��$       B+�M	 ��:���A�*

Training_lossTA���$       B+�M	�8�:���A�*

Training_loss@8LB�@�$       B+�M	�PX;���A�*

Training_loss��A$�o{$       B+�M	kҸ;���A�*

Training_loss�a�AT+#$       B+�M	�0<���A�*

Training_loss���A{$,�$       B+�M	R
z<���A�*

Training_lossԂNB~���$       B+�M	a��<���A�*

Training_loss��A�E[;$       B+�M	�7 =���A�*

Training_lossqPX@z�h$       B+�M	`�a=���A�*

Training_loss[=$B�$       B+�M	2��=���A�*

Training_loss��)Bƈxy$       B+�M	*�#>���A�*

Training_loss[b�A �3$       B+�M	 �>���A�*

Training_loss��)B�19$       B+�M	��>���A�*

Training_lossn�A�M$       B+�M	
�D?���A�*

Training_loss��A�i_�$       B+�M	쥤?���A�*

Training_lossP��A�nV�$       B+�M	6�@���A�*

Training_loss:"�A�&��$       B+�M	�h@���A�*

Training_loss�R�A�+�$       B+�M	f��@���A�*

Training_lossW��A��IB$       B+�M	��*A���A�*

Training_lossĥBú�2$       B+�M	���A���A�*

Training_loss|�A�G�)$       B+�M	l!�A���A�*

Training_loss؎�AK�@$       B+�M	k\B���A�*

Training_losssTAoÖ$       B+�M	`�B���A�*

Training_loss%�IB�|��$       B+�M	�{C���A�*

Training_lossVi�As�i�$       B+�M	m�C���A�*

Training_loss7�B#9-$       B+�M	VF�C���A�*

Training_loss+9BCk$$       B+�M	��ID���A�*

Training_loss���A�̑$       B+�M	��D���A�*

Training_loss��A�/��$       B+�M	��E���A�*

Training_loss��B�ч�*       ����	T�E���A�*

Validation_accuracy;1m?�c"&       sO� 	�V�E���A�*

Validation_loss�5By&*$       B+�M	
L�G���A�*

Training_loss���ARd~�$       B+�M	��G���A�*

Training_loss���AE��$       B+�M	�aFH���A�*

Training_loss��IB�I�$       B+�M	�5�H���A�*

Training_loss~�A۠��$       B+�M	�I���A�*

Training_lossq83BR$       B+�M	��`I���A�*

Training_losssV�A�U�$       B+�M	��I���A�*

Training_loss�B�\k�$       B+�M	#�J���A�*

Training_loss�ERB�.�	$       B+�M	�hxJ���A�*

Training_loss'&BƂF�$       B+�M	��J���A�*

Training_lossA6�A�}��$       B+�M	!;3K���A�*

Training_loss;dBkC�$       B+�M	�m�K���A�*

Training_loss���A�(��$       B+�M	�~�K���A�*

Training_loss��6BY8O>$       B+�M	�L���A�*

Training_loss��%A��$       B+�M	�;pL���A�*

Training_loss5n�A��F$       B+�M	�{�L���A�*

Training_loss���A�v/�$       B+�M	'.M���A�*

Training_lossmt`Ag��$       B+�M	$H�M���A�*

Training_losspB�M,$       B+�M	��M���A�*

Training_lossF�B�n�P$       B+�M	�&PN���A�*

Training_lossJ�A���$       B+�M	Y��N���A�*

Training_loss|@B!m��$       B+�M	��O���A�*

Training_loss�F8ByT�$       B+�M	.�nO���A�*

Training_loss�kB��0�$       B+�M	\ �O���A�*

Training_loss��A�Y��$       B+�M	�v)P���A�*

Training_loss*d�A�Ƀ"$       B+�M	Gw�P���A�*

Training_loss��B�Mw$       B+�M	t'�P���A�*

Training_losso�A��G�$       B+�M	�x@Q���A�*

Training_loss��B���c$       B+�M	���Q���A�*

Training_loss�B���e$       B+�M	5��Q���A�*

Training_lossL�YB=���$       B+�M	F"XR���A�*

Training_loss��1B �.$       B+�M	�{�R���A�*

Training_loss̯ B)�UO$       B+�M	+S���A�*

Training_loss�B���$       B+�M	��pS���A�*

Training_loss+DB_�*       ����	���S���A�*

Validation_accuracy;1m?ٺ�Y&       sO� 	S��S���A�*

Validation_loss��B�5s$       B+�M	1��U���A�*

Training_loss�V�Ab}<u$       B+�M	S"DV���A�*

Training_loss"i�A��̦$       B+�M	n��V���A�*

Training_loss[B��$       B+�M	ep	W���A�*

Training_loss��AĐ��$       B+�M	�gW���A�*

Training_loss���Ag��=$       B+�M	;�W���A�*

Training_loss��*B�y�=$       B+�M	��!X���A�*

Training_lossl�AOe�4$       B+�M	.�~X���A�*

Training_loss
HB���S$       B+�M	t��X���A�*

Training_loss�B��[�$       B+�M		�=Y���A�*

Training_lossN��A\��$       B+�M	T��Y���A�*

Training_loss�;�AA�7$       B+�M	>A�Y���A�*

Training_loss�M�AWB$       B+�M	�UZ���A�*

Training_lossh�B�%�$       B+�M	���Z���A�*

Training_loss+��A��u�$       B+�M	��Z���A�*

Training_loss�=,A��2�$       B+�M	|�6[���A�*

Training_lossoUBi�-�$       B+�M	j�[���A�*

Training_lossaX�A���l$       B+�M	���[���A�*

Training_loss:B~}g�$       B+�M	��R\���A�*

Training_loss�\{AW���$       B+�M	A�\���A�*

Training_loss�!B�e��$       B+�M	5*]���A�*

Training_loss��6B���7$       B+�M	�k]���A�*

Training_losse�mA�zn�$       B+�M	%�]���A�*

Training_loss�āA�!�$       B+�M	P�/^���A�*

Training_loss�ڋA^�5|$       B+�M	�ޕ^���A�*

Training_loss�](BK�$       B+�M	�=_���A�*

Training_loss���A]��$       B+�M	|_���A�*

Training_loss���A�l�@$       B+�M	��_���A�*

Training_loss�e
B��$       B+�M	^�_`���A�*

Training_loss�5B��1F$       B+�M	�x�`���A�*

Training_loss�B�jb$       B+�M	�~,a���A�*

Training_loss��A����$       B+�M	�ۈa���A�*

Training_loss���A��*$       B+�M	���a���A�*

Training_loss���A���$       B+�M	��Lb���A�*

Training_lossٝA�FI�*       ����	 ;�b���A�*

Validation_accuracy��m?���&       sO� 	:=�b���A�*

Validation_loss��B�L��$       B+�M	M��d���A�*

Training_loss3�B{BT($       B+�M	 �1e���A�*

Training_loss�uB���$       B+�M	?�e���A�*

Training_loss���A�ƅ�$       B+�M	b0�e���A�*

Training_loss�~�A2@d_$       B+�M	=Sf���A�*

Training_loss�Y�Av�KI$       B+�M	Ǵf���A�*

Training_loss�A1Z�$       B+�M	!�g���A�*

Training_lossV�B�.�|$       B+�M	p|tg���A�*

Training_loss{�!B��$       B+�M	�:�g���A�*

Training_loss�'B�18&$       B+�M	!�3h���A�*

Training_loss�$�An�)$       B+�M	i��h���A�*

Training_loss�hB�OR$       B+�M	,��h���A�*

Training_lossi�B��9$       B+�M	�UPi���A�*

Training_loss��vAP�Zo$       B+�M	�z�i���A�*

Training_loss��B���,$       B+�M	�r
j���A�*

Training_loss��$BEx�$       B+�M	DN-j���A�*

Training_losst�@�rb�$       B+�M	�i�j���A�*

Training_loss B+'#e$       B+�M	���j���A�*

Training_loss�A�Eq0$       B+�M	Dk���A�*

Training_loss�/�AW���$       B+�M	s��k���A�*

Training_lossW�SB�ӱ$       B+�M	���k���A�*

Training_lossC@�A�zst$       B+�M	�,[l���A�*

Training_loss���AG�tw$       B+�M	�˷l���A�*

Training_lossH�cA;�(�$       B+�M	*m���A�*

Training_losso��A��-�$       B+�M	mqm���A�*

Training_loss|�MB�Q �$       B+�M	��m���A�*

Training_loss$�A'��$       B+�M	og,n���A�*

Training_lossб�A�y#�$       B+�M	|��n���A�*

Training_lossg��A�kg$       B+�M	�\�n���A�*

Training_loss�#B� ~$       B+�M	%Eo���A�*

Training_loss�r5B��6�$       B+�M	|��o���A�*

Training_lossz'mAL$       B+�M	6��o���A�*

Training_loss�zB/D0�$       B+�M	Ɏ\p���A�*

Training_lossĜB�̀=$       B+�M	5��p���A�*

Training_lossA��A���b*       ����	��Hq���A�*

Validation_accuracy;1m?:��@&       sO� 	��Hq���A�*

Validation_loss�NB�Ug$       B+�M	i�=s���A�*

Training_loss}B4)�$       B+�M	���s���A�*

Training_lossxyB!��B$       B+�M	n��s���A�*

Training_lossQ)�A�Q�y$       B+�M	�^Wt���A�*

Training_lossj]NAZ��$       B+�M	���t���A�*

Training_loss~�<B��c$       B+�M	�cu���A�*

Training_loss=��Aw��$       B+�M	L�mu���A�*

Training_loss��A�6�3$       B+�M	���u���A�*

Training_losso��Az�$       B+�M	nj&v���A�*

Training_loss�A`}�$       B+�M	�E�v���A�*

Training_loss�a�A�EsE$       B+�M	Q�v���A�*

Training_loss�<�Aa��$       B+�M	\Jw���A�*

Training_loss���A�T�F$       B+�M	�w���A�*

Training_loss �A$��$       B+�M	��x���A�*

Training_loss/�A�4�Q$       B+�M	��bx���A�*

Training_loss)��AKzw,$       B+�M	J��x���A�*

Training_loss8	�A��J$       B+�M	�*�x���A�*

Training_lossuFAAeLO�$       B+�M	n�Cy���A�*

Training_loss�x�A-Y&P$       B+�M	�\�y���A�*

Training_lossKB�AP>�$       B+�M	m��y���A�*

Training_loss5��AU��R$       B+�M	_�Yz���A�*

Training_loss/O�A�ٔ-$       B+�M	2v�z���A�*

Training_lossx�`B�!�2$       B+�M	��{���A�*

Training_losst�B��V$       B+�M	�Yo{���A�*

Training_loss�/�A��	$       B+�M	���{���A�*

Training_losse�
B���$       B+�M	J)1|���A�*

Training_loss��B�ye�$       B+�M	�@�|���A�*

Training_loss�	�A�gt9$       B+�M	W��|���A�*

Training_loss�.B��B�$       B+�M	�#_}���A�*

Training_loss�N�A8�v�$       B+�M	���}���A�*

Training_lossj$�A����$       B+�M	�,'~���A�*

Training_loss��BГ2$       B+�M	���~���A�*

Training_loss��A�ޏ�$       B+�M	\��~���A�*

Training_loss}Z�AMf]$       B+�M	cCZ���A�*

Training_lossΜB��=*       ����	������A�*

Validation_accuracy�Nn?��[&       sO� 	v�����A�*

Validation_loss� B�v&$       B+�M	�������A�*

Training_loss"��A(;�p$       B+�M	�c����A�*

Training_loss�i�A����$       B+�M	��Â���A�*

Training_loss���AЀ�B$       B+�M	��%����A�*

Training_loss��B�.�_$       B+�M	�>�����A�*

Training_loss��AF�L5$       B+�M	XW����A�*

Training_lossZu�Ah�z$       B+�M	��F����A�*

Training_loss���A䟌�$       B+�M	eߧ����A�*

Training_loss�+B�Mv$       B+�M	�Y����A�*

Training_lossE�A�j�P$       B+�M	P�����A�*

Training_lossT��A�;�$       B+�M	����A�*

Training_loss]��A���Q$       B+�M	X�O����A�*

Training_loss.�Bz��$       B+�M	�ٴ����A�*

Training_loss�[�A����$       B+�M	�k����A�*

Training_lossl�AC�P�$       B+�M	�������A�*

Training_loss��'BEs��$       B+�M	����A�*

Training_lossf��A�]�$       B+�M	�I\����A�*

Training_loss��'B$1g�$       B+�M	S^�����A�*

Training_loss_�IAD�$       B+�M	g�݈���A�*

Training_loss�|&B��O�$       B+�M	��:����A�*

Training_loss�b�A�F�f$       B+�M	ᗉ���A�*

Training_loss��A��D$       B+�M	������A�*

Training_lossb6�A1"�f$       B+�M	I�R����A�*

Training_loss�n�A�0�B$       B+�M	ϟ�����A�*

Training_loss���AK�"�$       B+�M	������A�*

Training_lossȖ�A���$       B+�M	��i����A�*

Training_lossx��A���d$       B+�M	�/ǋ���A�*

Training_loss5+B��|v$       B+�M	($����A�*

Training_loss�h�A��$       B+�M	|���A�*

Training_loss��AT�$       B+�M	w�݌���A�*

Training_loss֙A�c1-$       B+�M	�%;����A�*

Training_loss���A����$       B+�M	@l�����A�*

Training_lossxB�A}��b$       B+�M	 `�����A�*

Training_lossu�@��7"$       B+�M	��R����A�*

Training_lossZd�A����*       ����	�~؎���A�*

Validation_accuracy��m?�pm�&       sO� 	|�؎���A�*

Validation_loss�3B����$       B+�M	^�ѐ���A�*

Training_loss�B�$       B+�M	�.����A�*

Training_loss���AI͑9$       B+�M	�������A�*

Training_lossm�A���|$       B+�M	K�����A�*

Training_losst�A�Q��$       B+�M	G�F����A�*

Training_lossQV�A�
�i$       B+�M	;������A�*

Training_loss��Bys�>$       B+�M	�� ����A�*

Training_loss���A����$       B+�M	�g_����A�*

Training_loss
��A�67�$       B+�M	"�����A�*

Training_loss�$B�3�$       B+�M	�����A�*

Training_loss�BAX8z5$       B+�M	R|����A�*

Training_loss|$B��S$       B+�M	Xؔ���A�*

Training_lossʪ-A?��y$       B+�M	~�5����A�*

Training_loss���AbIx�$       B+�M	.S�����A�*

Training_losse�AUv<�$       B+�M	������A�*

Training_loss}�At_�$       B+�M	�rN����A�*

Training_loss�]B^$       B+�M	}Ы����A�*

Training_lossɈ�A�#�$       B+�M	SX	����A�*

Training_lossXY�A.�I�$       B+�M	 *.����A�*

Training_loss��LA�&J$       B+�M	񸊗���A�*

Training_lossJ��A{�&�$       B+�M	d�����A�*

Training_lossм�A�d�$       B+�M	�yD����A�*

Training_loss���A��"�$       B+�M	B�����A�*

Training_lossU�	B(��0$       B+�M	�_�����A�*

Training_loss�m�A��B�$       B+�M	J]����A�*

Training_loss�;�A���I$       B+�M	f�����A�*

Training_loss��hA['$       B+�M	�����A�*

Training_lossuR�A@�g$       B+�M	"�t����A�*

Training_loss.�5A@-v$       B+�M	 RҚ���A�*

Training_loss�{~Axt$       B+�M	G0����A�*

Training_loss`�A�Q!q$       B+�M	"����A�*

Training_loss���A���$       B+�M	9�����A�*

Training_lossq�B�t��$       B+�M	�<F����A�*

Training_loss��A�f��$       B+�M	�����A�*

Training_lossZ�A�2�4*       ����	VI)����A�*

Validation_accuracy��m?Z���&       sO� 	{L)����A�*

Validation_loss�mB�+�@$       B+�M	��0����A�*

Training_loss�RB5�$       B+�M	�{�����A�*

Training_loss�U1BVw��$       B+�M	$�����A�*

Training_loss��B^��,$       B+�M	\sH����A�*

Training_loss���A�`�$       B+�M	$�����A�*

Training_loss�ǫAS���$       B+�M	�!����A�*

Training_lossb��AZ��Y$       B+�M	fj`����A�*

Training_lossyT%B��$       B+�M	7�����A�*

Training_loss�ǴAĲN�$       B+�M	�k1����A�*

Training_loss�z�B�BC$       B+�M	I�����A�*

Training_losse��A��t�$       B+�M	������A�*

Training_loss��AKd�$       B+�M	��[����A�*

Training_lossνB��$       B+�M	��ԣ���A�*

Training_lossL�A����$       B+�M	��Q����A�*

Training_loss&�A��|�$       B+�M	 t�����A�*

Training_loss֝�Aў��$       B+�M	c�����A�*

Training_loss��&BQ���$       B+�M	��u����A�*

Training_loss~�A�:9$       B+�M	7Rץ���A�*

Training_loss�@B3#H7$       B+�M	؞:����A�*

Training_lossWB�AC䋪$       B+�M	��^����A�*

Training_loss�A.@B�Y$       B+�M	�/�����A�*

Training_loss@n�Aݯ�V$       B+�M	C�����A�*

Training_loss{�4B�>	$       B+�M	��u����A�*

Training_loss�EA�%i4$       B+�M	��ӧ���A�*

Training_loss�&B�u`b$       B+�M	�01����A�*

Training_loss6yBw� $       B+�M	ߎ����A�*

Training_loss�ƽA�"$       B+�M	������A�*

Training_loss��A/@�$       B+�M	0�G����A�*

Training_loss���A=jQ6$       B+�M	䥩���A�*

Training_loss�A~�^j$       B+�M	�6����A�*

Training_lossz��A1=Ih$       B+�M	�b����A�*

Training_loss4��A
,*F$       B+�M	�������A�*

Training_loss��yA���2$       B+�M	z�����A�*

Training_lossR�Bs�$       B+�M	c�z����A�*

Training_loss&�A���*       ����	�;����A�*

Validation_accuracy��m?6��-&       sO� 	l>����A�*

Validation_loss�nBE,�$       B+�M	>�����A�*

Training_loss�fgBv�72$       B+�M	<l����A�*

Training_lossF�Bp q$       B+�M	b�ɮ���A�*

Training_loss ��A�g$       B+�M	�%����A�*

Training_loss>�+B��"$       B+�M	�������A�*

Training_loss6�B��$       B+�M	�߯���A�*

Training_loss$��A��|$       B+�M	h�<����A�*

Training_loss��As){Z$       B+�M	>������A�*

Training_lossx�TA"3s�$       B+�M	�������A�*

Training_loss,�A�i2�$       B+�M	��U����A�*

Training_loss��A0�{$       B+�M	�������A�*

Training_loss�XBGz�$       B+�M	"�����A�*

Training_loss�7AU�A�$       B+�M	4n����A�*

Training_loss��A+af$       B+�M	�˲���A�*

Training_loss�FBr��$       B+�M	�C(����A�*

Training_loss�,�A� "�$       B+�M	�ȅ����A�*

Training_loss�B��$       B+�M	������A�*

Training_loss�	B9^��$       B+�M	�?����A�*

Training_loss;�MB��P$       B+�M	�᝴���A�*

Training_loss���AZ�p$       B+�M	������A�*

Training_loss�B<�z	$       B+�M	;m����A�*

Training_loss��?%�g�$       B+�M	��|����A�*

Training_loss�N)B���j$       B+�M	� ڵ���A�*

Training_lossa�A��*�$       B+�M	�97����A�*

Training_loss�1BA�!�$       B+�M	�㔶���A�*

Training_loss_B=�j�$       B+�M	�����A�*

Training_lossi՜A��|k$       B+�M	W�P����A�*

Training_loss0�A�;1$       B+�M	u歷���A�*

Training_lossb��A�Y��$       B+�M	��
����A�*

Training_loss6�A���$       B+�M	7h����A�*

Training_loss�īA|ݽ9$       B+�M	i�Ÿ���A�*

Training_lossDE:BI���$       B+�M	Ӈ"����A�*

Training_loss�%�Axy�$       B+�M	������A�*

Training_loss��A~�k�$       B+�M	�_ݹ���A�*

Training_loss~.�A��j"*       ����	��d����A�*

Validation_accuracy�Nn?�w��&       sO� 	��d����A�*

Validation_lossB_B�Ђ$       B+�M	{f�����A�*

Training_loss���A�($       B+�M	�_����A�*

Training_loss`��AǶ+O$       B+�M	��K����A�*

Training_loss�r�Ao�q�$       B+�M	�k�����A�*

Training_loss�eBjCl�$       B+�M	�/����A�*

Training_lossQb�Aa�c$       B+�M	�ta����A�*

Training_loss"A�A��;$       B+�M	�L�����A�*

Training_loss��dA���$       B+�M	�����A�*

Training_loss]�$B
��r$       B+�M	��y����A�*

Training_loss��;Bw���$       B+�M	�nֿ���A�*

Training_loss��	B�_$       B+�M	�4����A�*

Training_loss�m�A)\ �$       B+�M	DL�����A�*

Training_loss/�Ajײ0$       B+�M	5������A�*

Training_loss��A��$       B+�M	K K����A�*

Training_loss-CBJ��$       B+�M	p������A�*

Training_loss�Y�A﹍�$       B+�M	������A�*

Training_loss�,B�$�$       B+�M	IGb����A�*

Training_loss"��A����$       B+�M	c������A�*

Training_loss�;�@�k�$       B+�M	�R����A�*

Training_lossV�"A��0�$       B+�M	��y����A�*

Training_loss���A����$       B+�M	������A�*

Training_loss���Ak��$       B+�M	�������A�*

Training_lossS�]A��N$       B+�M	�X����A�*

Training_lossNn�A���$       B+�M	� �����A�*

Training_loss��)B2+}�$       B+�M	�f����A�*

Training_lossgBx�hE$       B+�M	Ep����A�*

Training_loss�٢A��X�$       B+�M	^f�����A�*

Training_loss%&�Awf��$       B+�M	��)����A�*

Training_loss�
B>�i?$       B+�M	Ee�����A�*

Training_lossPW�A��uT$       B+�M	Z�����A�*

Training_lossLB���$       B+�M	ߋ?����A�*

Training_loss(S�Ah#�d$       B+�M	,�����A�*

Training_loss��A���$       B+�M	y� ����A�*

Training_lossg�.B����$       B+�M	E^����A�*

Training_loss$��A�#�*       ����	u�����A�*

Validation_accuracy�Nn?�{<C&       sO� 	Fx�����A�*

Validation_lossV�B�j�`$       B+�M	m������A�*

Training_loss��A̳$       B+�M	�@[����A�*

Training_loss��A��$       B+�M	t�����A�*

Training_loss�I�A��*$       B+�M	e����A�*

Training_loss���A�$       B+�M	[�q����A�*

Training_lossY��Ajï�$       B+�M	Q������A�*

Training_loss�B�$       B+�M	q�+����A�*

Training_loss>��A[b-$       B+�M	������A�*

Training_loss�{BӔ!$       B+�M	H������A�*

Training_loss��A�}
m$       B+�M	�3A����A�*

Training_loss���A�c �$       B+�M	������A�*

Training_loss^c�Ab��}$       B+�M	�������A�*

Training_loss���A�I�$       B+�M	^MZ����A�*

Training_loss���A�L�h$       B+�M	_η����A�*

Training_loss��(BD,m�$       B+�M	�����A�*

Training_lossW(hA�0�`$       B+�M	~�r����A�*

Training_loss���A� J7$       B+�M	#������A�*

Training_loss�B�|C�$       B+�M	I�,����A�*

Training_loss�;�A48x$       B+�M	�ǉ����A�*

Training_loss��%Bz���$       B+�M	�������A�*

Training_loss�LB�>��$       B+�M	��B����A�*

Training_loss"�A�7�$       B+�M	�+�����A�*

Training_loss�7�A�IM�$       B+�M	m������A�*

Training_loss��A���$       B+�M	W�"����A�*

Training_loss��A�^$       B+�M	)�����A�*

Training_loss莫AK�e$       B+�M	h������A�*

Training_loss�(�A0�:G$       B+�M	R�;����A�*

Training_lossFe�A�_�$       B+�M	������A�*

Training_loss%�A�EZ$       B+�M	�������A�*

Training_loss�@AHx�$       B+�M	}�R����A�*

Training_lossu��A>��$       B+�M	�F�����A�*

Training_loss<@�A��$       B+�M	.�����A�*

Training_lossO��A�l�\$       B+�M	i�j����A�*

Training_loss�f�Am-C�$       B+�M	�������A�*

Training_loss�dBÕ�s*       ����	[O����A�*

Validation_accuracy�Nn?��-&       sO� 	�]O����A�*

Validation_loss؀B�q��$       B+�M	WAl����A�*

Training_loss���AV�+$       B+�M	y������A�*

Training_loss(�B��tY$       B+�M	��&����A�*

Training_loss6��AQS/�$       B+�M	������A�*

Training_loss8��A��ڶ$       B+�M	�Z�����A�*

Training_loss�8A�,r$       B+�M	M<����A�*

Training_loss �NA��^%$       B+�M	�j�����A�*

Training_lossAљ�$       B+�M	�������A�*

Training_lossx�A82��$       B+�M	RaU����A�*

Training_loss�$B�C�$       B+�M	i������A�*

Training_loss��QAFa��$       B+�M	�����A�*

Training_lossjf�A�jTJ$       B+�M	Y�m����A�*

Training_loss�\�A�$�$       B+�M	A�����A�*

Training_loss�W�A��$       B+�M	-�'����A�*

Training_loss�۾A�Pq�$       B+�M	)_�����A�*

Training_loss?#Bd~�$       B+�M	�Z�����A�*

Training_lossN	uA���$$       B+�M	h!?����A�*

Training_loss�g�A9s�y$       B+�M	�Ü����A�*

Training_loss�UBAZ$       B+�M	rS�����A�*

Training_loss*VB���$       B+�M	�V����A�*

Training_loss�3BSG$       B+�M	�������A�*

Training_loss�iA:ͤ�$       B+�M	������A�*

Training_loss��A�L^�$       B+�M	gn����A�*

Training_lossH2�A�tS$       B+�M	�q�����A�*

Training_loss�m@C��h$       B+�M	�������A�*

Training_lossH=�A7m-$       B+�M	?�K����A�*

Training_loss�DA�W�Y$       B+�M	������A�*

Training_loss�H.B;9��$       B+�M	������A�*

Training_loss ��AL�s�$       B+�M	��b����A�*

Training_loss�X�A�N�$       B+�M	�����A�*

Training_lossLOB���$       B+�M	�g����A�*

Training_lossQ��A��ʐ$       B+�M	�y����A�*

Training_lossy��Ak�$       B+�M	������A�*

Training_loss�˲A�3�$       B+�M	ٓ4����A�*

Training_losspn�Añ.�*       ����	K������A�*

Validation_accuracy��m?P�LH&       sO� 	�������A�*

Validation_loss�(B����$       B+�M	�)�����A�*

Training_loss��A�H�$       B+�M	�6����A�*

Training_loss�cA��W$       B+�M	\������A�*

Training_loss@7�A�v��$       B+�M	Ū�����A�*

Training_loss�A�n:I$       B+�M	1�M����A�*

Training_loss���A���$       B+�M	=�����A�*

Training_lossP�A�S�v$       B+�M	������A�*

Training_loss��A☈$       B+�M	ce����A�*

Training_lossA�B�U&�$       B+�M	������A�*

Training_lossR+�Af�$       B+�M	{1����A�*

Training_loss��A�9�$       B+�M	�|����A�*

Training_loss��B�q�$       B+�M	�E�����A�*

Training_lossh��A�ɶ�$       B+�M	�'6����A�*

Training_loss���A���$       B+�M	�֓����A�*

Training_loss�z�A��$       B+�M	Q������A�*

Training_loss��3A�;�R$       B+�M	�(N����A�*

Training_loss��oA����$       B+�M	Y�����A�*

Training_loss���AGK��$       B+�M	A�����A�*

Training_loss�A��$�$       B+�M	�fd����A�*

Training_loss�l�Aeâ#$       B+�M	������A�*

Training_lossBC�A�B�l$       B+�M	f�����A�*

Training_loss��B���$       B+�M	�d{����A�*

Training_loss�9�AF�M$       B+�M	�?�����A�*

Training_loss	��Af3�$       B+�M	ڏ5����A�*

Training_lossk�Aw��b$       B+�M	�`Y����A�*

Training_loss��A�,��$       B+�M	 ������A�*

Training_loss=��A���$       B+�M	������A�*

Training_loss�v	Bx:��$       B+�M	l�q����A�*

Training_lossX��Aa2�$       B+�M	D������A�*

Training_loss��A;~z�$       B+�M	�+����A�*

Training_loss�O�ATUt�$       B+�M	-Ј����A�*

Training_loss�+B���n$       B+�M	�������A�*

Training_lossl��A��Z�$       B+�M	�lB����A�*

Training_lossC^AFR�$       B+�M	]�����A�*

Training_lossh�2Au���*       ����	��'����A�*

Validation_accuracy�Nn?Z�5&       sO� 	��'����A�*

Validation_loss.WB��$       B+�M	�Z����A�*

Training_loss�x�A�ߞ�$       B+�M	#׷����A�*

Training_loss욾AB5"~$       B+�M	Z�����A�*

Training_lossg�!B����$       B+�M	��r����A�*

Training_lossh�8A��$       B+�M	Ra�����A�*

Training_loss�ӫA(���$       B+�M	^I,����A�*

Training_loss�v�AH(�$       B+�M	������A�*

Training_loss`"�A�U~A$       B+�M	q������A�*

Training_lossğA��"y$       B+�M	�B����A�*

Training_lossoo�A�_&$       B+�M	ݟ����A�*

Training_loss2�A���$       B+�M	v�����A�*

Training_loss���AYT�K$       B+�M	ޒY����A�*

Training_loss��Aar�$       B+�M	������A�*

Training_lossXf(AE*FF$       B+�M	s�����A�*

Training_lossT�{Ac��#$       B+�M	|�p����A�*

Training_loss$`�A�߫�$       B+�M	d������A�*

Training_losslX�A��7Z$       B+�M	4d+����A�*

Training_lossk8B��$       B+�M	������A�*

Training_loss��LANA�$       B+�M	J&�����A�*

Training_loss3 �A���$       B+�M	/oB����A�*

Training_loss�/BnV��$       B+�M	�O�����A�*

Training_lossE��A�H$       B+�M	\�����A�*

Training_loss�T�A��F$       B+�M	��Y����A�*

Training_lossf�AA��K$       B+�M	�O�����A�*

Training_loss�c�AFl�-$       B+�M	�����A�*

Training_loss
�OA��*�$       B+�M	4�8����A�*

Training_loss��Ar^�$       B+�M	x�����A�*

Training_loss�"7B��$       B+�M	!x�����A�*

Training_lossF.^Ab[m�$       B+�M	�)O ���A�*

Training_loss���AM��$       B+�M	� ���A�*

Training_loss�P�Av��[$       B+�M	�D	���A�*

Training_loss���A�N8$       B+�M	wKf���A�*

Training_loss�T�A֤S�$       B+�M	�S����A�*

Training_loss�_�Ah�F�$       B+�M	� ���A�*

Training_loss��AA��O*       ����	�+����A�*

Validation_accuracy�Nn?o���&       sO� 	4.����A�*

Validation_loss�=Bn��$       B+�M	������A�*

Training_loss��A5�%�$       B+�M	��A���A�*

Training_lossp�DA��$       B+�M	�ʞ���A�*

Training_lossj^NA�ŵ�$       B+�M	�����A�*

Training_loss4�JB�9�&$       B+�M	�hY���A�*

Training_lossd��Az��$       B+�M	�{����A�*

Training_loss(�A@7a�$       B+�M	f���A�*

Training_loss��A���$       B+�M	O=o���A�*

Training_losso�AD��$       B+�M	����A�*

Training_loss��B�I?$       B+�M	�))���A�*

Training_loss"I�AR��t$       B+�M	>����A�*

Training_loss8,�Ai��=$       B+�M	4�����A�*

Training_loss+�A�T��$       B+�M	�@	���A�*

Training_losse֯A�)\#$       B+�M	�	���A�*

Training_loss*-�A��<�$       B+�M	7O�	���A�*

Training_loss���A��F�$       B+�M	�WW
���A�*

Training_loss��^A�ya)$       B+�M	;��
���A�*

Training_loss;vBH�\�$       B+�M	g����A�*

Training_loss���A���Q$       B+�M	�n���A�*

Training_loss"T�@mL2x$       B+�M	`u����A�*

Training_loss��nA��if$       B+�M	/�'���A�*

Training_loss�=�A<�9�$       B+�M	"p����A�*

Training_loss�`�A����$       B+�M	�����A�*

Training_loss���@���5$       B+�M	2�@���A�*

Training_lossn~�@,�c&$       B+�M	�����A�*

Training_loss��A|���$       B+�M	������A�*

Training_loss�*A�jQ$       B+�M	n����A�*

Training_loss��@}���$       B+�M	�3{���A�*

Training_loss��A�]V�$       B+�M	������A�*

Training_loss�ɓA���$       B+�M	�8���A�*

Training_lossLLA̸$       B+�M	1����A�*

Training_lossU� B��4i$       B+�M	������A�*

Training_loss���A�."C$       B+�M	��N���A�*

Training_lossuB~W+$       B+�M	x����A�*

Training_loss���A��,*       ����	�82���A�*

Validation_accuracy��m?F��&       sO� 	?;2���A�*

Validation_lossp�BZ��,$       B+�M	ɛ���A�*

Training_loss<��AT�i]$       B+�M	�����A�*

Training_loss�zYA�;5�$       B+�M	^�V���A�*

Training_loss�*B�r�e$       B+�M	�_����A�*

Training_loss��Ar�U$       B+�M	�>���A�*

Training_loss��Ar,�$       B+�M	�1o���A�*

Training_loss[�A�-�$       B+�M	�f����A�*

Training_loss��rAɁ3"$       B+�M	�A*���A�*

Training_loss��\A"A�,$       B+�M	\����A�*

Training_loss���A"��$       B+�M	������A�*

Training_loss��BeO�$       B+�M	 yB���A�*

Training_loss�{AE*��$       B+�M	�����A�*

Training_loss�v�A6�J�$       B+�M	�t����A�*

Training_loss&�Aқ��$       B+�M	�(Y���A�*

Training_loss1y�A��1$       B+�M	젶���A�*

Training_loss8��A�1�$       B+�M	v���A�*

Training_loss5kA�k�@$       B+�M	B�p���A�*

Training_loss��#B:I�n$       B+�M	������A�*

Training_lossd�A�/$       B+�M	e�+���A�*

Training_loss��XA��]�$       B+�M	������A�*

Training_loss~��A�z�q$       B+�M	������A�*

Training_loss��mA�~��$       B+�M	�]B���A�*

Training_losspiA��ɤ$       B+�M	�џ���A�*

Training_lossmԤA�� $       B+�M	�����A�*

Training_loss�ıA���$       B+�M	��Y���A�*

Training_loss5֗A� v�$       B+�M	������A�*

Training_loss��1Afۗ�$       B+�M	>$���A�*

Training_lossv��A��>%$       B+�M	:�8���A�*

Training_loss�@B���$       B+�M	������A�*

Training_loss+�A���$       B+�M	�=����A�*

Training_lossf��A�WA�$       B+�M	F�O���A�*

Training_loss���A�r�$       B+�M	�F����A�*

Training_loss�[�A� B$$       B+�M	�a
���A�*

Training_loss�g�A�y9G$       B+�M	Z�g���A�*

Training_loss`P�A		ì*       ����	[�����A�*

Validation_accuracy��m?CG��&       sO� 	������A�*

Validation_loss�B���;$       B+�M	."���A�*

Training_loss\��A�9n�$       B+�M	��"���A�*

Training_loss@3B]!�g$       B+�M	��"���A�*

Training_lossԾBnM|�$       B+�M	��E#���A�*

Training_loss��qA���Q$       B+�M	`ɢ#���A�*

Training_loss�BE�$       B+�M	2 $���A�*

Training_loss�SAl$ c$       B+�M	��]$���A�*

Training_loss�ߊA���$       B+�M	�ܺ$���A�*

Training_loss��A���$       B+�M	�%���A�*

Training_loss�j�@@')x$       B+�M	Zu%���A�*

Training_loss�B-��$       B+�M	�L�%���A�*

Training_loss�M�AQa�$       B+�M	? 0&���A�*

Training_loss���A�ư$       B+�M	y�&���A�*

Training_loss�q�A�ٛ$       B+�M	��&���A�*

Training_loss�.�A��&$       B+�M	�I'���A�*

Training_loss��A����$       B+�M	3�'���A�*

Training_loss���AJ��$       B+�M	K(���A�*

Training_loss�Z�A@��`$       B+�M	��`(���A�*

Training_loss�|�A����$       B+�M	ɑ�(���A�*

Training_loss���A��3�$       B+�M	��)���A�*

Training_loss>Acj��$       B+�M	f�w)���A�*

Training_loss��A*��a$       B+�M	�b�)���A�*

Training_loss���Ab�F$       B+�M	��1*���A�*

Training_losshIA^�H�$       B+�M	�q�*���A�*

Training_lossX��A�vc�$       B+�M	���*���A�*

Training_lossE�A�T�Y$       B+�M	 �H+���A�*

Training_loss��,A/�v�$       B+�M	���+���A�*

Training_lossF��A	�l:$       B+�M	; ,���A�*

Training_losskAL5$       B+�M	
�&,���A�*

Training_loss��A�_��$       B+�M	'݃,���A�*

Training_loss�0MA��$       B+�M	j2�,���A�*

Training_loss���At�͠$       B+�M	�@-���A�*

Training_loss�t�A��$       B+�M	���-���A�*

Training_loss
��A��J$       B+�M	k��-���A�*

Training_loss��A�;6$*       ����	^�.���A�*

Validation_accuracy��m?��}&       sO� 	�a�.���A�*

Validation_lossCB�\��$       B+�M	RH�0���A�*

Training_loss�L�A���$       B+�M	*�#1���A�*

Training_lossZm�A�3@$       B+�M	v��1���A�*

Training_loss��A���<$       B+�M	���1���A�*

Training_lossh��A���$       B+�M	�;2���A�*

Training_loss�bIA��O�$       B+�M	�5�2���A�*

Training_loss.ҽA�}	�$       B+�M	܁�2���A�*

Training_loss\X�Aݷ+r$       B+�M	��R3���A�*

Training_loss�2B��u�$       B+�M	7߰3���A�*

Training_lossu��A��c$       B+�M	S4���A�*

Training_lossv�!B�V$       B+�M	Ӄk4���A�*

Training_loss��Aw>��$       B+�M	>�4���A�*

Training_loss	�A �$       B+�M	��'5���A�*

Training_loss�*�A�+$       B+�M	�)�5���A�*

Training_losss�A.��:$       B+�M	a��5���A�*

Training_loss�0QA�`$       B+�M	�>6���A�*

Training_loss	��A��Fz$       B+�M	�̛6���A�*

Training_loss�-�A���$       B+�M	���6���A�*

Training_lossC.KA�&"$       B+�M	ףU7���A�*

Training_loss�%�A�7�$       B+�M	x|�7���A�*

Training_loss��A� ��$       B+�M	!�8���A�*

Training_lossKW�A�j�$       B+�M	�Dn8���A�*

Training_lossr��At3ձ$       B+�M	n��8���A�*

Training_lossE��A����$       B+�M	~)9���A�*

Training_lossG�BK���$       B+�M	Qi�9���A�*

Training_loss�8�A��$       B+�M	�D�9���A�*

Training_losssY�A��#>$       B+�M	�@:���A�*

Training_loss�A9g��$       B+�M	�O�:���A�*

Training_lossd��AqI[$       B+�M	>��:���A�*

Training_loss
"AA�AP�$       B+�M	��;���A�*

Training_loss�AUA}#y$       B+�M	v�{;���A�*

Training_loss�NBf&I�$       B+�M	�+�;���A�*

Training_loss�@A�'$       B+�M	=�5<���A�*

Training_loss�!�A����$       B+�M	�Α<���A�*

Training_lossvL�A���+*       ����	��=���A�*

Validation_accuracy��m?����&       sO� 	�=���A�*

Validation_loss�B��w�$       B+�M	A_?���A�*

Training_loss^��A�2,m$       B+�M	\v�?���A�*

Training_loss	�Aش�$       B+�M	L�@���A�*

Training_lossn�%BEP$       B+�M	+0w@���A�*

Training_lossÈ�A&i�^$       B+�M	*��@���A�*

Training_lossd^�A�P��$       B+�M	�G2A���A�*

Training_loss#̽A�hK�$       B+�M	I��A���A�*

Training_loss&B���$       B+�M	���A���A�*

Training_loss���A�yr�$       B+�M	�OJB���A�*

Training_lossN��A�X$       B+�M	�)�B���A�*

Training_loss��A��R$       B+�M	�tC���A�*

Training_loss�,BՉ�$       B+�M	F�bC���A�*

Training_loss�B�@F��V$       B+�M	ݿC���A�*

Training_loss@��AL��$       B+�M	�D���A�*

Training_loss#��AZ%�$       B+�M	��zD���A�*

Training_loss�)�A;�V$       B+�M	ܺ�D���A�*

Training_loss�-UAX��$       B+�M	w5E���A�*

Training_loss��A-ݔ1$       B+�M	(֒E���A�*

Training_lossr��AUǤ>$       B+�M	���E���A�*

Training_loss���AD^0$       B+�M	�LF���A�*

Training_loss"~�A�L�m$       B+�M	���F���A�*

Training_lossh�FAÞ,;$       B+�M	��G���A�*

Training_loss���AS�L�$       B+�M	v�cG���A�*

Training_lossǄAQ$       B+�M	��G���A�*

Training_loss#��A2X][$       B+�M	��H���A�*

Training_lossD�BV�$       B+�M	��zH���A�*

Training_lossρA�@��$       B+�M	�H�H���A�*

Training_loss���Ak��z$       B+�M	f�4I���A�*

Training_lossz�A9�X�$       B+�M	���I���A�*

Training_loss�a[A�+��$       B+�M	ȳ�I���A�*

Training_loss>�Ax�}�$       B+�M	R|J���A�*

Training_loss6AҼ�$       B+�M	~oJ���A�*

Training_loss.��A�j�$       B+�M	5_�J���A�*

Training_loss��A� ��$       B+�M	�+K���A�*

Training_loss��A�R�*       ����	���K���A�*

Validation_accuracy�Nn?���&       sO� 	���K���A�*

Validation_lossdMB�N��$       B+�M	{�N���A�*

Training_lossy�=A} �$       B+�M	��lN���A�*

Training_loss.(sA>��$       B+�M	m�N���A�*

Training_lossn�A�=Z�$       B+�M	�!'O���A�*

Training_lossz�
BUg'�$       B+�M	H�O���A�*

Training_lossm�A�q�~$       B+�M	@��O���A�*

Training_lossR'qA�e��$       B+�M	�==P���A�*

Training_loss6�A�ر$       B+�M	���P���A�*

Training_lossu�A��V^$       B+�M	A��P���A�*

Training_lossM�AP�$       B+�M	�UQ���A�*

Training_loss�jcA���$       B+�M	
�Q���A�*

Training_loss�ZBP�}�$       B+�M	��R���A�*

Training_loss �xA�1BX$       B+�M	�3nR���A�*

Training_loss��A�N��$       B+�M	��R���A�*

Training_loss�AgW��$       B+�M	'(S���A�*

Training_loss���@W)$       B+�M	 ȅS���A�*

Training_loss(�AAD�9�$       B+�M	���S���A�*

Training_loss�ߖA����$       B+�M	�l?T���A�*

Training_loss��@�|��$       B+�M	"��T���A�*

Training_loss.?�A+�!�$       B+�M	r�T���A�*

Training_lossOA���'$       B+�M	�WU���A�*

Training_loss_�A�t��$       B+�M	�^�U���A�*

Training_loss��)Aak&$       B+�M	�V���A�*

Training_lossNW�A��g�$       B+�M	CrnV���A�*

Training_loss䐌A�ڔ�$       B+�M	5�V���A�*

Training_lossBA���$       B+�M	�'W���A�*

Training_loss䣑A��-�$       B+�M	i6�W���A�*

Training_loss��A�.@$       B+�M	RH�W���A�*

Training_lossw�\Bl�x�$       B+�M	E.=X���A�*

Training_loss���A�B�$       B+�M	��X���A�*

Training_loss�B�S�$       B+�M	J&�X���A�*

Training_loss�^A��9�$       B+�M	Y���A�*

Training_loss�{R@l�$       B+�M	��xY���A�*

Training_lossE��A�7�$       B+�M	�&�Y���A�*

Training_loss�9eA���"*       ����	�[Z���A�*

Validation_accuracy�Nn?|C�&       sO� 	"�[Z���A�*

Validation_loss��B�Ek2$       B+�M	�\���A�*

Training_loss�Y�A��?�$       B+�M	[!]���A�*

Training_loss�IDAG��<$       B+�M	l]���A�*

Training_loss@3�A~[�$       B+�M	`W�]���A�*

Training_loss��A>�9S$       B+�M	�$J^���A�*

Training_loss�-�A�=C$       B+�M	�ĩ^���A�*

Training_loss�Bb���$       B+�M	�_���A�*

Training_loss.5�AN'$       B+�M	��c_���A�*

Training_lossH�B;�W�$       B+�M	���_���A�*

Training_loss���A2f~$       B+�M	7�`���A�*

Training_loss�&qA"��$       B+�M	-�|`���A�*

Training_loss���A��Qq$       B+�M	��`���A�*

Training_loss�֓A}>��$       B+�M	�7a���A�*

Training_loss�|7Aǳt�$       B+�M	]N�a���A�*

Training_loss�Ao?��$       B+�M	��a���A�*

Training_loss��B�0p%$       B+�M	�Nb���A�*

Training_lossӅ�@��5$       B+�M	ׅ�b���A�*

Training_loss��A��D"$       B+�M	�	c���A�*

Training_loss@�A��qg$       B+�M	�ec���A�*

Training_loss*7�Aϡe�$       B+�M	}�c���A�*

Training_loss K�A	$       B+�M	$�d���A�*

Training_loss�t?A���$       B+�M	<}d���A�*

Training_loss���Ak��$       B+�M	JA�d���A�*

Training_loss�?A��$       B+�M	�8e���A�*

Training_loss�B��"$       B+�M	�%�e���A�*

Training_lossdr�A��L�$       B+�M	�e���A�*

Training_loss(̞AL���$       B+�M	1�Pf���A�*

Training_loss���AT�F%$       B+�M	A,�f���A�*

Training_lossĪ�AA�{$       B+�M	�	g���A�*

Training_loss�_�A�\�$       B+�M	�dfg���A�*

Training_lossR��A)�!�$       B+�M	�y�g���A�*

Training_lossفA�ܠ2$       B+�M	�n h���A�*

Training_lossf�B�LWF$       B+�M	�SDh���A�*

Training_loss�7�@�`��$       B+�M	���h���A�*

Training_lossO��A���*       ����	��)i���A�*

Validation_accuracy�Nn?T͘�&       sO� 	X�)i���A�*

Validation_loss��B�Ǖ�$       B+�M	�W�k���A�*

Training_lossuҫA�W1�$       B+�M	��k���A�*

Training_loss=�uAS�d$       B+�M	1Tl���A�*

Training_loss���A�/��$       B+�M	{��l���A�*

Training_lossทA���`$       B+�M	��m���A�*

Training_loss���Aî��$       B+�M	�jm���A�*

Training_lossFu�A�Eu�$       B+�M	8M�m���A�*

Training_lossk��Au�[@$       B+�M	��#n���A�*

Training_loss�jB?��@$       B+�M	LU�n���A�*

Training_loss|��A�O^�$       B+�M	q�n���A�*

Training_loss��|A{��$       B+�M	�;o���A�*

Training_loss��B��XI$       B+�M	�p�o���A�*

Training_loss�Y8Afa-$       B+�M	~�o���A�*

Training_loss��}A N"�$       B+�M	(�Qp���A�*

Training_loss��A�x9$       B+�M	:�p���A�*

Training_lossS�A�9��$       B+�M	��q���A�*

Training_losscu�@A�q$       B+�M	v�iq���A�*

Training_loss`�A��7v$       B+�M	7��q���A�*

Training_loss'��A���h$       B+�M	jh$r���A�*

Training_loss֜�A��KH$       B+�M	AD�r���A�*

Training_loss���A���=$       B+�M	�d�r���A�*

Training_loss'0�A��Q$       B+�M	Z�;s���A�*

Training_loss9gA+Pt�$       B+�M	=E�s���A�*

Training_loss���A�6k�$       B+�M	�L�s���A�*

Training_loss�FRA��$       B+�M	܄Rt���A�*

Training_loss�2�A�,C$       B+�M	��t���A�*

Training_loss�M�AǑ�?$       B+�M	��u���A�*

Training_loss3�A�z��$       B+�M	[�iu���A�*

Training_loss��A��$       B+�M	���u���A�*

Training_loss.��AF��P$       B+�M	{j$v���A�*

Training_loss�Z�A��[$       B+�M	+k�v���A�*

Training_loss2��A�Y!$       B+�M	Ec�v���A�*

Training_loss��wAU��$       B+�M	i;;w���A�*

Training_loss�
B"Z�$       B+�M	�F_w���A�*

Training_losso��@��J*       ����	L��w���A�*

Validation_accuracy��m?��pa&       sO� 	*��w���A�*

Validation_losseB>#Z$       B+�M	��Gz���A�*

Training_lossl�AεT�$       B+�M	5�z���A�*

Training_loss�%�A�<�$       B+�M	J{���A�*

Training_loss=_A�9�I$       B+�M	�1_{���A�*

Training_loss�O�A(�eb$       B+�M	���{���A�*

Training_loss�o�AF�R�$       B+�M	n�|���A�*

Training_lossT��A��93$       B+�M	h w|���A�*

Training_loss�BP�6$       B+�M	c'�|���A�*

Training_loss
<B�A�E$       B+�M	l�1}���A�*

Training_loss-_�AC�T$       B+�M	a��}���A�*

Training_lossă�A �M�$       B+�M	G��}���A�*

Training_lossEӁA���l$       B+�M	7I~���A�*

Training_lossI@�A��$       B+�M	�}�~���A�*

Training_loss�=�ARٍ�$       B+�M	\���A�*

Training_lossD2�A�-�"$       B+�M	uW`���A�*

Training_loss���A�%�$       B+�M	�B����A�*

Training_lossȚ�A@"$       B+�M	<h����A�*

Training_loss⥷A���$       B+�M	�	x����A�*

Training_loss���AС$       B+�M	��Ԁ���A�*

Training_loss���@+��$       B+�M	��1����A�*

Training_loss��NA�\?�$       B+�M	5������A�*

Training_loss2:A�=�@$       B+�M	I�����A�*

Training_lossj�AO=�Z$       B+�M	}	I����A�*

Training_loss���A]מ$       B+�M	P�����A�*

Training_loss���A��\�$       B+�M	�����A�*

Training_lossJ�bA�RG�$       B+�M	��`����A�*

Training_lossc�lA�T�H$       B+�M	�/�����A�*

Training_loss���Av`9�$       B+�M	l�����A�*

Training_lossڈ;AŦ��$       B+�M	\�w����A�*

Training_loss���A�O<�$       B+�M	�Ԅ���A�*

Training_loss��B ��$       B+�M	d�0����A�*

Training_loss3�B!ֵp$       B+�M	�����A�*

Training_loss��A���d$       B+�M	�T����A�*

Training_loss�b�@q/q$       B+�M	]�F����A�*

Training_loss��Ab���*       ����	��Ά���A�*

Validation_accuracy�Nn?%�|�&       sO� 	��Ά���A�*

Validation_lossF�BY��0$       B+�M	�o����A�*

Training_loss��A�˔�$       B+�M	h�l����A�*

Training_loss�m4As�C�$       B+�M	Tʉ���A�*

Training_lossy�IA#��$       B+�M	�m&����A�*

Training_loss�o�A�]�$       B+�M	'f�����A�*

Training_loss7��A�"N&$       B+�M	Gr�����A�*

Training_loss�a[A[��4$       B+�M	�>����A�*

Training_lossks�A�~$       B+�M	
1�����A�*

Training_loss�?�A��	4$       B+�M	8�����A�*

Training_loss�'A5�;b$       B+�M	��T����A�*

Training_loss5u�A��-$       B+�M	�������A�*

Training_loss��AX�^&$       B+�M	�r����A�*

Training_loss���A"=�$       B+�M	^m����A�*

Training_loss�SKAh��b$       B+�M	ݗɍ���A�*

Training_loss���A���$       B+�M	�&����A�*

Training_lossc�A�=:`$       B+�M	�9�����A�*

Training_loss���A����$       B+�M	w�����A�*

Training_loss_ȗAK;]�$       B+�M	�p=����A�*

Training_loss�v�A��m�$       B+�M	܃�����A�*

Training_loss\*�A�Ym$       B+�M	�������A�*

Training_loss�r�A�r��$       B+�M	/�S����A�*

Training_loss<�A�Cs$       B+�M	*7�����A�*

Training_lossl�%AE��M$       B+�M	*�����A�*

Training_lossoڂAe_l�$       B+�M	oj����A�*

Training_loss���A�ĎJ$       B+�M	�Ǒ���A�*

Training_loss��Aˑc$       B+�M	h�$����A�*

Training_loss>a�A����$       B+�M	WЀ����A�*

Training_loss��A���	$       B+�M	:ݒ���A�*

Training_lossZ�A��Z$       B+�M	ۊ;����A�*

Training_loss,�Ai���$       B+�M	3N�����A�*

Training_loss*ϤA.��\$       B+�M	6�����A�*

Training_loss�|�A?>�$       B+�M	��R����A�*

Training_loss�r�AK
��$       B+�M	6!�����A�*

Training_loss�ƉA�a�$       B+�M	@L����A�*

Training_loss�"BP�#�*       ����	�4�����A�*

Validation_accuracy�Nn?�HI;&       sO� 	78�����A�*

Validation_lossz�B'���$       B+�M	*�����A�*

Training_loss�YA�l6�$       B+�M	�e9����A�*

Training_loss�cAIkY9$       B+�M	�F�����A�*

Training_loss���A�ށ$       B+�M	������A�*

Training_lossxl�@,�r$       B+�M	MP����A�*

Training_loss�E�A���$       B+�M	�Ϭ����A�*

Training_lossV9>A<s�$       B+�M	��	����A�*

Training_loss麰A�7U$       B+�M	e�f����A�*

Training_lossc�ATg��$       B+�M	�{Ě���A�*

Training_loss��A �Ja$       B+�M	�}!����A�*

Training_loss��A['�$       B+�M	"�}����A�*

Training_lossp°AtU�$       B+�M	y[ڛ���A�*

Training_loss
�jA�6$       B+�M	��6����A�*

Training_loss�{�AQ3 M$       B+�M	8k�����A�*

Training_loss��A�K��$       B+�M	�[����A�*

Training_lossmc}A:�$       B+�M	G�N����A�*

Training_lossƌmAIӏ$       B+�M	�ū����A�*

Training_loss͋�A�@w$       B+�M	������A�*

Training_loss+�Ad]]�$       B+�M	h�e����A�*

Training_lossXfA�y*l$       B+�M	؝Þ���A�*

Training_loss���A��rL$       B+�M	5� ����A�*

Training_loss�D�A���G$       B+�M	�~����A�*

Training_loss�u\Al�S�$       B+�M	5�ڟ���A�*

Training_lossH�YA�iV�$       B+�M	>�7����A�*

Training_loss��uA�p!2$       B+�M	a������A�*

Training_lossa�Au�z�$       B+�M	������A�*

Training_loss���A��5$       B+�M	LO����A�*

Training_lossӼ�Am���$       B+�M	쫡���A�*

Training_losss^A��[3$       B+�M	@	����A�*

Training_loss�IA��$       B+�M	w0g����A�*

Training_loss@��A�*;$       B+�M	�Ţ���A�*

Training_lossR�A�H;g$       B+�M	^�"����A�*

Training_loss� ,Atk2@$       B+�M	�Y����A�*

Training_lossX(?A.O�$       B+�M	o�ۣ���A�*

Training_lossm�xA�E*       ����	�%b����A�*

Validation_accuracy�Nn?{��&       sO� 	�(b����A�*

Validation_loss�B���@$       B+�M	��٦���A�*

Training_loss0d�A�B@�$       B+�M	��6����A�*

Training_loss�mnA�\�$       B+�M	˽Z����A�*

Training_loss� f@��ޭ$       B+�M	-�����A�*

Training_loss��iA�E\	$       B+�M	x`����A�*

Training_loss�A�A�T$       B+�M	q����A�*

Training_lossіTA�x�$       B+�M	
iѨ���A�*

Training_loss>��AKj��$       B+�M	o�2����A�*

Training_lossF?	Ahׂ$       B+�M	b�����A�*

Training_loss��A����$       B+�M	U�����A�*

Training_loss�u�A#���$       B+�M	[�H����A�*

Training_loss�)�A���$       B+�M	�ۦ����A�*

Training_lossye�AY�W$       B+�M	�X����A�*

Training_loss�ayAjU�h$       B+�M	�?`����A�*

Training_loss/U�A�k�@$       B+�M	*q�����A�*

Training_lossS�A.p}*$       B+�M	b�����A�*

Training_loss��GAr�F�$       B+�M	+�y����A�*

Training_lossN��A��|\$       B+�M	��׬���A�*

Training_loss[�jA�!cG$       B+�M	��5����A�*

Training_loss��A?�Y�$       B+�M	���A�*

Training_lossT=VA���$       B+�M	�����A�*

Training_loss��A����$       B+�M	@M����A�*

Training_lossϏWA+ߖ�$       B+�M		������A�*

Training_loss\WAS([U$       B+�M	������A�*

Training_loss\�A����$       B+�M	p�d����A�*

Training_loss�J�Aӏ��$       B+�M	^������A�*

Training_loss�A�s*&$       B+�M	�l ����A�*

Training_loss���A�o�
$       B+�M	�}����A�*

Training_lossF�A�s9$       B+�M	۰���A�*

Training_lossˮ�AX���$       B+�M	�7����A�*

Training_loss ϦA���:$       B+�M	؜�����A�*

Training_loss'T�AO�a�$       B+�M	|&����A�*

Training_loss4U�A/�O9$       B+�M	��O����A�*

Training_lossv�B�Z�$       B+�M	�������A�*

Training_lossi��A	��i*       ����	�4����A�*

Validation_accuracy�Nn?t]!&       sO� 	04����A�*

Validation_loss��B2��$       B+�M	�Cµ���A�*

Training_loss���A�Y�$       B+�M	i����A�*

Training_loss8`�A���Y$       B+�M	
|����A�*

Training_loss4�A#�E�$       B+�M	mr�����A�*

Training_lossN�@�a��$       B+�M	3�����A�*

Training_loss�5A�f$       B+�M	��Y����A�*

Training_loss���A?u\j$       B+�M	<�����A�*

Training_lossB�QA��O$       B+�M	�����A�*

Training_loss�@�A�Ah�$       B+�M	�p����A�*

Training_loss�x�AAA1$       B+�M	��̸���A�*

Training_loss '�A���$       B+�M	W{)����A�*

Training_lossr*�A�e�s$       B+�M	YM�����A�*

Training_loss��Ba��u$       B+�M	u�����A�*

Training_loss�o�AgF�$       B+�M	r4?����A�*

Training_lossu*�A~�$       B+�M	ӡ�����A�*

Training_loss��XA�-#�$       B+�M	y[�����A�*

Training_losssG�AR;�O$       B+�M	c�U����A�*

Training_loss(�_A���$       B+�M	Cs�����A�*

Training_lossld�A1^v�$       B+�M	 ~����A�*

Training_loss�AVʷ$       B+�M	Ql����A�*

Training_loss �A�&�$       B+�M	�]ɼ���A�*

Training_lossG�dA�v$       B+�M	__&����A�*

Training_lossQ��AĂ�5$       B+�M	�݂����A�*

Training_loss�w�A�F�X$       B+�M	;�����A�*

Training_loss�2B�i�x$       B+�M	%w>����A�*

Training_loss��NA.�/$       B+�M	7l�����A�*

Training_loss"��A�.��$       B+�M	������A�*

Training_lossܵtA BcM$       B+�M	A�U����A�*

Training_loss���AЃ�X$       B+�M	�~�����A�*

Training_loss\�A����$       B+�M	V�����A�*

Training_lossBªA;,U
$       B+�M	�Xl����A�*

Training_lossvj�A��2�$       B+�M	{�����A�*

Training_loss~��A8���$       B+�M	s&����A�*

Training_loss�ȰA�h&�$       B+�M	WЃ����A�*

Training_loss�S�A�C\�*       ����	�T
����A�*

Validation_accuracy�Nn?�w5~&       sO� 	�V
����A�*

Validation_loss<�Bس��$       B+�M	V,�����A�*

Training_losspD�A�)$       B+�M	U����A�*

Training_loss��AD%h�$       B+�M	��]����A�*

Training_loss8�OA�	�$       B+�M	z�����A�*

Training_loss��AҐZ$       B+�M	�&�����A�*

Training_lossl`HA�,��$       B+�M	�f:����A�*

Training_loss�y�A2V�`$       B+�M	'������A�*

Training_loss�a�A�4w$       B+�M	������A�*

Training_lossޤ0A��w�$       B+�M	jR����A�*

Training_lossWu�A�I��$       B+�M	�������A�*

Training_lossՙ�A�^�$$       B+�M	�6����A�*

Training_lossㄖA��H�$       B+�M	��i����A�*

Training_loss�j�A���
$       B+�M	�d�����A�*

Training_lossL/�A��F$       B+�M	�#%����A�*

Training_loss���A%qJ�$       B+�M	毂����A�*

Training_loss�ҸA�_$       B+�M	�������A�*

Training_lossxS�A�'^!$       B+�M	�)=����A�*

Training_loss���AO��$       B+�M	ӄ�����A�*

Training_loss���A�b�Q$       B+�M	�n�����A�*

Training_lossd�A(�$       B+�M	 AW����A�*

Training_loss�{AӢ{w$       B+�M	�ʵ����A�*

Training_loss�soA�G�$       B+�M	�����A�*

Training_loss"��@�gn�$       B+�M	9�p����A�*

Training_lossRi�A>x�$       B+�M	�������A�*

Training_loss���@��0$       B+�M	��,����A�*

Training_lossï;AN��$       B+�M	������A�*

Training_loss�/�A0��$       B+�M	�/�����A�*

Training_lossXщAn�z�$       B+�M	�jF����A�*

Training_loss�t�AYB�L$       B+�M	L�����A�*

Training_loss�H�A�r'^$       B+�M	|+����A�*

Training_loss��AA�]�$       B+�M	6\b����A�*

Training_loss�FA�t�$       B+�M	ys�����A�*

Training_loss���AX#��$       B+�M	�F����A�*

Training_loss(g�A�"%A$       B+�M	6v�����A�*

Training_loss�\B:�=*       ����	����A�*

Validation_accuracy�Nn?�<p�&       sO� 	�"����A�*

Validation_loss�_B���$       B+�M	�U����A�*

Training_loss���A��$       B+�M	xq����A�*

Training_losso�A�#�$       B+�M	�������A�*

Training_loss���A96�$       B+�M	mq,����A�*

Training_loss���AO8�$       B+�M	wL�����A�*

Training_loss��qA^�A�$       B+�M	������A�*

Training_lossv�A�RG�$       B+�M	��
����A�*

Training_losss,�Ag+��$       B+�M	mug����A�*

Training_loss�@ A��&$       B+�M	������A�*

Training_loss6A�AeP��$       B+�M	("����A�*

Training_loss��A��d$       B+�M	Me����A�*

Training_loss,�hA�$       B+�M	�������A�*

Training_lossR��@,�$       B+�M	[
:����A�*

Training_loss�1A���$       B+�M	k�����A�*

Training_loss|lMA̵<i$       B+�M	 ������A�*

Training_loss�8'A*��z$       B+�M	�Q����A�*

Training_loss�z�A��4D$       B+�M	Z������A�*

Training_loss�Z3A$S�$       B+�M	�����A�*

Training_loss�dA]@)�$       B+�M	^�h����A�*

Training_loss���@����$       B+�M	�X�����A�*

Training_lossj�"A�Z�$       B+�M	��#����A�*

Training_loss�<�@x���$       B+�M	0,�����A�*

Training_loss�ԂA��$       B+�M	������A�*

Training_loss��AҔ�$       B+�M	ܜ;����A�*

Training_loss�AA�!>�$       B+�M	�З����A�*

Training_lossEŧA'�R@$       B+�M	�������A�*

Training_loss�~LA|xP$       B+�M	�$R����A�*

Training_loss�qMA��,$       B+�M	\�����A�*

Training_loss�XlA4�1$       B+�M	������A�*

Training_loss$�BT��T$       B+�M	�<j����A�*

Training_loss���A��$       B+�M	�������A�*

Training_loss�y~A��a$       B+�M	v�$����A�*

Training_loss@&A0�Q�$       B+�M	8e�����A�*

Training_loss<~YA�M�$       B+�M	yw�����A�*

Training_lossx�?A�~*       ����	�e����A�*

Validation_accuracy�Nn?���]&       sO� 	��e����A�*

Validation_loss�B���$       B+�M	)������A�*

Training_loss�ìAz�C�$       B+�M	�P����A�*

Training_loss*�2As��M$       B+�M	_�����A�*

Training_loss�%�Ag\v,$       B+�M	�!����A�*

Training_loss�^A�S�I$       B+�M	jj����A�*

Training_loss��AѹK�$       B+�M	������A�*

Training_loss���A�׈e$       B+�M	.������A�*

Training_loss91�@
?�$       B+�M	��H����A�*

Training_losss�tAlѯ�$       B+�M	Ǹ�����A�*

Training_loss}�A#,
Z$       B+�M	�g����A�*

Training_lossA�A��3�$       B+�M	�`����A�*

Training_loss��A�Z�$       B+�M	�_�����A�*

Training_loss۽AEǬ}$       B+�M	�C����A�*

Training_loss�v�A��b$       B+�M	��y����A�*

Training_loss��6A����$       B+�M	4�����A�*

Training_loss�ՀAS](�$       B+�M	��4����A�*

Training_loss[�jA�P9$       B+�M	s������A�*

Training_loss���A��H$       B+�M	G������A�*

Training_loss]#A�7�$       B+�M	��J����A�*

Training_loss�ʍA��f$       B+�M	e�����A�*

Training_loss��A�_��$       B+�M	)$����A�*

Training_loss�S�A�2��$       B+�M	'a����A�*

Training_loss-��A��$       B+�M	_������A�*

Training_loss&��A��D*$       B+�M	k����A�*

Training_loss�f�A�ä$       B+�M	$�x����A�*

Training_loss�A](a�$       B+�M	u������A�*

Training_loss@�A<�R$       B+�M	+�2����A�*

Training_lossH�SA�u�$       B+�M	�Z�����A�*

Training_loss��{A�;�$       B+�M	�-�����A�*

Training_loss^!�A�!`$       B+�M	@�H����A�*

Training_loss��A���$       B+�M	J������A�*

Training_lossBP�A4��$       B+�M	�~����A�*

Training_loss��PA���$       B+�M	_����A�*

Training_loss0�]A	�m�$       B+�M	�z�����A�*

Training_loss|8?A1�ǖ*       ����	��B����A�*

Validation_accuracy;1n?Ԅ�}&       sO� 	��B����A�*

Validation_lossNpB�+��$       B+�M	W������A�*

Training_loss�AF֝$       B+�M	��C����A�*

Training_loss���A��(�$       B+�M	TS�����A�*

Training_loss��A����$       B+�M	{����A�*

Training_loss6��AU9O$       B+�M	�to����A�*

Training_loss�4$A��9a$       B+�M	35�����A�*

Training_loss�#>AY�$       B+�M	��1����A�*

Training_loss��	A���$       B+�M	FU����A�*

Training_loss		AB,J$       B+�M	�B�����A�*

Training_loss���A�*nk$       B+�M	^�����A�*

Training_loss�pQ@��!$       B+�M	l����A�*

Training_loss��PA*��$       B+�M	{������A�*

Training_lossӾ�AƉ��$       B+�M	�%����A�*

Training_loss�@dAߞm�$       B+�M	�]�����A�*

Training_lossxjAI�b$       B+�M	������A�*

Training_loss� YA���4$       B+�M	��<����A�*

Training_loss���A�~�$       B+�M	>"�����A�*

Training_loss�)Arf��$       B+�M	f2�����A�*

Training_loss�/A7��$       B+�M	�wS����A�*

Training_lossz�WA��	$       B+�M	�?�����A�*

Training_loss<�\Aܒ�[$       B+�M	�����A�*

Training_loss�_-A��q$       B+�M	�sj����A�*

Training_lossu��A_�0$       B+�M	������A�*

Training_loss���@�80$       B+�M	8�$����A�*

Training_loss c�AB���$       B+�M	�����A�*

Training_loss���@<?a�$       B+�M	~q�����A�*

Training_loss*4�A��,�$       B+�M	��;����A�*

Training_lossRc�Aд?$       B+�M	������A�*

Training_loss"��@���$       B+�M	-!�����A�*

Training_loss�A.��$       B+�M	u>T����A�*

Training_loss*�A� $       B+�M	6�����A�*

Training_loss[	FAd�O$       B+�M	r7����A�*

Training_loss��A���.$       B+�M	�oj����A�*

Training_loss&�A�#$       B+�M	r������A�*

Training_loss���A+�{�*       ����	j�O ���A�*

Validation_accuracy�Nn?� '&       sO� 	�O ���A�*

Validation_loss�B���$       B+�M	6�����A�*

Training_loss<<9APn <$       B+�M	(�W���A�*

Training_loss�IA&�ܜ$       B+�M	������A�*

Training_loss�B!��$       B+�M	?���A�*

Training_loss��+A,瓡$       B+�M	�Jo���A�*

Training_lossHU�A�E�$       B+�M	�����A�*

Training_loss�A�j�$       B+�M	w*���A�*

Training_loss^�RAѸ�$       B+�M	XX����A�*

Training_loss衃@��,$       B+�M	}˪���A�*

Training_loss�9�A�b��$       B+�M	r����A�*

Training_loss19RA
�$       B+�M	:d���A�*

Training_loss�B��Z$       B+�M	I�����A�*

Training_loss���A7�$       B+�M	����A�*

Training_lossδHA-�Ů$       B+�M	�8{���A�*

Training_loss�!_A?z$       B+�M	�y����A�*

Training_losse�A�]c�$       B+�M	ɓ7���A�*

Training_loss���@�P!$       B+�M	먔���A�*

Training_loss�<�A�ޔ $       B+�M	������A�*

Training_loss��-A��t0$       B+�M	�M	���A�*

Training_loss\�BAܳ��$       B+�M	g�	���A�*

Training_loss�(�@�^�)$       B+�M	{�
���A�*

Training_loss}��A��Ai$       B+�M	�?c
���A�*

Training_losss��AD���$       B+�M	K��
���A�*

Training_loss���A<A��$       B+�M	T6���A�*

Training_lossreA4��$       B+�M	#}���A�*

Training_loss�),A���$       B+�M	������A�*

Training_lossl��Ah-a$       B+�M	w�5���A�*

Training_loss&��@��&�$       B+�M	tE����A�*

Training_loss�EAO6$       B+�M	�����A�*

Training_loss�Bq���$       B+�M	UjM���A�*

Training_lossp�@�6��$       B+�M	�����A�*

Training_loss�t�AK�� $       B+�M	>���A�*

Training_lossƌ�A>^$�$       B+�M	?Xd���A�*

Training_lossB��A<jF$       B+�M	�����A�*

Training_loss���Aƃ��*       ����	��G���A�*

Validation_accuracy;�m?�m�u&       sO� 	�G���A�*

Validation_loss&cB~1=�$       B+�M	�w����A�*

Training_lossc	DA<8]Y$       B+�M		mY���A�*

Training_loss�B�2�$       B+�M	�j����A�*

Training_loss�s�A��-�$       B+�M	C���A�*

Training_loss�[jA����$       B+�M	��p���A�*

Training_loss�I�ABk=�$       B+�M	(-����A�*

Training_lossy_A �P$       B+�M	��*���A�*

Training_lossH��Au��$       B+�M	gc����A�*

Training_loss!%�A��r�$       B+�M	�E����A�*

Training_loss
<AHm�$       B+�M	#����A�*

Training_losss~@۠�$       B+�M	s0e���A�*

Training_loss�|�@��g�$       B+�M	������A�*

Training_loss!��A��,$       B+�M	�R���A�*

Training_losszu�A�!�$       B+�M	��}���A�*

Training_loss�hA���R$       B+�M	������A�*

Training_loss�FA�0�y$       B+�M	�8���A�*

Training_lossN�A��z�$       B+�M	�,����A�*

Training_loss,�MA�n[$       B+�M	2<����A�*

Training_lossHĹAO�F$       B+�M	?�M���A�*

Training_loss$XA`^�|$       B+�M	!����A�*

Training_loss�}Ay�i�$       B+�M	v����A�*

Training_loss�XAPoe$       B+�M	�Fc���A�*

Training_loss��[ArK=1$       B+�M	�k����A�*

Training_loss0kA-��$       B+�M	����A�*

Training_lossz,LAH�w $       B+�M	ZEz���A�*

Training_loss��Ar�$       B+�M	�b����A�*

Training_loss3��A٫�$       B+�M	��3���A�*

Training_lossR@*ABt��$       B+�M	�����A�*

Training_lossZw�@j��$       B+�M	�R����A�*

Training_loss?��Aos$       B+�M	L3J���A�*

Training_lossv�bA�6�1$       B+�M	G����A�*

Training_loss"��A�G8�$       B+�M	�����A�*

Training_lossy��An$       B+�M	0_���A�*

Training_loss��Ar�i�$       B+�M	.����A�*

Training_loss���@t��*       ����	dM���A�*

Validation_accuracy;1n?M���&       sO� 	� M���A�*

Validation_lossX(BCv�$       B+�M	h>!���A�*

Training_loss|B�A���$       B+�M	�V{!���A�*

Training_loss�CA�,�$       B+�M	�-�!���A�*

Training_loss��A���B$       B+�M	}u7"���A�*

Training_loss�l�A� $       B+�M	���"���A�*

Training_lossL��A��z�$       B+�M	��"���A�*

Training_loss�-A;�$       B+�M	8eM#���A�*

Training_loss��:A��0$       B+�M	�˩#���A�*

Training_loss�_�A���$       B+�M	ɯ$���A�*

Training_loss/9�A��r~$       B+�M	urc$���A�*

Training_loss/XAʧ�$       B+�M	��$���A�*

Training_loss1P�@��Z5$       B+�M	�i�$���A�*

Training_loss�aA�'�$       B+�M	Q�@%���A�*

Training_lossX�SA�B�!$       B+�M	��%���A�*

Training_loss�\�@8U�>$       B+�M	�f�%���A�*

Training_loss���A����$       B+�M	�kX&���A�*

Training_lossxG�A�kW�$       B+�M	iV�&���A�*

Training_loss�OA�d�$       B+�M	�'���A�*

Training_loss!�%A�
6�$       B+�M	o�o'���A�*

Training_loss0(OA��K�$       B+�M	�j�'���A�*

Training_loss�'A(��B$       B+�M	��)(���A�*

Training_losst�zA,r��$       B+�M	zP�(���A�*

Training_lossF3A�t��$       B+�M	9|�(���A�*

Training_loss~eGAHT�_$       B+�M	'N>)���A�*

Training_lossH̻Ahg$       B+�M	W?�)���A�*

Training_lossS�A���$       B+�M	ܜ�)���A�*

Training_loss��B ���$       B+�M	�4S*���A�*

Training_loss k�@���$       B+�M	�=�*���A�*

Training_loss�CAqu��$       B+�M	�+���A�*

Training_loss�i�AB<_$       B+�M	��i+���A�*

Training_lossz�,A��,$       B+�M	���+���A�*

Training_loss�n�A�`-�$       B+�M	o$,���A�*

Training_loss�A�,�$       B+�M	�H�,���A�*

Training_loss�/�A�
�w$       B+�M	/��,���A�*

Training_loss�h�@�w*       ����	R~c-���A�*

Validation_accuracy;�m?���&       sO� 	4�c-���A�*

Validation_loss��BH�[$       B+�M	k�0���A�*

Training_loss<�9A�/�^$       B+�M	�u0���A�*

Training_loss�8A���$       B+�M	RI�0���A�*

Training_losst�eA&zc�$       B+�M	�E/1���A�*

Training_loss@�@AQmB�$       B+�M	�,�1���A�*

Training_loss���Aw���$       B+�M	��1���A�*

Training_loss�FUA�~g$       B+�M	8�E2���A�*

Training_loss�:AVL�$       B+�M	l�2���A�*

Training_loss��@��$       B+�M	� 3���A�*

Training_loss8Ћ@��u'$       B+�M	��\3���A�*

Training_loss��vA7���$       B+�M	��3���A�*

Training_loss£�@��@!$       B+�M	�.�3���A�*

Training_loss�AkV�0$       B+�M	�94���A�*

Training_loss\�<A��$       B+�M	!��4���A�*

Training_loss�B�@��
�$       B+�M	��4���A�*

Training_loss��A=���$       B+�M	�wS5���A�*

Training_loss�K�A�R��$       B+�M	8�5���A�*

Training_losse}�AX���$       B+�M	.�6���A�*

Training_loss薷@F��$       B+�M	v6���A�*

Training_lossP��A�v܀$       B+�M	gd�6���A�*

Training_lossn�A[���$       B+�M	�qK7���A�*

Training_lossZ�A;�_�$       B+�M	�+�7���A�*

Training_loss��QAiz�$       B+�M	�8���A�*

Training_loss��A�%ð$       B+�M	�c8���A�*

Training_lossԍ�A�w9�$       B+�M	^i�8���A�*

Training_loss��3A�j~$       B+�M	f�9���A�*

Training_loss��AA���$       B+�M	�Ё9���A�*

Training_loss1��A�/�$       B+�M	M��9���A�*

Training_loss��EA�A�$       B+�M	3�G:���A�*

Training_loss�Y_A��$       B+�M	�7�:���A�*

Training_loss���A&o=e$       B+�M	�A.;���A�*

Training_loss���A���$       B+�M	(ѓ;���A�*

Training_lossVm�@5�*$       B+�M	��;���A�*

Training_loss���A.��$       B+�M	�M<���A�*

Training_loss�VDA�q�*       ����	,�<���A�*

Validation_accuracy;�m?M˄#&       sO� 	�.�<���A�*

Validation_loss�BPu�$       B+�M	l[�?���A�*

Training_loss8��Am���$       B+�M	4h@���A�*

Training_loss�=�A~q�$       B+�M	q8�@���A�*

Training_loss�>LAS��=$       B+�M	l��@���A�*

Training_losslXA�fQ$       B+�M	��?A���A�*

Training_lossxӝA髯�$       B+�M	#��A���A�*

Training_loss��PA��$       B+�M	eB���A�*

Training_loss^*A�s$       B+�M	k�vB���A�*

Training_loss۝Ap�k$       B+�M	��B���A�*

Training_loss-b�A�H3$       B+�M	Z�pC���A�*

Training_loss�*+A�M,$       B+�M	�I�C���A�*

Training_lossp+�@�M��$       B+�M	�=gD���A�*

Training_loss�ǜA�{��$       B+�M	YߐD���A�*

Training_lossD�@�)�d$       B+�M	/oE���A�*

Training_loss6A��S8$       B+�M	��E���A�*

Training_loss��vAMƛ/$       B+�M	�=�E���A�*

Training_loss¸�A�E[�$       B+�M	��mF���A�*

Training_loss⁕A��#$       B+�M	s��F���A�*

Training_lossFpYA�j�$       B+�M	dEG���A�*

Training_loss��YA�w�$       B+�M	4e�G���A�*

Training_lossz
�A�?�0$       B+�M	��H���A�*

Training_loss��yA�t	 $       B+�M	��H���A�*

Training_loss� JA5�~�$       B+�M	��H���A�*

Training_loss���@]��$       B+�M	��rI���A�*

Training_lossa�fA
�\�$       B+�M	�I���A�*

Training_loss1��A����$       B+�M	d�QJ���A�*

Training_losss�>A��6U$       B+�M	rk�J���A�*

Training_loss��@89�$       B+�M	*�uK���A�*

Training_losst�&A���$       B+�M	���K���A�*

Training_lossT�bAƏ�$       B+�M	�xL���A�*

Training_lossQ�A6�v�$       B+�M	�u�L���A�*

Training_lossΈAu��D$       B+�M	3TM���A�*

Training_loss�1�A��Uq$       B+�M	B��M���A�*

Training_loss*A�,�$       B+�M	�IHN���A�*

Training_loss�$�AmE�*       ����	QK�N���A�*

Validation_accuracy;�m?6�h&       sO� 	�N�N���A�*

Validation_loss�MB��{$       B+�M	GZ�Q���A�*

Training_loss���A�]�$       B+�M	B[YR���A�*

Training_loss��A�T�$       B+�M	K��R���A�*

Training_loss�~jA.fR�$       B+�M	�fS���A�*

Training_loss�q�@���;$       B+�M	r1S���A�*

Training_loss`�Az#s$       B+�M	���S���A�*

Training_lossd>tA:�($       B+�M	��DT���A�*

Training_loss��?A�(�$       B+�M	�ǨT���A�*

Training_loss*3�A�$6$       B+�M	�r
U���A�*

Training_lossׯ�A��$       B+�M	��sU���A�*

Training_loss���@�X��$       B+�M	AF�U���A�*

Training_losse\A����$       B+�M	��9V���A�*

Training_loss�)|A��a�$       B+�M	���V���A�*

Training_loss[9A���X$       B+�M	Kw�V���A�*

Training_loss?u�@X[�$       B+�M	��W���A�*

Training_lossN�AJ��B$       B+�M	ꔁW���A�*

Training_losst7rAD:� $       B+�M	`��W���A�*

Training_lossF�0A&d��$       B+�M	��FX���A�*

Training_loss��@Z4x�$       B+�M	�X���A�*

Training_loss��fA�U�$       B+�M	zY���A�*

Training_lossD<A2�Al$       B+�M	ܡvY���A�*

Training_loss,�cAyA*�$       B+�M	��Y���A�*

Training_loss���@��z$       B+�M	�<Z���A�*

Training_loss���A�~*J$       B+�M	穡Z���A�*

Training_loss A�f��$       B+�M	�[���A�*

Training_loss5�YA�P�$       B+�M	�e[���A�*

Training_loss�UA]�B$       B+�M	�&�[���A�*

Training_loss�:)Am�E�$       B+�M	��&\���A�*

Training_loss�Q�A�*�<$       B+�M	(ֈ\���A�*

Training_loss�[�A�T�p$       B+�M	W#�\���A�*

Training_loss.N�AB=�=$       B+�M	:�O]���A�*

Training_loss��A��g�$       B+�M	{��]���A�*

Training_loss'_ATi�$       B+�M	�^���A�*

Training_loss(�AD�7�$       B+�M	��y^���A�*

Training_loss�A���*       ����	�,_���A�*

Validation_accuracy;1n?����&       sO� 	�/_���A�*

Validation_loss%�B�l�+$       B+�M	��a���A�*

Training_lossV��A�Õf$       B+�M	r�7b���A�*

Training_lossK}#A9�=T$       B+�M	�.�b���A�*

Training_loss>�@���$       B+�M	Ww�b���A�*

Training_lossr-=A�0�$       B+�M	��Xc���A�*

Training_loss&3A��$       B+�M	�d�c���A�*

Training_loss<.uA��/�$       B+�M	`d���A�*

Training_loss�tB� x$       B+�M	�k}d���A�*

Training_loss��Au��$       B+�M	���d���A�*

Training_loss ��A���1$       B+�M	��@e���A�*

Training_loss�nA�f�	$       B+�M	b��e���A�*

Training_loss�4)AK��E$       B+�M	Vef���A�*

Training_losss5*A�H�O$       B+�M	�\cf���A�*

Training_loss|��@��0$       B+�M	���f���A�*

Training_loss?AJ�)$       B+�M	8��f���A�*

Training_loss}_�@�P_u$       B+�M	k-Ig���A�*

Training_loss`�A�;�$       B+�M	;©g���A�*

Training_loss�2A%$       B+�M	_�h���A�*

Training_loss��/A�Ij�$       B+�M	��mh���A�*

Training_loss%T_AV��$       B+�M	�G�h���A�*

Training_lossNWdA�-�$       B+�M	�	1i���A�*

Training_loss8�#A'��S$       B+�M	Kʑi���A�*

Training_lossk��@y�l9$       B+�M	,��i���A�*

Training_loss^ �A�>�r$       B+�M	'Yj���A�*

Training_loss0�A�S��$       B+�M	h=�j���A�*

Training_loss�"�@���`$       B+�M	nk���A�*

Training_loss�޸@ۍ�i$       B+�M	��yk���A�*

Training_lossM��A�,��$       B+�M	���k���A�*

Training_lossyx)A��T�$       B+�M	��<l���A�*

Training_lossF�jA�q>_$       B+�M	֠l���A�*

Training_loss@}A=�b$       B+�M	��m���A�*

Training_losss�6A�F�$       B+�M	�cm���A�*

Training_loss]AA$�$       B+�M	I��m���A�*

Training_loss�TAn�e$       B+�M	�$n���A�*

Training_loss�wLA�I�J*       ����	���n���A�*

Validation_accuracy;1n?l^Ą&       sO� 	E��n���A�*

Validation_loss�2B�?��$       B+�M	�X�q���A�*

Training_loss=�A���$       B+�M	P�q���A�*

Training_loss>��A�4��$       B+�M	��[r���A�*

Training_loss��A�6�$       B+�M	�5�r���A�*

Training_loss�CTA�F�$       B+�M	fNs���A�*

Training_loss�nAV�|$       B+�M	ͫ}s���A�*

Training_loss��AC��d$       B+�M	e�s���A�*

Training_loss� �A����$       B+�M	ط>t���A�*

Training_loss\��@�T�$       B+�M	���t���A�*

Training_loss^@Aܘ[U$       B+�M	�=�t���A�*

Training_lossk��@ELD�$       B+�M	��eu���A�*

Training_lossk�DA���$       B+�M	pC�u���A�*

Training_lossJ؃A�њ&$       B+�M	�&v���A�*

Training_loss.�A�W]$       B+�M	�f�v���A�*

Training_loss�{A�@��$       B+�M	��v���A�*

Training_lossL8�A`�W�$       B+�M	�Qw���A�*

Training_lossvJQAeX��$       B+�M	��lw���A�*

Training_loss��fA�jܖ$       B+�M	�`�w���A�*

Training_loss��@���=$       B+�M	,,0x���A�*

Training_loss�#CAJ��$       B+�M	��x���A�*

Training_loss$?�A*���$       B+�M	�3�x���A�*

Training_loss�O0A��eB$       B+�M	�Ty���A�*

Training_loss�]�@����$       B+�M	���y���A�*

Training_loss64AZn$       B+�M	�~z���A�*

Training_loss��A�=�x$       B+�M	2vz���A�*

Training_loss��}A�("$       B+�M	���z���A�*

Training_losssW�@3k�{$       B+�M	�]7{���A�*

Training_loss��&A��ա$       B+�M	/ݗ{���A�*

Training_loss���@ ^�$       B+�M	� |���A�*

Training_loss��xABwV$       B+�M	�J_|���A�*

Training_lossbvA���$       B+�M	z��|���A�*

Training_loss��lA����$       B+�M	�b$}���A�*

Training_lossN�A	<�|$       B+�M	��}���A�*

Training_lossf5�A쪎�$       B+�M	C��}���A�*

Training_loss�.9A. *       ����	�m~���A�*

Validation_accuracy;�m?A��&       sO� 	�m~���A�*

Validation_lossL�BｬS$       B+�M	=HF����A�*

Training_loss�ވAEm�U$       B+�M	0�����A�*

Training_loss��iAh��$       B+�M	y����A�*

Training_loss�@�w�#$       B+�M	@�e����A�*

Training_loss�wA�$�$       B+�M	��Â���A�*

Training_lossg�yA���4$       B+�M	r�#����A�*

Training_lossXP%Arsٽ$       B+�M	B������A�*

Training_loss�I7Aw��9$       B+�M	������A�*

Training_loss��"@D�u$       B+�M	��>����A�*

Training_loss��@�d9�$       B+�M	�������A�*

Training_loss�SCA��+�$       B+�M	�h�����A�*

Training_loss�i/A:A�$       B+�M	F(^����A�*

Training_loss�a&AЧ��$       B+�M	�������A�*

Training_lossbccA��$       B+�M	C�����A�*

Training_loss�^�Ar�J�$       B+�M	}�{����A�*

Training_loss�eA�a��$       B+�M	��چ���A�*

Training_loss��yA��\
$       B+�M	������A�*

Training_lossɭo@H� �$       B+�M	��]����A�*

Training_loss�j<A�Tk�$       B+�M	z»����A�*

Training_loss\WAjc"$       B+�M	m�����A�*

Training_loss�V@�-]:$       B+�M	��}����A�*

Training_lossjƊAe��o$       B+�M	��ۈ���A�*

Training_loss��
A��vZ$       B+�M	��:����A�*

Training_lossn�,Ai��$       B+�M	0+�����A�*

Training_loss8�2A��B$       B+�M		�����A�*

Training_lossrx�A���$       B+�M	��k����A�*

Training_lossFA��l�$       B+�M	Ic̊���A�*

Training_loss�X�@��k$$       B+�M	G-����A�*

Training_loss*��@�G$       B+�M	������A�*

Training_loss�A�A|�$       B+�M	�F����A�*

Training_loss�A��6$       B+�M	K����A�*

Training_loss�87A�D��$       B+�M	8������A�*

Training_loss|+XA��1$       B+�M	qs����A�*

Training_loss��Atgf$       B+�M	�Dp����A�*

Training_lossb�cAf�#�*       ����	�������A�*

Validation_accuracy;�m?5"G�&       sO� 	H������A�*

Validation_lossd�BH��$       B+�M	�-Ԑ���A�*

Training_loss��BA4*V�$       B+�M	�2����A�*

Training_loss��;AW���$       B+�M	�������A�*

Training_loss�KA�\�$       B+�M	�`�����A�*

Training_loss��A�$       B+�M	w�W����A�*

Training_lossbSAn@`�$       B+�M	 �����A�*

Training_loss���A���$       B+�M	:�����A�*

Training_loss��A1�<z$       B+�M	c�t����A�*

Training_loss��A�r�$       B+�M	�oԓ���A�*

Training_lossg�A��:$       B+�M	v�1����A�*

Training_lossЙjA	`|$       B+�M	�@�����A�*

Training_loss��@:�G2$       B+�M	�����A�*

Training_loss`$A�j�$       B+�M	��M����A�*

Training_loss,L�A����$       B+�M	"9�����A�*

Training_loss���A dL$       B+�M	�)����A�*

Training_losss�WA$e��$       B+�M	��i����A�*

Training_lossp��A�١{$       B+�M	�Iɖ���A�*

Training_loss�S�A[L�$       B+�M	�M����A�*

Training_loss�A>ϴ�$       B+�M	}�J����A�*

Training_loss��-AUj�$       B+�M	�Z�����A�*

Training_lossi�mA���$       B+�M	k����A�*

Training_loss�U�A�6h?$       B+�M	�Po����A�*

Training_loss���A]���$       B+�M	�W͘���A�*

Training_lossOA�46�$       B+�M	�},����A�*

Training_lossA{��$       B+�M	3ފ����A�*

Training_loss�AA`�[z$       B+�M	6����A�*

Training_lossX��A��^�$       B+�M	t&M����A�*

Training_loss�2$A�0<�$       B+�M	�������A�*

Training_loss��qA^y7w$       B+�M	�{����A�*

Training_loss�IA��p$       B+�M	:$p����A�*

Training_lossh��AB#$       B+�M	.Vϛ���A�*

Training_loss
��@z7$       B+�M	C -����A�*

Training_losshE�Aev��$       B+�M	�s�����A�*

Training_loss�!�A+��$       B+�M	s�����A�*

Training_loss��NAL6�F*       ����	�9v����A�*

Validation_accuracy;1n?�h��&       sO� 	�=v����A�*

Validation_loss��BG�A$       B+�M	�ea����A�*

Training_loss�z@A|�u!$       B+�M	������A�*

Training_loss��BJ\g$       B+�M	og ����A�*

Training_loss4N�A݉k1$       B+�M	~����A�*

Training_loss�XA��$       B+�M	0ޡ���A�*

Training_loss���AT�U{$       B+�M	��;����A�*

Training_lossN�A(���$       B+�M	@Ú����A�*

Training_loss��lA�Β�$       B+�M	:;�����A�*

Training_loss��@��$       B+�M	�Y����A�*

Training_loss@�AN�4$       B+�M	�[�����A�*

Training_loss;� A����$       B+�M	]m����A�*

Training_loss3�4A���	$       B+�M	/v����A�*

Training_lossm�	A�$��$       B+�M	m�Ԥ���A�*

Training_lossHuA-�K�$       B+�M	8�3����A�*

Training_loss��,A�1%�$       B+�M	ޑ�����A�*

Training_loss:�A6#a�$       B+�M	�b����A�*

Training_loss\ZA��`�$       B+�M	C<N����A�*

Training_loss�)Af%��$       B+�M	������A�*

Training_loss���A@�U$       B+�M	�Ӧ���A�*

Training_loss �@F��$       B+�M	��8����A�*

Training_loss�aA����$       B+�M	�a�����A�*

Training_losspP�@>	,�$       B+�M	}����A�*

Training_loss��A���$       B+�M	k�R����A�*

Training_loss*��@�\��$       B+�M	������A�*

Training_loss֕�A����$       B+�M	!�����A�*

Training_loss�>�@#ٔp$       B+�M	��o����A�*

Training_loss��pAf��$       B+�M	3Ω���A�*

Training_loss��A��W$       B+�M	��-����A�*

Training_lossڈxA	�I�$       B+�M	"〉���A�*

Training_loss��A�n&�$       B+�M	7����A�*

Training_loss6�@��W$       B+�M	nL����A�*

Training_loss�+vA�6�$       B+�M	8K�����A�*

Training_loss�-B��$       B+�M	<0	����A�*

Training_loss}��@S�I$       B+�M	%�h����A�*

Training_lossA[A/��*       ����	-!�����A�*

Validation_accuracy;�m?�^X&       sO� 	-$�����A�*

Validation_loss:�B���$       B+�M	������A�*

Training_loss�ۈA���$       B+�M	Uhf����A�*

Training_loss�AH8��$       B+�M	�ư���A�*

Training_loss���@�p�$       B+�M	�%����A�*

Training_loss	�A6B�R$       B+�M	������A�*

Training_loss�'Az�$       B+�M	g����A�*

Training_loss 	�Aަ�/$       B+�M	�A����A�*

Training_loss'$A��G$       B+�M	@������A�*

Training_lossX|Az[,$       B+�M	ڮ	����A�*

Training_lossٺ�A��C'$       B+�M	qum����A�*

Training_loss�u�A+���$       B+�M	��˳���A�*

Training_loss���A�W$       B+�M	`+����A�*

Training_loss��[A?i�-$       B+�M	/������A�*

Training_loss�]ABӽ$       B+�M	O ����A�*

Training_loss&�`@*f�$       B+�M	vF����A�*

Training_loss��A .k�$       B+�M	�極���A�*

Training_loss��eAP�c$       B+�M	q ����A�*

Training_loss�_A�k�$       B+�M	f����A�*

Training_loss�A�LSm$       B+�M	�)Ŷ���A�*

Training_lossB.=ARΜ�$       B+�M	�����A�*

Training_loss���@���$       B+�M	&�H����A�*

Training_loss�{A�� �$       B+�M	�������A�*

Training_loss�KAEX�$       B+�M	?S����A�*

Training_loss�Au^$       B+�M	�If����A�*

Training_lossN��@@��$       B+�M	ȱø���A�*

Training_loss��xA�i�$       B+�M	f�"����A�*

Training_loss�AAqP`�$       B+�M	dW�����A�*

Training_lossX��@]�\$       B+�M	+N����A�*

Training_lossbqHA�N�$       B+�M	1	@����A�*

Training_loss\��@��,�$       B+�M	�)�����A�*

Training_loss�MAw �$       B+�M		������A�*

Training_lossb�A��##$       B+�M	(]����A�*

Training_loss��A�>t�$       B+�M	�������A�*

Training_lossB��A� �$       B+�M	�����A�*

Training_loss���@���*       ����	 b�����A�*

Validation_accuracy��l?;��&       sO� 	wd�����A�*

Validation_loss
gB�dWM$       B+�M	�L�����A�*

Training_loss�ګA�C��$       B+�M	������A�*

Training_lossmz(A���{$       B+�M	5�O����A�*

Training_loss�+�AR �$       B+�M	6������A�*

Training_losse��AU��$       B+�M	n����A�*

Training_lossHr]A�`�t$       B+�M	
k����A�*

Training_loss>�@���$       B+�M	�������A�*

Training_loss��YA+|$       B+�M	Y�'����A�*

Training_loss��A�E�$       B+�M	%#�����A�*

Training_loss�/Av��m$       B+�M	�X�����A�*

Training_loss_"xA�3&L$       B+�M	9�E����A�*

Training_lossxAˏ]�$       B+�M	�������A�*

Training_lossh�sA��L�$       B+�M	 ����A�*

Training_loss��A�|m$       B+�M	V,e����A�*

Training_loss�!�@��W$       B+�M	!W�����A�*

Training_loss���A8�
H$       B+�M	�!����A�*

Training_loss}��A��Z�$       B+�M	�0����A�*

Training_loss��Aa�G$       B+�M	������A�*

Training_lossblA�C�}$       B+�M	��A����A�*

Training_loss���@����$       B+�M	�v�����A�*

Training_losstbKA ؒ�$       B+�M	d������A�*

Training_loss�ko@|6�$       B+�M	��(����A�*

Training_loss�sjA�9$       B+�M	0/�����A�*

Training_loss�ݑ@�	;$       B+�M	0)�����A�*

Training_loss���A����$       B+�M	KXD����A�*

Training_loss��)As�Ȼ$       B+�M	~������A�*

Training_loss>ɄAz"tb$       B+�M	d�����A�*

Training_loss�|A #V�$       B+�M	�$e����A�*

Training_lossP��AJ�Y�$       B+�M	�@�����A�*

Training_loss�7�@վy$       B+�M	��#����A�*

Training_loss�MA��p+$       B+�M	ܽ�����A�*

Training_loss�`FAd8U-$       B+�M	#������A�*

Training_loss�E�@���$       B+�M	�m@����A�*

Training_loss m�A�L
9$       B+�M	<������A�*

Training_lossF�8AL�L�*       ����	��)����A�*

Validation_accuracy;1n?B*&       sO� 	\�)����A�*

Validation_loss�OB4� c$       B+�M	υV����A�*

Training_lossrGVA]�ٻ$       B+�M	g������A�*

Training_loss$�`A���p$       B+�M	������A�*

Training_lossT.A
em%$       B+�M	�s����A�*

Training_lossڑ�AT9G$       B+�M	�'�����A�*

Training_loss ��@5]K�$       B+�M	�[0����A�*

Training_loss�mAn��$       B+�M	�������A�*

Training_loss��@֫��$       B+�M	�F�����A�*

Training_loss���A�@(�$       B+�M	[	N����A�*

Training_loss��7A��>�$       B+�M	B\�����A�*

Training_loss���@N��G$       B+�M	�.
����A�*

Training_loss
A�O4$       B+�M	|,g����A�*

Training_loss� �A�>�$       B+�M	�������A�*

Training_loss�PA��U�$       B+�M	WA(����A�*

Training_loss� A�_�$       B+�M	�u�����A�*

Training_loss�sA�Oǝ$       B+�M	D�����A�*

Training_lossm`QA~)
�$       B+�M	+�O����A�*

Training_loss�lA
<	n$       B+�M	9~�����A�*

Training_loss�A���$       B+�M	�����A�*

Training_loss��A�-�g$       B+�M	�v����A�*

Training_losscIOA|�O$       B+�M	�����A�*

Training_loss��AA>2$       B+�M	������A�*

Training_loss�+o@��'�$       B+�M	ܽW����A�*

Training_loss&`sAW�s$       B+�M	W������A�*

Training_lossr��@��$       B+�M	V�����A�*

Training_loss�A��9 $       B+�M	gw����A�*

Training_lossX�/A����$       B+�M	w������A�*

Training_lossy,lA�c$       B+�M	��3����A�*

Training_loss��~A�$�H$       B+�M	�n�����A�*

Training_loss���A�v�$       B+�M	=������A�*

Training_loss��AW��$       B+�M	yT����A�*

Training_lossŧ�A%�Ht$       B+�M	=)�����A�*

Training_lossB� A��&$       B+�M	�a����A�*

Training_loss��A����$       B+�M	)�o����A�*

Training_loss�A�)��*       ����	p������A�*

Validation_accuracy;1n?���&       sO� 	̘�����A�*

Validation_loss�NB���$       B+�M	6����A�*

Training_lossVAkh9$       B+�M	/Pb����A�*

Training_loss�/9AY ��$       B+�M	�������A�*

Training_loss�!�@rz1$       B+�M	�� ����A�*

Training_loss3� A�*-�$       B+�M	dW~����A�*

Training_loss7,/A��$       B+�M	a������A�*

Training_loss���As�".$       B+�M	e�<����A�*

Training_loss�3�@�5��$       B+�M	곚����A�*

Training_loss`�@��I$       B+�M	������A�*

Training_loss��wA$�$       B+�M	��W����A�*

Training_loss��%A�aL$       B+�M	�ӷ����A�*

Training_loss/MA~{Ŭ$       B+�M	S^����A�*

Training_lossL(A�y��$       B+�M	-&u����A�*

Training_lossB�A���$       B+�M	�������A�*

Training_lossnaMA(Z%$       B+�M	��2����A�*

Training_lossƜ�A�?��$       B+�M	� �����A�*

Training_losss�tA�Fyg$       B+�M	�������A�*

Training_loss�NA���e$       B+�M	��Q����A�*

Training_lossZiA����$       B+�M	5�����A�*

Training_lossy�Ak���$       B+�M	������A�*

Training_loss7O�AO	^�$       B+�M	�uo����A�*

Training_loss�ՋA��$       B+�M	�������A�*

Training_loss���A[÷[$       B+�M	2 �����A�*

Training_loss�)A��ڗ$       B+�M	SS����A�*

Training_loss��}A!��$       B+�M	nL�����A�*

Training_loss��A�:��$       B+�M	C�����A�*

Training_loss�q�A��m$       B+�M	>{o����A�*

Training_losszָA��T+$       B+�M	�W�����A�*

Training_loss�A~��K$       B+�M	;�-����A�*

Training_loss��9A���$       B+�M	�ċ����A�*

Training_lossR�A ��~$       B+�M	;�����A�*

Training_loss�:3Az�/�$       B+�M	�YL����A�*

Training_loss
9�A�[$       B+�M	�n�����A�*

Training_loss��A/CY$       B+�M	]3����A�*

Training_lossW/�Aa#{�*       ����	C������A�*

Validation_accuracy;1m?;l�&       sO� 	m�����A�*

Validation_lossG=B�%�$       B+�M	������A�*

Training_lossa��@���$       B+�M	v������A�*

Training_loss<�A�G��$       B+�M	3�[����A�*

Training_loss,C�@����$       B+�M	c�����A�*

Training_loss!J A�w�t$       B+�M	������A�*

Training_loss�OAb��$       B+�M	�v����A�*

Training_loss���@ד�$       B+�M	/�����A�*

Training_lossI��@,zC�$       B+�M	X4����A�*

Training_loss^4�A���$       B+�M	oc�����A�*

Training_loss2�A&��$       B+�M	������A�*

Training_lossX�&Aw��F$       B+�M	�P����A�*

Training_loss���A}hq�$       B+�M	�Q�����A�*

Training_loss0�A2��d$       B+�M	�[����A�*

Training_loss>�A�$       B+�M	g�l����A�*

Training_loss.�@�U$       B+�M	�9�����A�*

Training_loss\�aA��&$       B+�M	�	,����A�*

Training_loss��l@s�T$       B+�M	cҌ����A�*

Training_lossx�QAq�Ϛ$       B+�M	�$�����A�*

Training_loss���@�=b$       B+�M	x)K����A�*

Training_loss��A~Ez$       B+�M	�u�����A�*

Training_loss�?�@��y$       B+�M	�f
����A�*

Training_loss�ڶ@�[�}$       B+�M	L�j����A�*

Training_loss�)A%��$       B+�M	k������A�*

Training_lossŖA���W$       B+�M	 ������A�*

Training_loss�m�?c���$       B+�M	u<O����A�*

Training_loss\��@�D�<$       B+�M	 ;�����A�*

Training_lossP@(A��S�$       B+�M	a	����A�*

Training_loss�%�A̹$       B+�M	*Th����A�*

Training_loss!uAqJ�"$       B+�M	�������A�*

Training_loss�!AUbK$       B+�M	�R%����A�*

Training_loss~),A���p$       B+�M	J������A�*

Training_lossz�lAN�:�$       B+�M	�������A�*

Training_loss-�A��)$       B+�M	��B����A�*

Training_loss�?A5��$       B+�M	l������A�*

Training_loss��7A��B*       ����	~�+����A�*

Validation_accuracy;1n?:	&       sO� 	��+����A�*

Validation_loss3JB\:�"$       B+�M	:�-����A�*

Training_loss�(A�uL
$       B+�M	ԍ����A�*

Training_loss��@��s�$       B+�M	�)�����A�*

Training_loss)�@kQ�$       B+�M	?�R����A�*

Training_lossXՏA�5D�$       B+�M	�5�����A�*

Training_loss��.A���[$       B+�M	� ���A�*

Training_loss��@���$       B+�M	��n ���A�*

Training_loss̲�@�U$       B+�M	qY� ���A�*

Training_loss��vArR��$       B+�M	[.���A�*

Training_loss�РAi\3�$       B+�M	D1����A�*

Training_lossu��@�v�$       B+�M	ё����A�*

Training_lossn��A��#�$       B+�M	ccI���A�*

Training_loss�"A�F��$       B+�M	Uڨ���A�*

Training_loss��@�juZ$       B+�M	�����A�*

Training_loss�pmA���$       B+�M	e���A�*

Training_loss�B�A:�Py$       B+�M	~����A�*

Training_loss6�$A����$       B+�M	M�"���A�*

Training_loss^ǯ@� �$       B+�M	�+����A�*

Training_loss��aA-8�$       B+�M	L�����A�*

Training_loss��@W�&$       B+�M	ȕ>���A�*

Training_loss驛@P�,F$       B+�M	������A�*

Training_loss݌A;[{�$       B+�M	PR����A�*

Training_loss:srA�u�$       B+�M	�-Y���A�*

Training_loss(~EA	r�T$       B+�M	8����A�*

Training_loss�[*Ae�T�$       B+�M	¡����A�*

Training_lossl�?���$       B+�M	�:���A�*

Training_losshL A2�g�$       B+�M	w����A�*

Training_loss��As�E�$       B+�M	y�����A�*

Training_loss#Y�@�/�$       B+�M	PX���A�*

Training_lossm.�Aލ1$       B+�M	������A�*

Training_loss�E�A��k+$       B+�M	�:	���A�*

Training_loss�xA���$       B+�M	�Ar	���A�*

Training_loss�@�t��$       B+�M	z�	���A�*

Training_lossz��Am�9�$       B+�M	�.
���A�*

Training_lossA����*       ����	닺
���A�*

Validation_accuracy;1n?�`|�&       sO� 	Ŏ�
���A�*

Validation_lossB�B��.$       B+�M	\����A�*

Training_lossWqA{\Ȫ$       B+�M	��T���A�*

Training_loss�S8A~���$       B+�M	������A�*

Training_lossv�4A�z�$       B+�M	����A�*

Training_loss�IA�d��$       B+�M	v���A�*

Training_losshBXA仓$       B+�M	������A�*

Training_loss7�3A�[rG$       B+�M	`�8���A�*

Training_loss�EA�	~N$       B+�M	�<����A�*

Training_lossǨ�@=��j$       B+�M	�#����A�*

Training_lossX�IA̐$       B+�M	9�S���A�*

Training_loss�/�@�=S~$       B+�M	����A�*

Training_loss��@A��a�$       B+�M	p&���A�*

Training_lossf��@U��$       B+�M	hAp���A�*

Training_loss�k�A@E$       B+�M	n�����A�*

Training_loss�`�A^�h$       B+�M	�L2���A�*

Training_loss��A$��$       B+�M	!͏���A�*

Training_loss�ZA�@(+$       B+�M	Y�����A�*

Training_loss<�FA�oJ$       B+�M	��L���A�*

Training_lossǱ�@2N��$       B+�M	������A�*

Training_lossS�Ac,$       B+�M	����A�*

Training_loss�YADM�$       B+�M	)�i���A�*

Training_loss��A�EZ�$       B+�M	�����A�*

Training_loss7>�@�6��$       B+�M	��%���A�*

Training_lossQ A.�D�$       B+�M	������A�*

Training_loss�@��$       B+�M	������A�*

Training_loss:�:A�wu$       B+�M	��
���A�*

Training_loss�@�ݪ�$       B+�M	=�i���A�*

Training_lossJZA1_��$       B+�M	@�����A�*

Training_loss �]A��.$       B+�M	�q&���A�*

Training_loss���@z0G�$       B+�M	Z�����A�*

Training_loss�A�$�$       B+�M	z����A�*

Training_lossf"�@؉��$       B+�M	ZE���A�*

Training_loss��|@���W$       B+�M	j����A�*

Training_lossHU�@:�d�$       B+�M	�x���A�*

Training_loss�A,r#*       ����	������A�*

Validation_accuracy;�n?NlN&       sO� 	������A�*

Validation_loss�uB(�B$       B+�M	2>����A�*

Training_lossj��A˘m�$       B+�M	�F���A�*

Training_loss�#�Al�v�$       B+�M	��d���A�*

Training_loss�Τ@��i�$       B+�M	 �����A�*

Training_losst��@\�%$       B+�M	bi)���A�*

Training_loss���@�Ă$       B+�M	z�����A�*

Training_lossUēA����$       B+�M	�.����A�*

Training_loss�A�+�$       B+�M	hyS ���A�*

Training_loss-�XA��?$       B+�M	m9� ���A�*

Training_loss��A�'�$       B+�M	t@!���A�*

Training_losss�^A���$       B+�M	"mt!���A�*

Training_loss��AVsY$       B+�M	���!���A�*

Training_loss@ Abf8$       B+�M	�~1"���A�*

Training_loss�lAVF:�$       B+�M	�:�"���A�*

Training_loss���AK���$       B+�M	78�"���A�*

Training_loss*�@!ȴ�$       B+�M	�ZM#���A�*

Training_loss�5�A��$       B+�M	���#���A�*

Training_lossڔ�@�\�N$       B+�M	��$���A�*

Training_loss���A���i$       B+�M	�2h$���A�*

Training_loss*m5@5��$       B+�M	>&�$���A�*

Training_loss�ڑA��g$       B+�M	�{%%���A�*

Training_lossM�@���$       B+�M	���%���A�*

Training_loss(��@|�mR$       B+�M	o��%���A�*

Training_lossNlA����$       B+�M	>�@&���A�*

Training_loss�8A�[�>$       B+�M	*�&���A�*

Training_loss�"&Ax�r�$       B+�M	� '���A�*

Training_lossA��$e$       B+�M	�~%'���A�*

Training_loss��?��q�$       B+�M	4��'���A�*

Training_losst6�AƜ�$       B+�M	���'���A�*

Training_losslֽ@���$       B+�M	e@(���A�*

Training_loss��8A�{$       B+�M	s+�(���A�*

Training_loss�"GA��w�$       B+�M	���(���A�*

Training_loss	�VAԞk�$       B+�M	Ҭ])���A�*

Training_lossUA<�[$       B+�M	`�)���A�*

Training_loss@�2A��*       ����	�H*���A�*

Validation_accuracy��m?�F�M&       sO� 	�H*���A�*

Validation_loss�Bneϊ$       B+�M	Ҍy-���A�*

Training_lossI�A���$       B+�M	s��-���A�*

Training_loss�MkA�J�$       B+�M	�i8.���A�*

Training_loss��jAJb�x$       B+�M	��.���A�*

Training_loss��\A�4�$       B+�M	���.���A�*

Training_lossQL�A���6$       B+�M	y>T/���A�*

Training_lossu5�@<���$       B+�M	7��/���A�*

Training_loss��AɌ�$       B+�M	#K0���A�*

Training_loss � @�c�$       B+�M	�	{0���A�*

Training_loss�LVAXQf�$       B+�M	!t�0���A�*

Training_loss|�l@��e�$       B+�M	��61���A�*

Training_loss	�XA9X�$       B+�M	]�1���A�*

Training_loss=.A��$       B+�M	���1���A�*

Training_loss��A��$       B+�M	�mQ2���A�*

Training_loss�Ik@#�[F$       B+�M	�?�2���A�*

Training_lossX AWs�y$       B+�M	��3���A�*

Training_loss�DA��$       B+�M	4�s3���A�*

Training_lossaޠ@)$       B+�M	S^�3���A�*

Training_loss��A��.$       B+�M	g�/4���A�*

Training_loss�;HA�V��$       B+�M	�?�4���A�*

Training_loss��@��Ly$       B+�M	{��4���A�*

Training_loss)#AN��H$       B+�M	�SN5���A�*

Training_lossL�A/��2$       B+�M	���5���A�*

Training_loss�b�AF\�$       B+�M	�
6���A�*

Training_loss
�=A�a��$       B+�M	Oh6���A�*

Training_loss��IA�9��$       B+�M	���6���A�*

Training_loss:UAH�Xm$       B+�M	eR#7���A�*

Training_loss��@9X'�$       B+�M	zPG7���A�*

Training_lossZ�d@?��<$       B+�M	Cť7���A�*

Training_loss2� A�^�O$       B+�M	Lm8���A�*

Training_loss=�@h�F$       B+�M	�
e8���A�*

Training_lossLU}At��-$       B+�M	�@�8���A�*

Training_loss��ZAA�$       B+�M	`� 9���A�*

Training_loss��GAO�g�$       B+�M	��9���A�*

Training_loss�T�@�`%*       ����	�$
:���A�*

Validation_accuracy��m?�`+$&       sO� 	c)
:���A�*

Validation_losspB�cգ$       B+�M	3U=���A�*

Training_loss���@L�|�$       B+�M	s��=���A�*

Training_loss�4A`&$       B+�M	�>���A�*

Training_loss�I4A��)[$       B+�M	p�u>���A�*

Training_loss�#�@��$       B+�M	��>���A�*

Training_loss��@�:(�$       B+�M	+�4?���A�*

Training_loss��>Ai�$       B+�M	ٓ?���A�*

Training_loss�?EA����$       B+�M	�[�?���A�*

Training_lossU�"Aj`G$       B+�M	�O@���A�*

Training_loss䜻@-�
S$       B+�M	�u�@���A�*

Training_loss��A���$       B+�M	�A���A�*

Training_loss"��A]�$       B+�M	�sA���A�*

Training_loss�@!A�!)�$       B+�M	ly�A���A�*

Training_loss.�5A4��$       B+�M	��.B���A�*

Training_loss\4�@\�+$       B+�M	/ލB���A�*

Training_loss�*WAU��^$       B+�M	���B���A�*

Training_loss�,7A�*	9$       B+�M	@�IC���A�*

Training_loss�[�A���$       B+�M	J�C���A�*

Training_loss�@47��$       B+�M	ٱD���A�*

Training_loss�nqA��ҭ$       B+�M	��cD���A�*

Training_lossO�@})�+$       B+�M	DQ�D���A�*

Training_loss�u>A��$       B+�M	>v!E���A�*

Training_lossr��@�i�`$       B+�M	��E���A�*

Training_lossq�(A�!to$       B+�M	���E���A�*

Training_loss�HA
P�P$       B+�M	�=F���A�*

Training_lossn3�@108$       B+�M	H5�F���A�*

Training_loss�6#A�1H�$       B+�M	�P�F���A�*

Training_loss��A,�@�$       B+�M	u�YG���A�*

Training_lossB��@!���$       B+�M	0�}G���A�*

Training_lossN�&@��[$       B+�M	���G���A�*

Training_loss�DA���*$       B+�M	�J9H���A�*

Training_lossO�@PA�$       B+�M	�ʖH���A�*

Training_lossptA���$       B+�M	F��H���A�*

Training_loss��A���$       B+�M	�iSI���A�*

Training_loss��@�Q�*       ����	�%�I���A�*

Validation_accuracy;�n?vV&       sO� 	�*�I���A�*

Validation_lossҨB���$       B+�M	�=M���A�*

Training_loss��A�i$       B+�M	�DqM���A�*

Training_loss@��@*��$       B+�M	#��M���A�*

Training_loss��A���&$       B+�M	�w/N���A�*

Training_loss���@���r$       B+�M	�h�N���A�*

Training_loss:�@k ��$       B+�M	Υ�N���A�*

Training_lossv�A�G�2$       B+�M	v�JO���A�*

Training_loss��Ae�Ba$       B+�M	$��O���A�*

Training_loss��A�rp$       B+�M	��P���A�*

Training_loss��<A��$       B+�M	��gP���A�*

Training_lossa�A��' $       B+�M	Y�P���A�*

Training_loss6�fA��;$       B+�M	��$Q���A�*

Training_loss��@G�4�$       B+�M	���Q���A�*

Training_loss��TA��~�$       B+�M	9��Q���A�*

Training_loss��YA�s�K$       B+�M	��@R���A�*

Training_loss5f�@��]$       B+�M	:z�R���A�*

Training_loss`u'A̯�$       B+�M	e9�R���A�*

Training_loss5n�@�w�$       B+�M	\[S���A�*

Training_loss�a9A��p$       B+�M	�S���A�*

Training_loss?S�A�3R�$       B+�M	��T���A�*

Training_loss��@���$       B+�M	�vT���A�*

Training_loss�V|A+��$       B+�M	̲�T���A�*

Training_loss�p@/���$       B+�M	/63U���A�*

Training_loss:�.A���$       B+�M	�?�U���A�*

Training_loss��7A��$       B+�M	h[�U���A�*

Training_loss� +A�^	e$       B+�M	��NV���A�*

Training_loss��aA~�=$       B+�M	"3�V���A�*

Training_loss��@��|$       B+�M	_�W���A�*

Training_lossi^A0��t$       B+�M	�5kW���A�*

Training_loss�Z�A���($       B+�M	ȎW���A�*

Training_loss���?��|E$       B+�M	��W���A�*

Training_loss�Ak�y$       B+�M	�:JX���A�*

Training_loss%�
A��6�$       B+�M	�s�X���A�*

Training_loss���@�[�:$       B+�M	!Y���A�*

Training_lossF��@�_��*       ����	PU�Y���A�*

Validation_accuracy��m?�g�y&       sO� 	�Y�Y���A�*

Validation_loss��B~���$       B+�M	���\���A�*

Training_lossY�@���$       B+�M	� ]���A�*

Training_lossTtA��\�$       B+�M	���]���A�*

Training_loss��QA���I$       B+�M	��]���A�*

Training_loss�|�@�Lк$       B+�M	#�C^���A�*

Training_loss�jAZ��3$       B+�M	���^���A�*

Training_loss�pAHl/$       B+�M	s�_���A�*

Training_loss� �@G��%$       B+�M	P`_���A�*

Training_loss�A�i$       B+�M	��_���A�*

Training_loss^��@�)�9$       B+�M	�`���A�*

Training_lossN��AʊR$       B+�M	T�{`���A�*

Training_loss2�hA�/ٜ$       B+�M	�:�`���A�*

Training_loss�6AΑs$       B+�M	%�8a���A�*

Training_loss�W�@9�W$       B+�M	��a���A�*

Training_loss���AF�_$       B+�M	���a���A�*

Training_lossv-�A6}�$       B+�M	}�Ub���A�*

Training_loss�zA�b�n$       B+�M	fk�b���A�*

Training_lossN�AVQ�$       B+�M	�`c���A�*

Training_losseA
r�<$       B+�M	z�qc���A�*

Training_loss�+�@�$6?$       B+�M	�V�c���A�*

Training_loss��5A2
N$       B+�M	30d���A�*

Training_loss�XAeׂ3$       B+�M	ݔ�d���A�*

Training_loss��A}K�$       B+�M	0��d���A�*

Training_lossP�@�p��$       B+�M	<�Ue���A�*

Training_lossR�A�/�$       B+�M	�m�e���A�*

Training_loss;?�@h��$       B+�M	Ωf���A�*

Training_loss�з@�|�v$       B+�M	�ltf���A�*

Training_loss@�A�$       B+�M	&V�f���A�*

Training_loss�$z@*���$       B+�M	>�1g���A�*

Training_loss
o�@��g_$       B+�M	ʩ�g���A�*

Training_loss��AW�H�$       B+�M	aq�g���A�*

Training_lossU͋@�O��*       ����	h@<h���A�*

Validation_accuracy�n?֢d&       sO� 	�B<h���A�*

Validation_lossxB�c��