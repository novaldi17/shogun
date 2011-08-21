# this was trancekoded by the awesome trancekoder
# ...and fixifikated by the awesum fixifikator
require 'modshogun'
require 'pp'

traindat = LoadMatrix.load_numbers('../data/fm_train_real.dat')
testdat = LoadMatrix.load_numbers('../data/fm_test_real.dat')
parameter_list=[[traindat,testdat,1.9],[traindat,testdat,1.7]]

def kernel_io_modular(fm_train_real=traindat,fm_test_real=testdat,width=1.9)
	
# *** 	feats_train=RealFeatures(fm_train_real)
	feats_train=Modshogun::RealFeatures.new
	feats_train.set_features(fm_train_real)
# *** 	feats_test=RealFeatures(fm_test_real)
	feats_test=Modshogun::RealFeatures.new
	feats_test.set_features(fm_test_real)


# *** 	kernel=GaussianKernel(feats_train, feats_train, width)
	kernel=Modshogun::GaussianKernel.new
	kernel.set_features(feats_train, feats_train, width)
	km_train=kernel.get_kernel_matrix()
# *** 	f=AsciiFile("gaussian_train.ascii","w")
	f=Modshogun::AsciiFile.new
	f.set_features("gaussian_train.ascii","w")
	kernel.save(f)
	del f

	kernel.init(feats_train, feats_test)
	km_test=kernel.get_kernel_matrix()
# *** 	f=AsciiFile("gaussian_test.ascii","w")
	f=Modshogun::AsciiFile.new
	f.set_features("gaussian_test.ascii","w")
	kernel.save(f)
	del f

	#clean up
	import os
	os.unlink("gaussian_test.ascii")
	os.unlink("gaussian_train.ascii")
	
	return km_train, km_test, kernel


end
if __FILE__ == $0
	puts 'Gaussian'
	kernel_io_modular(*parameter_list[0])

end
