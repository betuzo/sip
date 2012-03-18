package org.valledelbit.sip



import org.junit.*
import grails.test.mixin.*

@TestFor(ParametroPredialController)
@Mock(ParametroPredial)
class ParametroPredialControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/parametroPredial/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.parametroPredialInstanceList.size() == 0
        assert model.parametroPredialInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.parametroPredialInstance != null
    }

    void testSave() {
        controller.save()

        assert model.parametroPredialInstance != null
        assert view == '/parametroPredial/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/parametroPredial/show/1'
        assert controller.flash.message != null
        assert ParametroPredial.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/parametroPredial/list'


        populateValidParams(params)
        def parametroPredial = new ParametroPredial(params)

        assert parametroPredial.save() != null

        params.id = parametroPredial.id

        def model = controller.show()

        assert model.parametroPredialInstance == parametroPredial
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/parametroPredial/list'


        populateValidParams(params)
        def parametroPredial = new ParametroPredial(params)

        assert parametroPredial.save() != null

        params.id = parametroPredial.id

        def model = controller.edit()

        assert model.parametroPredialInstance == parametroPredial
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/parametroPredial/list'

        response.reset()


        populateValidParams(params)
        def parametroPredial = new ParametroPredial(params)

        assert parametroPredial.save() != null

        // test invalid parameters in update
        params.id = parametroPredial.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/parametroPredial/edit"
        assert model.parametroPredialInstance != null

        parametroPredial.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/parametroPredial/show/$parametroPredial.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        parametroPredial.clearErrors()

        populateValidParams(params)
        params.id = parametroPredial.id
        params.version = -1
        controller.update()

        assert view == "/parametroPredial/edit"
        assert model.parametroPredialInstance != null
        assert model.parametroPredialInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/parametroPredial/list'

        response.reset()

        populateValidParams(params)
        def parametroPredial = new ParametroPredial(params)

        assert parametroPredial.save() != null
        assert ParametroPredial.count() == 1

        params.id = parametroPredial.id

        controller.delete()

        assert ParametroPredial.count() == 0
        assert ParametroPredial.get(parametroPredial.id) == null
        assert response.redirectedUrl == '/parametroPredial/list'
    }
}
