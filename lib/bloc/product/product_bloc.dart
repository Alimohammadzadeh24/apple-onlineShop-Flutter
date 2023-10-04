import 'package:apple_online_shop/bloc/product/product_event.dart';
import 'package:apple_online_shop/bloc/product/product_state.dart';
import 'package:apple_online_shop/data/dependency_Injection/di.dart';
import 'package:apple_online_shop/data/repository/product_gallery_repository.dart';
import 'package:bloc/bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final IProductGalleryRepository _dataSource = locator.get();
  ProductBloc() : super(ProductInitialState()) {
    on<ProductInitialEvent>((event, emit) async {
      emit(ProductLoadingState());
      final response = await _dataSource.getGallery(event.productId);
      emit(ProductResponseSuccessState(response));
    });
  }
}
