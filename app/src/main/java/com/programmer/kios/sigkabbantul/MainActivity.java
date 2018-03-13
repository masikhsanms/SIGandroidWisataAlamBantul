package com.programmer.kios.sigkabbantul;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.MapFragment;
import com.google.android.gms.maps.OnMapReadyCallback;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.Marker;
import com.google.android.gms.maps.model.MarkerOptions;
import com.programmer.kios.sigkabbantul.app.AppController;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class MainActivity extends AppCompatActivity implements OnMapReadyCallback{

    MapFragment mapFragment;
    GoogleMap gMap;
    MarkerOptions markerOptions = new MarkerOptions();
    CameraPosition cameraPosition;
    LatLng center, latLng;
    String title;
    Double latt, longi;

    Button btn1,btn2,btn3,btn4,btn5;

    public static final String ID = "id";
    public static final String TITLE = "nama";
    public static final String LAT = "latt";
    public static final String LNG = "longi";

    private String url = "http://192.168.43.158/android/marker_google_map_api/get_wisata.php";

    String tag_json_obj = "json_obj_req";
    String jnswisata;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mapFragment = (MapFragment) getFragmentManager().findFragmentById(R.id.map);
        mapFragment.getMapAsync(this);

        btn1=(Button)findViewById(R.id.wisataalam);
        btn2=(Button)findViewById(R.id.wisatabudaya);
        btn3=(Button)findViewById(R.id.wisatasemua);
        btn4=(Button)findViewById(R.id.btnRest);
        btn5=(Button)findViewById(R.id.btnHotel);
    }

    public void onClickKategori(View view){
        Intent intent = null;

        switch (view.getId()){
            case R.id.wisataalam:
                intent = new Intent(MainActivity.this, MapWisataActivity.class);
                intent.putExtra("jnswisata", "1");
                startActivity(intent);
                finish();
                break;
            case R.id.wisatabudaya:
                intent = new Intent(MainActivity.this, MapWisataActivity.class);
                intent.putExtra("jnswisata", "2");
                startActivity(intent);
                finish();
                break;
            case R.id.wisatasemua:
                intent = new Intent(MainActivity.this, MainActivity.class);
                intent.putExtra("jnswisata", "3");
                startActivity(intent);
                finish();
                break;
            case R.id.btnRest:
                intent = new Intent(MainActivity.this, MapWisataActivity.class);
                intent.putExtra("jnswisata", "4");
                startActivity(intent);
                finish();
                break;
            case R.id.btnHotel:
                intent = new Intent(MainActivity.this, MapWisataActivity.class);
                intent.putExtra("jnswisata", "5");
                startActivity(intent);
                finish();
                break;

            default:
                break;

        }

    }

    @Override
    public void onMapReady(GoogleMap googleMap) {
        gMap = googleMap;

        // Mengarahkan ke Pasar Seni Gabusan
        center = new LatLng(-7.8777778,110.3488425);
        cameraPosition = new CameraPosition.Builder().target(center).zoom(10).build();
        googleMap.animateCamera(CameraUpdateFactory.newCameraPosition(cameraPosition));

        getMarkers();
    }

    private void addMarker(LatLng latlng, final String title) {
        markerOptions.position(latlng);
        markerOptions.title(title);
        gMap.addMarker(markerOptions);

        gMap.setOnInfoWindowClickListener(new GoogleMap.OnInfoWindowClickListener() {
            @Override
            public void onInfoWindowClick(Marker marker) {
                Intent intent = new Intent(MainActivity.this, DetailActivity.class);

                intent.putExtra("nama", title);
                intent.putExtra("latt", latt);
                intent.putExtra("longi", longi);

                startActivity(intent);
//                Toast.makeText(getApplicationContext(), marker.getTitle(), Toast.LENGTH_SHORT).show();
            }
        });
    }

    private void getMarkers() {
        StringRequest strReq = new StringRequest(Request.Method.POST, url, new Response.Listener<String>() {

            @Override
            public void onResponse(String response) {
                Log.e("Response: ", response.toString());

                try {
                    JSONObject jObj = new JSONObject(response);
                    String getObject = jObj.getString("wisata");
                    JSONArray jsonArray = new JSONArray(getObject);

                    for (int i = 0; i < jsonArray.length(); i++) {
                        JSONObject jsonObject = jsonArray.getJSONObject(i);
                        title = jsonObject.getString(TITLE);
                        latt = jsonObject.getDouble(LAT);
                        longi = jsonObject.getDouble(LNG);
                        latLng = new LatLng(Double.parseDouble(jsonObject.getString(LAT)), Double.parseDouble(jsonObject.getString(LNG)));

                        // Menambah data marker untuk di tampilkan ke google map
                        addMarker(latLng, title);
                    }

                } catch (JSONException e) {
                    // JSON error
                    e.printStackTrace();
                }

            }
        }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                Log.e("Error: ", error.getMessage());
                Toast.makeText(MainActivity.this, error.getMessage(), Toast.LENGTH_LONG).show();
            }
        });

        AppController.getInstance().addToRequestQueue(strReq, tag_json_obj);
    }


}
